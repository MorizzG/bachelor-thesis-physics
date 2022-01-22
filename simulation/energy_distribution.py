#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jan 15 19:45:29 2022.

@author: mg
"""

# import numpy as np
import pandas as pd

# import matplotlib.pyplot as plt

from tools.mg_plot import new_fig, set_styling

import argparse


# %% Parse args


parser = argparse.ArgumentParser(
    description="Display potential energy distribution for simulation"
)

arg_group = parser.add_argument(
    "cell_n",
    action="store",
    nargs="?",
    type=int,
    default=1,
    help="Which cell to calculate",  # , nargs="*"
)

args = parser.parse_args()

cell_n = args.cell_n

cell_n = 4


# %% Plot energy distribution

df_log = pd.read_csv(f"data/logs/log_cell{cell_n}.log", sep="\t")


fig, ax = new_fig()

ax.plot(range(0, 105), df_log["potential_energy"], "C0.")

ax.set_xlabel("configuration number")
ax.set_ylabel("potential energy")

set_styling(ax)  # , y_loc=(2e5, 1e5)
