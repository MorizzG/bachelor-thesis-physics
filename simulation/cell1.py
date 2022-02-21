# -*- coding: utf-8 -*-
"""
Created on Mon Feb 21 14:29:41 2022.

@author: mg
"""

import gsd.hoomd
import matplotlib.pyplot as plt
import pandas as pd

n_cell = 1

df_log = pd.read_csv(f"data/logs/log_cell{n_cell}.log", sep="\t")
f = gsd.hoomd.open(f"data/trajs/traj_cell{n_cell}.gsd")

energies = df_log["potential_energy"].to_numpy()
