#!/usr/bin/env python
# coding: utf-8

import sys
import numpy as np
import pandas as pd
import hoomd.md
import datetime


class Cube:
    """
    This class is meant to represent a cube, which can be filled with a chosen amount points on random positions
    These particles will later form the initial configuration
    """

    def __init__(self, length):
        self.length = length
        self.random_points = 0

    def generate_points(self):
        self.random_points = np.random.uniform(0, 1, size=(self.length, 3))


def time_now():
    return datetime.datetime.now().strftime("%y-%m-%d-%H-%M-%S")


def make_contact_pairs(df_contact_pairs):
    # chromosomes are initially labelled as "chr17" or "chrX" for ch 20
    # we want them labelled by numbers instead: chr17 -> 17, chrX -> 20
    df_contact_pairs["chr_A"] = df_contact_pairs["chr_A"].apply(lambda s: "chr20" if s == "chrX" else s)
    df_contact_pairs["chr_A"] = df_contact_pairs["chr_A"].apply(lambda s: int(s[3:]))

    df_contact_pairs["chr_B"] = df_contact_pairs["chr_B"].apply(lambda s: "chr20" if s == "chrX" else s)
    df_contact_pairs["chr_B"] = df_contact_pairs["chr_B"].apply(lambda s: int(s[3:]))

    chr_min_pos = {}

    # calculate min pos for each chromosome
    for n in range(1, 21):
        chrn_minA = min(df_contact_pairs.loc[df_contact_pairs["chr_A"] == n]["pos_A"])
        chrn_minB = min(df_contact_pairs.loc[df_contact_pairs["chr_B"] == n]["pos_B"])

        chr_min_pos[n] = min(chrn_minA, chrn_minB)

    lengths = pd.read_pickle("data/chromosome_lengths.pkl")

    lengths_cumsum = np.array(np.cumsum(lengths))
    lengths_cumsum = np.insert(lengths_cumsum, 0, 0)

    # convert position on chromosomes to bead number
    # each bead is a bin of 100,000 chromosome positions
    # subtract the minimin position so our beads start at 0
    # which chromosome a bead belongs to will be later taken care of
    df_contact_pairs["ind_A"] = df_contact_pairs.apply(
        lambda row: (row["pos_A"] - chr_min_pos[row["chr_A"]]) // 100000 + lengths_cumsum[row["chr_A"] - 1],
        axis=1,
    )
    df_contact_pairs["ind_B"] = df_contact_pairs.apply(
        lambda row: (row["pos_B"] - chr_min_pos[row["chr_B"]]) // 100000 + lengths_cumsum[row["chr_B"] - 1],
        axis=1,
    )

    # df_contact_pairs["ind_A"] = df_contact_pairs.apply(
    #     lambda row: (row["pos_A"] - 3000000) // 100000 + lengths_cumsum[row["chr_A"] - 1],
    #     axis=1,
    # )
    # df_contact_pairs["ind_B"] = df_contact_pairs.apply(
    #     lambda row: (row["pos_B"] - 3000000) // 100000 + lengths_cumsum[row["chr_B"] - 1],
    #     axis=1,
    # )

    # drop self-interacting and neighbouring terms
    df_contact_pairs = df_contact_pairs.loc[
        (df_contact_pairs["ind_A"] != df_contact_pairs["ind_B"])
        & (df_contact_pairs["ind_A"] != df_contact_pairs["ind_B"] + 1)
        & (df_contact_pairs["ind_A"] != df_contact_pairs["ind_B"] - 1)
    ]

    return df_contact_pairs[["ind_A", "ind_B"]].values


def main():
    comment = time_now()  # This will be written as part of the filename
    num_cycles = 105

    if len(sys.argv) != 2:
        print("Invalid number of arguments")
        print("Usage: simulation.py [num]")
        print("where [num] is either 'all' or the number of the cell")
        return

    if sys.argv[1] == "all":
        cells = [1, 2, 3, 4, 5, 6, 7, 8]
    else:
        try:
            n = int(sys.argv[1])
            if n < 1 or n > 8:
                raise ValueError()
            cells = [n]
        except ValueError:
            print("Error: invalid cell number")
            return

    for n_cell in cells:
        # read the raw contact pair data from file
        df_contact_pairs = pd.read_csv(f"data/Cell{n_cell}_contact_pairs.txt", sep="\t")

        # convert that raw data to a numpy array of beads in contact
        contact_pairs = make_contact_pairs(df_contact_pairs)

        lengths = pd.read_pickle("data/chromosome_lengths.pkl")

        N_contact = contact_pairs.shape[0]  # number of contacts
        N_sum = lengths.sum()  # number of particles
        diff = len(lengths.keys())  # number of chromosomes

        # generate cube for initial configuration
        box = Cube(N_sum)
        box.generate_points()

        # define the hoomd snapshot
        hoomd.context.initialize("")
        s = hoomd.data.make_snapshot(
            N=N_sum,
            box=hoomd.data.boxdim(Lx=50000, Ly=50000, Lz=50000),
            particle_types=["A"],
            bond_types=["backbone", "contact"],
        )

        s.particles.typeid[:] = 0  # all particles of type A
        s.particles.position[:] = box.random_points[:, :]
        # resize the number of HOOMD-bonds: one from each bead to the next
        # minus 20 since the chromosomes are single chains
        # plus one for each contact
        s.bonds.resize(N_sum - diff + N_contact)

        # connect all particles of a chromosome to a chain
        # L = []
        # n_already_added = 0
        # for key in sorted(length.keys()):
        #     a = np.arange(n_already_added, n_already_added + length[key] - 1, dtype="int")
        #     b = a + 1
        #     n_already_added += length[key]
        #     L.append(np.column_stack((a,b)))
        #
        # # L = tuple(L)
        # final = np.vstack(L)

        # connect all particles of a chromosome to a chain
        x = np.arange(N_sum)
        K = np.column_stack((x, x + 1))  # connect particle N to N+1
        K = np.delete(K, np.cumsum(lengths.values) - 1, axis=0)  # delete bonds between chromosomes

        print(f"{N_sum} {K.shape[0]} {len(lengths)}")

        s.bonds.group[: N_sum - diff] = K
        s.bonds.group[N_sum - diff :] = contact_pairs  # connect all particles in contact
        s.bonds.typeid[: N_sum - diff] = 0  # Set id for chain bonds (bonds)
        s.bonds.typeid[N_sum - diff :] = 1  # Set id for contact bonds (contacts)

        # set potentials and their coefficients
        system = hoomd.init.read_snapshot(s)  # create dynamic system from snapshot
        nl = hoomd.md.nlist.tree()  # Verlet-style list
        # exclude particles already connected by bond or contact
        nl.reset_exclusions(exclusions=["bond"])

        # define excluded volume interaction
        gauss = hoomd.md.pair.gauss(r_cut=0.5, nlist=nl)
        gauss.pair_coeff.set("A", "A", epsilon=100.0, sigma=0.5)
        gauss.disable(log=True)

        # set the bond potential to harmonic bonds
        harmonic = hoomd.md.bond.harmonic()
        harmonic.bond_coeff.set("backbone", k=2000.0, r0=1.0)
        harmonic.bond_coeff.set("contact", k=2000.0, r0=1.5)

        # choose Langevin thermostat and integrator parameters
        all_ = hoomd.group.all()
        hoomd.md.integrate.mode_standard(dt=0.001)
        seed_langevin = np.random.randint(0, 100000)
        integrator = hoomd.md.integrate.langevin(group=all_, kT=1.0, seed=seed_langevin)

        # write potential energy to log and structures to gsd after every cycle
        per = int(18e4)
        hoomd.analyze.log(
            filename=f"log_all_cell{n_cell}_" + comment + ".log",
            quantities=["potential_energy", "temperature"],
            period=per,
            overwrite=True,
            phase=per - 1,
        )
        hoomd.dump.gsd(
            f"traj_all_cell{n_cell}_" + comment + ".gsd",
            period=per,
            group=all_,
            overwrite=True,
            dynamic=["property", "attribute"],
            phase=per - 1,
        )

        for i in range(1, 1 + num_cycles):
            print(120 * "-")
            print(f"Step {i} / {num_cycles}")
            hoomd.run(0.8e5)
            gauss.enable()
            gauss.pair_coeff.set("A", "A", epsilon=100.0, sigma=0.1, r_cut=0.4)
            hoomd.run(0.5e5)
            gauss.pair_coeff.set("A", "A", epsilon=100.0, sigma=1.0, r_cut=3.5)
            hoomd.run(0.5e5)
            gauss.disable()


if __name__ == "__main__":
    main()
