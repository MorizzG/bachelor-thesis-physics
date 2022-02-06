#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 19 20:12:34 2022.

@author: mg
"""

import numpy as np

import scipy.spatial

import matplotlib.pyplot as plt

# import mdtraj
import gsd.hoomd

# import argparse

from multiprocessing import Pool


# %% Parse args


# parser = argparse.ArgumentParser(description="Calculate chromosome contactivity")

# arg_group = parser.add_argument(
#     "cell_n",
#     action="store",
#     nargs="?",
#     type=int,
#     default=1,
#     help="Which cell to calculate",
# )

# args = parser.parse_args()

# cell_n = 2  # args.cell_n


# %% Load traj and calculate rmsd


def calc_rmsds(filepath, ref_idx=-1):
    """
    Calculate RMSD of all configurations in a cell with respect to a reference configuration.

    Parameters
    ----------
    filepath : str
        file path to gsd file of cell
    ref_frame : int, optional
        Reference frame The default is -1.

    Returns
    -------
    numpy.array
        Array of RMSDs

    """
    # all_pos = np.load(f"data/trajs_np/traj_np_cell{cell_n}.npy")
    traj = gsd.hoomd.open(filepath)

    all_pos = np.stack([snap.particles.position for snap in traj], axis=0)

    pos_ref = all_pos[ref_idx, :, :]

    rmsd = np.empty(all_pos.shape[0])

    for idx in range(all_pos.shape[0]):
        pos = all_pos[idx, :, :]

        mean_pos = np.mean(pos, axis=0)

        norm_pos = np.linalg.norm(pos - mean_pos)

        mtx1, mtx2, M = scipy.spatial.procrustes(pos, pos_ref)

        rmsd[idx] = norm_pos * np.sqrt(3 * ((mtx1 - mtx2) ** 2).mean())
    rmsd[ref_idx] = 0

    return rmsd


# %% Plot

fig, axes = plt.subplots(3, 3, figsize=(12, 12))

axes_flat = axes.ravel()

axes_flat[-1].set_frame_on(False)
axes_flat[-1].tick_params(left=False, bottom=False, labelleft=False, labelbottom=False)

for i, ax in enumerate(axes_flat[:-1]):
    n_cell = i + 1

    rmsds = calc_rmsds(f"data/trajs/traj_cell{n_cell}.gsd")

    ax.plot(rmsds)

    # rmsds_ref = calc_rmsds(f"data/trajs/jan/traj_cell{n_cell}.gsd")

    # ax.plot(rmsds_ref, "C1-")

    ax.set_xlabel(f"Configurations Cell {n_cell}")
    ax.set_ylabel("RMSD")
y_max = np.max([ax.get_ylim()[1] for ax in axes_flat])

for ax in axes_flat:
    ax.set_ylim(0, y_max)
# %% rmsd grouping

# n_cell = 1


# def f(ref_idx):
#     return calc_rmsds(f"data/trajs/traj_cell{n_cell}.gsd", ref_idx=ref_idx)


# if __name__ == "__main__":
#     print("starting")

#     try:
#         rmsds = np.load(f"data/rmsds/rmsds_cell{n_cell}.npy")
#     except FileNotFoundError:
#         print("RMSD file no found, rerunning calculation")

#         pool = Pool()

#         arr = pool.map(f, range(105))

#         rmsds = np.stack(arr)

#         np.save(f"data/rmsds/rmsds_cell{n_cell}.npy", rmsds)
#     idxs = set(range(105))

#     groups = []

#     while idxs:
#         idx = list(idxs)[0]

#         similar_configs = list(np.nonzero(rmsds[idx, :] < 6)[0])

#         groups += [similar_configs]

#         idxs -= set(similar_configs)
#     # %% Plot

#     fig, ax = plt.subplots(figsize=(8, 6))

#     ax.plot(rmsds[-1, :], "C0-")

#     # rmsds_ref = calc_rmsds(f"data/trajs/jan/traj_cell{n_cell}.gsd")

#     # ax.plot(rmsds_ref, "C1-")

#     ax.set_xlabel(f"Configurations Cell {n_cell}")
#     ax.set_ylabel("RMSD")
