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


def make_contact__pairs(df_contact_pairs):
    df_contact_pairs["chr_A"] = df_contact_pairs["chr_A"].apply(
        lambda s: "chr20" if s == "chrX" else s
    )
    df_contact_pairs["chr_A"] = df_contact_pairs["chr_A"].apply(lambda s: int(s[3:]))

    df_contact_pairs["chr_B"] = df_contact_pairs["chr_B"].apply(
        lambda s: "chr20" if s == "chrX" else s
    )
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

    df_contact_pairs["ind_A"] = df_contact_pairs.apply(
        lambda row: (row["pos_A"] - chr_min_pos[row["chr_A"]]) // 100000
        + lengths_cumsum[row["chr_A"] - 1],
        axis=1,
    )
    df_contact_pairs["ind_B"] = df_contact_pairs.apply(
        lambda row: (row["pos_B"] - chr_min_pos[row["chr_B"]]) // 100000
        + lengths_cumsum[row["chr_B"] - 1],
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
        df_contact_pairs = pd.read_csv(f"Cell{n_cell}_contact_pairs.txt", sep="\t")

        contact_pairs = make_contact_pairs(df_contact_pairs)

        df_length = pd.read_pickle("data/chromosome_lengths.pkl")

        N_contact = contact_pairs.shape[0]  # number of contacts
        N_sum = length.sum()  # number of particles
        diff = len(length.keys())  # number of chromosomes

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

        s.particles.typeid[:] = 0 # all particles of type A
        s.particles.position[:] = box.random_points[:, :]
        # resize the number of HOOMD-bonds: one from each bead to the next
        # minus 20 since the chromosomes are single chains
        # plus one for each contact
        s.bonds.resize(N_sum - diff + NContact)

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

        x = np.arange(N_sum)
        K = np.column_stack((x,x+1)) # connect particle N to N+1
        K = np.delete(K, np.cumsum(length.values)-1, axis=0) # delete bonds between chromosomes

        print(f"{N_sum} {K.shape[0]} {len(length.keys())}")

        s.bonds.group[:N_sum - diff] = K
        s.bonds.group[N_sum - diff:] = contact_pairs  # connect all particles in contact
        s.bonds.typeid[:N_sum - diff] = 0  # Set id for chain bonds (bonds)
        s.bonds.typeid[N_sum - diff:] = 1  # Set id for contact bonds (contacts)

        system = hoomd.init.read_snapshot(s)


if __name__ == "__main__":
    main()
