#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 12 15:56:38 2022

@author: mg
"""

import numpy as np
import pandas as pd
import gsd.hoomd

from multiprocessing import Pool

p = Pool()

f = gsd.hoomd.open("trajs/traj_all_cell2_22-01-11-22-30-02.gsd", "rb")

snap = f[-1]

pos = snap.particles.position


def calc_all_dists(n):
    return np.linalg.norm(np.array([pos[n] - pos[m] for m in range(n)]))


dists = p.map(calc_all_dists, 10)
