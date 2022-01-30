#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jan 29 21:09:32 2022

@author: mg
"""

# %% Imports

import numpy as np
import pandas as pd

import scipy.spatial

import matplotlib as mpl
import matplotlib.pyplot as plt

import gsd.hoomd

# from tools.mg_plot import new_fig, set_styling

import argparse

from multiprocessing import Pool

NUM_THREADS = 8


# %% Parse args

parser = argparse.ArgumentParser(description="Calculate chromosome contactivity")

arg_group = parser.add_argument(
    "cell_n",
    action="store",
    nargs="?",
    type=int,
    default=1,
    help="Which cell to calculate",
)

args = parser.parse_args()

cell_n = args.cell_n


# %% Read trajectory data

f = gsd.hoomd.open(f"data/trajs/traj_cell{cell_n}.gsd", "rb")

pos_all = np.stack([snap.particles.position for snap in f[5:]], axis=0)

N_particles = pos_all.shape[1]


# %% Calculate contact matrix


def calc_contact_matrix(n):
    print(f"Calcing snap {n}\n", end="")
    pos = pos_all[n, :, :]
    dists = scipy.spatial.distance_matrix(pos, pos)

    return dists < 3


num_contacts = np.zeros((N_particles, N_particles), dtype="int8")

snap_idxs = range(pos_all.shape[0])

p = Pool(NUM_THREADS)

while snap_idxs:
    idxs = snap_idxs[:NUM_THREADS]
    snap_idxs = snap_idxs[:NUM_THREADS]

    contacts_list = list(p.map(calc_contact_matrix, idxs))

    for contacts in contacts_list:
        num_contacts += contacts
