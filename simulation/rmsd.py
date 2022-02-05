#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 19 20:12:34 2022.

@author: mg
"""

import numpy as np

import scipy.spatial

import matplotlib.pyplot as plt

import mdtraj

# import argparse


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


def calc_rmsds(cell_n, ref_idx=-1):
    """
    Calculate RMSD of all configurations in a cell with respect to a reference configuration.

    Parameters
    ----------
    cell_n : int
        Cell number
    ref_frame : int, optional
        Reference frame The default is -1.

    Returns
    -------
    numpy.array
        Array of RMSDs

    """
    pass


cell_n = 1
ref_idx = -1


traj = np.load(f"data/trajs_np/traj_np_cell{cell_n}.npy")

pos_ref = traj[ref_idx, :, :]

rmsd = np.empty(traj.shape[0])

for idx in range(traj.shape[0]):
    pos = traj[idx, :, :]

    mean_pos = np.mean(pos, axis=0)

    norm_pos = np.linalg.norm(pos - mean_pos)

    mtx1, mtx2, M = scipy.spatial.procrustes(pos, pos_ref)

    rmsd[idx] = norm_pos * np.sqrt(3 * ((mtx1 - mtx2) ** 2).mean())
# %% Plot

# fig, axes = plt.subplots(3, 3, figsize=(12, 14))

# # axes = axes.flatten()

# axes_flat = axes.ravel()

# axes_flat[-1].set_frame_on(False)
# axes_flat[-1].tick_params(left=False, bottom=False, labelleft=False, labelbottom=False)

# for i in range(8):

#     rmsds = calc_rmsds(i + 1, ref_frame=-2)

#     axes_flat[i].plot(rmsds)
#     axes_flat[i].set_xlabel(f"Configurations Cell {i+1}")
#     axes_flat[i].set_ylabel("RMSD")
