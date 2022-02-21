#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jan 15 20:33:17 2022.

@author: mg
"""

import argparse

import gsd.hoomd
import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import scipy.sparse

# from tools.mg_plot import new_fig, set_styling


# from multiprocessing import Pool


# %% Parse args


parser = argparse.ArgumentParser(description="Calculate chromosome contactivity")

arg_group = parser.add_argument(
    "cell_n", action="store", nargs="?", type=int, default=1, help="Which cell to calculate",
)

args = parser.parse_args()

cell_n = args.cell_n


# %% Load dist and bond data


def calc_contacts(cell_n):
    """
    Calculate the contact ratios between chromosomes for a cell.

    Parameters
    ----------
    cell_n : int
        Cell number

    Returns
    -------
    chr_contact_ratio : numpy.ndarray(shape=(20,20))
        Array of chromosome contact rations

    """
    print(f"Starting cell {cell_n}...")
    print()

    dists = np.load(f"data/dists/dists_cell{cell_n}.npy", allow_pickle=True)

    with gsd.hoomd.open(f"data/trajs/traj_cell{cell_n}.gsd", "rb") as f:

        # pos_all = np.array([f[n].particles.position for n in range(len(f))])

        # pos = pos_all[-1]

        # snap = f[-1]

        all_bonds = f[0].bonds.group
        typeid = f[0].bonds.typeid  # 0 -> bond; 1 -> contact

        # bonds = all_bonds[typeid == 0]
        contacts = all_bonds[typeid == 1]

        # skip the first 5 configurations
        all_pos = np.stack([snap.particles.position for snap in f[5:]])

    # 2x the expected bond length of 1.5
    contact_mat = dists < 3

    return contact_mat


def chr_contact_ratios(contact_mat):
    chr_lens = pd.read_pickle(f"data/lengths_jan/chr_lens_cell{cell_n}.pkl").to_numpy()

    chr_starts = np.insert(np.cumsum(chr_lens), 0, 0)

    chr_num_contacts = np.array(
        [
            [
                np.count_nonzero(contact_mat[chr_starts[n] : chr_starts[n + 1], chr_starts[m] : chr_starts[m + 1],])
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


# contact_mat = calc_contacts(1)

contact_mat_sparse = scipy.sparse.load_npz(f"data/contact_matrices/contact_matrix_cell{cell_n}.npz")

contact_mat = contact_mat_sparse.toarray()

num_neighbour_contacts = 0

for i in np.arange(contact_mat.shape[0] - 1):
    num_neighbour_contacts += contact_mat[i, i]
    num_neighbour_contacts += contact_mat[i, i + 1]
    num_neighbour_contacts += contact_mat[i + 1, i]

num_neighbour_contacts += contact_mat[-1, -1]

# count number of contacts, remove diagonal (self-contacts) and divide by two
# since each contact is twice in the symmetric matrix
N_all_contacts = (np.count_nonzero(contact_mat) - num_neighbour_contacts) // 2

with gsd.hoomd.open(f"data/trajs/traj_cell{cell_n}.gsd", "rb") as f:

    # pos_all = np.array([f[n].particles.position for n in range(len(f))])

    # pos = pos_all[-1]

    # snap = f[-1]

    all_bonds = f[0].bonds.group
    typeid = f[0].bonds.typeid  # 0 -> bond; 1 -> contact

    # bonds = all_bonds[typeid == 0]
    contacts = all_bonds[typeid == 1]

N_contacts = len(contacts)

print(f"Percentage of contacts specified: {N_contacts / N_all_contacts * 100:.3} %")

print()

X = np.arange(contact_mat.shape[0], step=100)

chrom_contact_mat = np.array(
    [[np.sum(contact_mat[X[i] : X[i + 1], X[j] : X[j + 1]]) for i in range(len(X) - 1)] for j in range(len(X) - 1)]
)

fig, ax = plt.subplots(figsize=(8, 6))

im = ax.imshow(chrom_contact_mat)
plt.colorbar(im)

# p = Pool()

# # chr_contact_ratios = list(map(calc_contact_ratios, range(1, 9)))

# # %% Display chromosome contact ratios graphically

# print("Plotting...")

# chr_contact_ratios /= np.max(chr_contact_ratios)

# norm = mpl.colors.Normalize(vmin=0, vmax=np.max(chr_contact_ratios))

# fig, axes = plt.subplots(3, 3, figsize=(12, 14))

# # axes = axes.flatten()

# axes_flat = axes.ravel()

# axes_flat[-1].set_frame_on(False)
# axes_flat[-1].tick_params(left=False, bottom=False, labelleft=False, labelbottom=False)

# for cell_n in range(8):
#     axes_flat[cell_n].imshow(chr_contact_ratios[cell_n], norm=norm, cmap="plasma")

#     # axes_flat[cell_n].tick_params(
#     #     left=False, bottom=False  # , labelleft=False, labelbottom=False
#     # )

# fig.colorbar(mpl.cm.ScalarMappable(norm=norm, cmap="plasma"), ax=axes)

# # set_styling(ax)


# # %% Calc means and stds

# ratios = np.stack(chr_contact_ratios)

# ratios = np.moveaxis(ratios, 0, -1)

# means = ratios.mean(axis=-1)

# stds = ratios.std(axis=-1)

# fig, axes = plt.subplots(1, 2, figsize=(14, 6))


# im1 = axes[0].imshow(means, cmap="plasma")
# fig.colorbar(im1, cmap="plasma", ax=axes[0])

# im2 = axes[1].imshow(stds, cmap="plasma")
# fig.colorbar(im2, cmap="plasma", ax=axes[1])
