#!/usr/bin/env python
# coding: utf-8

# %% Imports

import numpy as np

# import pandas as pd
import gsd.hoomd

# from multiprocessing import Pool

from scipy.stats import rv_histogram

# from scipy.signal import savgol_filter

# import matplotlib.pyplot as plt

from tools.mg_plot import new_fig, set_styling


# %% Global Variables


cell_n = 2


# %% Read trajectory data


with gsd.hoomd.open(f"data/trajs/traj_cell{cell_n}.gsd", "rb") as f:

    # pos_all = np.array([f[n].particles.position for n in range(len(f))])

    # pos = pos_all[-1]

    # snap = f[-1]

    all_bonds = f[0].bonds.group
    typeid = f[0].bonds.typeid  # 0 -> bond; 1 -> contact

    bonds = all_bonds[typeid == 0]
    contacts = all_bonds[typeid == 1]

    all_pos = np.stack([snap.particles.position for snap in f])

N = len(all_pos[0])


# %% Calculate bond and contact distance distribution


bond_dists = np.linalg.norm(
    np.stack([pos[n] - pos[m] for (n, m) in bonds for pos in all_pos]), axis=1
)

contact_dists = np.linalg.norm(
    np.stack([pos[n] - pos[m] for (n, m) in contacts for pos in all_pos]), axis=1
)


rv_bonds = rv_histogram(np.histogram(bond_dists, "auto", density=True))

rv_contacts = rv_histogram(np.histogram(contact_dists, "auto", density=True))


# %% Plot contact and bond distance distribution

fig, ax = new_fig()

X = np.linspace(0, 3, num=1000)


# def pdf_bonds_smooth(x, window_length=21, window_width=0.07):
#     X = np.linspace(x - window_width, x + window_width, num=window_length)
#     return savgol_filter(rv_bonds.pdf(X), window_length, 3, axis=0)[10, :]


# def pdf_contacts_smooth(x, window_length=21, window_width=0.1):
#     X = np.linspace(x - window_width, x + window_width, num=window_length)
#     return savgol_filter(rv_contacts.pdf(X), window_length, 3, axis=0)[10, :]


ax.plot(X, rv_bonds.pdf(X), "C0-", label="bond length PDF")
ax.plot(X, rv_contacts.pdf(X), "C1-", label="contact length PDF")

(ylim_low, ylim_high) = ax.get_ylim()

ax.vlines(bond_dists.mean(), ylim_low - 1, ylim_high + 1, colors="C0")
ax.vlines(contact_dists.mean(), ylim_low - 1, ylim_high + 1, colors="C1")

print(f"Bonds average distance: {bond_dists.mean():.4}")
print(f"Contacts average distance: {contact_dists.mean():.4}")

ax.set_xlim(0, 3)
ax.set_ylim(ylim_low, ylim_high)

ax.set_xlabel("distance")
ax.set_ylabel("PDF")

set_styling(ax)

ax.legend()
