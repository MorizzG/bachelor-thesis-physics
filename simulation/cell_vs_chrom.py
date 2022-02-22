# -*- coding: utf-8 -*-
"""
Created on Mon Feb 21 16:09:55 2022.

@author: mg
"""
# %% Import
import gsd.hoomd
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from tools import rmsd
from tools.mg_plot import new_fig, set_styling

# %% Loading data

n_cell = 2
n_chrom = 6

f_cell = gsd.hoomd.open(f"data/trajs/traj_cell{n_cell}.gsd")
f_chrom = gsd.hoomd.open(f"data/trajs/traj_cell{n_cell}_chrom{n_chrom}.gsd")

chroms_lens = pd.read_pickle("data/chrom_lengths.pkl")
chroms_lens_cum = np.cumsum(chroms_lens)


# %% Data wrangling

pos_all_cell = np.stack([snap.particles.position for snap in f_cell])

pos_all_chrom = np.stack([snap.particles.position for snap in f_chrom])

chrom_start = chroms_lens_cum[n_chrom - 1] if n_chrom > 1 else 0
chrom_end = chroms_lens_cum[n_chrom]

# filter out positions of selected chromosomel
pos_all_cell = pos_all_cell[:, chrom_start:chrom_end, :]

assert (
    pos_all_cell.shape == pos_all_chrom.shape
), f"pos_all_cell shape {pos_all_cell.shape} and pos_all_chrom shape {pos_all_chrom.shape} don't match"


# %% RMSDS

rmsds_cell = np.empty(105)

for i in range(104):
    rmsds_cell[i] = rmsd.rmsd(pos_all_cell[i], pos_all_cell[-1])

rmsds_cell[-1] = 0


rmsds_chrom = np.empty(105)
chrom_ref_idx = -4

for i in range(105):
    if i == chrom_ref_idx:
        continue

    rmsds_chrom[i] = rmsd.rmsd(pos_all_chrom[i], pos_all_chrom[chrom_ref_idx])
rmsds_chrom[chrom_ref_idx] = 0


cross_rmsds = np.empty((105, 105))

for i_cell in range(105):
    for j_chrom in range(105):
        r = rmsd.rmsd(pos_all_cell[i_cell], pos_all_chrom[j_chrom])
        cross_rmsds[i_cell, j_chrom] = r

# %% Plot RMSDs

fig, ax = new_fig()

ax.plot(rmsds_cell)

ax.set_xlabel("Configuration")
ax.set_ylabel("RMSD")
set_styling(ax)

fig.suptitle("Cell RMSD")

fig, ax = new_fig()

ax.plot(rmsds_chrom)

ax.set_xlabel("Configuration")
ax.set_ylabel("RMSD")
set_styling(ax)

fig.suptitle("Chrom RMSD")


fig, ax = new_fig()

im = ax.imshow(cross_rmsds)

plt.colorbar(im)

ax.set_xlabel("Chrom Configuration")
ax.set_ylabel("Cell Configuration")
set_styling(ax)

fig.suptitle("Cell vs Chrom")

fig, ax = new_fig()

ax.plot(cross_rmsds[104, :])

ax.set_xlabel("Configuration")
ax.set_ylabel("RMSD")
set_styling(ax)

fig.suptitle("1 Cell vs all Chrom")
