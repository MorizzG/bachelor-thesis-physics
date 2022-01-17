#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jan 15 20:33:17 2022

@author: mg
"""

import numpy as np
import pandas as pd

import matplotlib as mpl
import matplotlib.pyplot as plt

import gsd.hoomd

# from tools.mg_plot import new_fig, set_styling

import argparse
from multiprocessing import Pool


# %% Parse args


parser = argparse.ArgumentParser(description="Calculate chromosome contactivity")

arg_group = parser.add_argument(
    "cell_n",
    action="store",
    nargs="?",
    type=int,
    default=1,
    help="Which cell to calculate",
)

args = parser.parse_args()

cell_n = args.cell_n


# %% Load dist and bond data


def calc_contact_ratios(cell_n):

    print(f"Starting cell {cell_n}...")
    print()

    dists = np.load(f"data/dists/dists_cell{cell_n}.npy", allow_pickle=True)

    with gsd.hoomd.open(f"data/trajs/traj_cell{cell_n}.gsd", "rb") as f:

        # pos_all = np.array([f[n].particles.position for n in range(len(f))])

        # pos = pos_all[-1]

        # snap = f[-1]

        all_bonds = f[0].bonds.group
        typeid = f[0].bonds.typeid  # 0 -> bond; 1 -> contact

        bonds = all_bonds[typeid == 0]
        contacts = all_bonds[typeid == 1]

        # skip the first 5 configurations
        all_pos = np.stack([snap.particles.position for snap in f[5:]])

    N = len(all_pos[0])

    # 2.732 is calculated in distance_distribution.py as the 99.73% quartile
    # of the contact distance distribution
    is_contact = dists < 2.732

    # count number of contacts, remove diagonal (self-contacts) and divide by two
    # since each contact is twice in the symmetric matrix
    N_all_contacts = (np.count_nonzero(is_contact) - N) // 2

    N_bonds = len(bonds)
    N_contacts = len(contacts)

    chr_lens = pd.read_pickle(f"data/lengths_jan/chr_lens_cell{cell_n}.pkl").values

    # %% Calculate contacts between chromosomes

    # print(f"{N_bonds=}")
    # print(f"{N_contacts=}")
    # print(f"{N_all_contacts=}")

    # print()

    print(
        f"Percentage of contacts specified: {(N_bonds + N_contacts) / N_all_contacts * 100:.3} %"
    )

    print()

    chr_starts = np.insert(np.cumsum(chr_lens), 0, 0)

    chr_num_contacts = np.array(
        [
            [
                np.count_nonzero(
                    is_contact[
                        chr_starts[n] : chr_starts[n + 1],
                        chr_starts[m] : chr_starts[m + 1],
                    ]
                )
                for n in range(20)
            ]
            for m in range(20)
        ]
    )

    chr_contact_ratio = chr_num_contacts / np.outer(chr_lens, chr_lens)

    # set self-contact ratio to zero since it distorts the scale too much
    # other contact-ratios are basically zero compared to self-contacts
    for i in range(20):
        for j in range(i, 20):
            chr_contact_ratio[i, j] = 0

    return chr_contact_ratio

    # chr_contact_ratios[cell_n] = chr_contact_ratio


p = Pool()

chr_contact_ratios = list(map(calc_contact_ratios, range(1, 9)))

# %% Display chromosome contact ratios graphically

print("Plotting...")

norm = mpl.colors.Normalize(vmin=0, vmax=np.max(chr_contact_ratios))

fig, axes = plt.subplots(3, 3, figsize=(12, 14))

# axes = axes.flatten()

axes_flat = axes.ravel()

axes_flat[-1].set_frame_on(False)
axes_flat[-1].tick_params(left=False, bottom=False, labelleft=False, labelbottom=False)

for cell_n in range(8):
    axes_flat[cell_n].imshow(chr_contact_ratios[cell_n], norm=norm, cmap="plasma")

    axes_flat[cell_n].tick_params(
        left=False, bottom=False, labelleft=False, labelbottom=False
    )

fig.colorbar(mpl.cm.ScalarMappable(norm=norm, cmap="plasma"), ax=axes)

# set_styling(ax)
