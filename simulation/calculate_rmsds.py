#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 19 20:12:34 2022.

@author: mg
"""
print("starting")

import matplotlib.pyplot as plt
import numpy as np

# %% Setup


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


# %% Plot RMSD to last config for all cells

fig, axes = plt.subplots(3, 3, figsize=(10, 10))

axes_flat = axes.ravel()

axes_flat[-1].set_frame_on(False)
axes_flat[-1].tick_params(left=False, bottom=False, labelleft=False, labelbottom=False)

for i, ax in enumerate(axes_flat[:-1]):
    n_cell = i + 1

    rmsds = np.load(f"data/rmsds/rmsds_cell{n_cell}.npy")
    ax.plot(rmsds[-1])

    # rmsds_ref = calc_rmsds(f"data/trajs/jan/traj_cell{n_cell}.gsd")

    # ax.plot(rmsds_ref, "C1-")

    ax.set_xlabel(f"Configurations Cell {n_cell}")
    ax.set_ylabel("RMSD")
y_max = np.max([ax.get_ylim()[1] for ax in axes_flat])

fig.show()

for ax in axes_flat:
    ax.set_ylim(0, y_max)
# %% rmsd grouping

print("grouping\n")

n_cell = 5


rmsds = np.load(f"data/rmsds/rmsds_cell{n_cell}.npy")
idxs = set(range(105))

groups = []

while idxs:
    idx = list(idxs)[0]

    similar_configs = list(np.nonzero(rmsds[idx, :] < 6)[0])

    groups += [similar_configs]
    idxs -= set(similar_configs)
print(groups)

input()
