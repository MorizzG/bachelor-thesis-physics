#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 12 15:56:38 2022

@author: mg
"""

import numpy as np

# import pandas as pd
import gsd.hoomd
import sys

from multiprocessing import Pool

if len(sys.argv) != 2:
    print("Invalid number of arguments")
    print("Usage: simulation.py [num]")
    print("where [num] is either 'all' or the number of the cell")
    sys.exit(1)


try:
    cell_n = int(sys.argv[1])
    if cell_n < 1 or cell_n > 8:
        raise ValueError()
except ValueError:
    print("Error: invalid cell number")
    sys.exit(1)

f = gsd.hoomd.open(f"data/trajs/traj_cell{cell_n}.gsd", "rb")

snap = f[-1]

pos = snap.particles.position

len_pos = len(pos)


def calc_all_dists(n):
    return np.linalg.norm(np.array([pos[n] - pos[m] for m in range(len_pos)]), axis=1)


p = Pool()

dists = np.stack(p.map(calc_all_dists, range(len_pos)))

# s_dists = pd.Series(dists)

# s_dists.to_pickle(f"data/dists/dists_cell{cell_n}.pkl")

np.save(f"data/dists/dists_cell{cell_n}", dists)
