#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Feb  5 13:51:41 2022

@author: mg
"""

import numpy as np

import gsd.hoomd

for n_cell in range(1, 9):

    f = gsd.hoomd.open(f"data/trajs/traj_cell{n_cell}.gsd")

    all_pos = np.stack([snap.particles.position for snap in f], axis=0)

    np.save(f"data/trajs_np/traj_np_cell{n_cell}.npy", all_pos)
