# -*- coding: utf-8 -*-
"""
Created on Tue Mar 15 18:11:22 2022.

@author: mg
"""
# %% Imports

import gsd.hoomd
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import tools.rmsd as rmsd
from tools.constants import NUM_PARTICLES
from tools.mg_plot import new_fig, set_styling

np.set_printoptions(precision=3)


make_plots = False

# %% RMSD for all cells

print("start")

ext = ""

avg_trajs = np.empty((8, NUM_PARTICLES, 3))

if make_plots:
    fig, axs = new_fig(nrows=4, ncols=2, sharex=True, figsize=(8, 7))

    axs = axs.flatten()

for idx, n_cell in enumerate(range(1, 9)):
    traj = gsd.hoomd.open(f"data/trajs/traj_cell{n_cell}{ext}.gsd")

    pos_all = np.stack([snap.particles.position for snap in traj])

    pos_filtered = None

    idx_filtered = None

    if n_cell == 1:
        # filter frames by energy, drop high energy frames
        ENERGY_CUTOFF = 1.495e7  # from cell1.py

        df_log = pd.read_csv("data/logs/log_cell1.log", sep="\t")
        energies = df_log["potential_energy"].to_numpy()

        low_energy_configs = np.nonzero(energies < ENERGY_CUTOFF)[0]

        pos_filtered = pos_all[low_energy_configs, :, :]
    elif n_cell == 5:
        # drop all frames before 39, since high energy
        pos_filtered = pos_all[39:, :, :]
    # elif n_cell == 4:
    #     drop_idxs = np.array([2, 6, 22, 49, 64, 74, 85, 90, 96])
    #     pos_filtered = np.delete(pos_all, drop_idxs, axis=0)
    else:
        # for all other cells, simply drop first 5 frames
        pos_filtered = pos_all[5:, :, :]

    avg_trajs[idx, :, :] = rmsd.average_trajectory(pos_filtered)

    rmsds_last = np.empty(pos_all.shape[0])

    rmsds_avg = np.empty(pos_all.shape[0])

    for jdx in range(pos_all.shape[0]):
        rmsds_last[jdx] = rmsd.rmsd(pos_all[jdx, :, :], pos_all[-1, :, :])

        rmsds_avg[jdx] = rmsd.rmsd(pos_all[jdx, :, :], avg_trajs[idx, :, :])
    # fig, ax = new_fig()

    if make_plots:
        axs[idx].plot(rmsds_last, "C0-", label="RMSD to last")
        axs[idx].plot(rmsds_avg, "C1--" if n_cell in [1, 5] else "C1-", label="RMSD to avg.")

        axs[idx].set_title(f"Cell {n_cell}", fontdict={"fontsize": 10})

    mean = None
    std = None

    if n_cell == 1:
        mean = rmsds_avg[low_energy_configs].mean()
        std = rmsds_avg[low_energy_configs].std()
    elif n_cell == 5:
        mean = rmsds_avg[39:].mean()
        std = rmsds_avg[39:].std()
    # elif n_cell == 4:
    #     drop_idxs = np.array([2, 6, 22, 49, 64, 74, 85, 90, 96])
    #     rmsds_avg_filtered = np.delete(rmsds_avg, drop_idxs, axis=0)
    #     mean = rmsds_avg_filtered.mean()
    #     std = rmsds_avg_filtered.std()
    else:
        mean = rmsds_avg[5:].mean()
        std = rmsds_avg[5:].std()
    print(f"Mean RMSD to avg for cell {n_cell}: {mean:.2f} +/- {std:.2f}")
    print()

if make_plots:
    axs[6].set_xlabel("frame")
    axs[0].set_ylabel("RMSD")

    axs[1].legend(loc=(0.32, 0.3))

    set_styling(axs)

# fig.suptitle(f"Cell {n_cell}")


# %% RMSD for cell 4 filtered

ext = ""

avg_traj = np.empty((NUM_PARTICLES, 3))

# axs = axs.flatten()

n_cell = 4
traj = gsd.hoomd.open(f"data/trajs/traj_cell{n_cell}{ext}.gsd")

pos_all = np.stack([snap.particles.position for snap in traj])

pos_filtered = None

idx_filtered = None

if n_cell == 1:
    # filter frames by energy, drop high energy frames
    ENERGY_CUTOFF = 1.495e7  # from cell1.py

    df_log = pd.read_csv("data/logs/log_cell1.log", sep="\t")
    energies = df_log["potential_energy"].to_numpy()

    low_energy_configs = np.nonzero(energies < ENERGY_CUTOFF)[0]

    pos_filtered = pos_all[low_energy_configs, :, :]
elif n_cell == 5:
    # drop all frames before 39, since high energy
    pos_filtered = pos_all[39:, :, :]
elif n_cell == 4:
    drop_idxs = np.array([2, 6, 22, 49, 64, 74, 85, 90, 96])
    pos_filtered = np.delete(pos_all, drop_idxs, axis=0)
else:
    # for all other cells, simply drop first 5 frames
    pos_filtered = pos_all[5:, :, :]
avg_traj[:, :] = rmsd.average_trajectory(pos_filtered)

rmsds_last = np.empty(pos_all.shape[0])

rmsds_avg = np.empty(pos_all.shape[0])

for jdx in range(pos_all.shape[0]):
    rmsds_last[jdx] = rmsd.rmsd(pos_all[jdx, :, :], pos_all[-1, :, :])

    rmsds_avg[jdx] = rmsd.rmsd(pos_all[jdx, :, :], avg_traj[:, :])
# fig, ax = new_fig()

# ax.plot(rmsds_last, "C0-", label="RMSD to last")
# ax.plot(rmsds_avg, "C1--" if n_cell in [1, 5] else "C1-", label="RMSD to avg.")

# ax.set_title(f"Cell {n_cell}", fontdict={"fontsize": 10})

# set_styling(ax)

mean = None
std = None

if n_cell == 1:
    mean = rmsds_avg[low_energy_configs].mean()
    std = rmsds_avg[low_energy_configs].std()
elif n_cell == 5:
    mean = rmsds_avg[39:].mean()
    std = rmsds_avg[39:].std()
elif n_cell == 4:
    drop_idxs = np.array([2, 6, 22, 49, 64, 74, 85, 90, 96])
    rmsds_avg_filtered = np.delete(rmsds_avg, drop_idxs, axis=0)
    mean = rmsds_avg_filtered.mean()
    std = rmsds_avg_filtered.std()
else:
    mean = rmsds_avg[5:].mean()
    std = rmsds_avg[5:].std()
print()
print(f"Mean RMSD to avg for cell {n_cell}: {mean:.2f} +/- {std:.2f}")
print()


# %% Cross RMSDs

cross_rmsds = np.empty((8, 8))

for idx in range(8):
    for jdx in range(8):
        if idx != jdx:
            r = rmsd.rmsd(avg_trajs[idx], avg_trajs[jdx])

            cross_rmsds[idx, jdx] = r
            cross_rmsds[jdx, idx] = r
        else:
            cross_rmsds[idx, jdx] = 0

print(cross_rmsds)
