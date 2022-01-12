#!/usr/bin/env python
# coding: utf-8

import numpy as np

# import pandas as pd
import gsd.hoomd

# from multiprocessing import Pool

from scipy.stats import rv_histogram
from scipy.signal import savgol_filter

import matplotlib.pyplot as plt

from mg_plot import new_fig, set_styling


with gsd.hoomd.open("trajs/traj_all_cell1_22-01-10-22-01-18.gsd", "rb") as f:

    # pos_all = np.array([f[n].particles.position for n in range(len(f))])

    # pos = pos_all[-1]

    # snap = f[-1]

    all_bonds = f[0].bonds.group
    typeid = f[0].bonds.typeid  # 0 -> bond; 1 -> contact

    bonds = all_bonds[typeid == 0]
    contacts = all_bonds[typeid == 1]

    all_pos = np.stack([snap.particles.position for snap in f])

N = len(all_pos[0])

bond_dists = np.linalg.norm(
    np.stack([pos[n] - pos[m] for (n, m) in bonds for pos in all_pos]), axis=1
)

contact_dists = np.linalg.norm(
    np.stack([pos[n] - pos[m] for (n, m) in contacts for pos in all_pos]), axis=1
)


rv_bonds = rv_histogram(np.histogram(bond_dists, "auto", density=True))

rv_contacts = rv_histogram(np.histogram(contact_dists, "auto", density=True))


# print("plotting...")

fig, ax = new_fig()

# plt.hist(bond_dists, bins=200, density=True)

X = np.linspace(0, 3, num=1000)


def pdf_bonds_smooth(x, window_length=21, window_width=0.07):
    # w = np.hanning(window_length)
    # w = w / w.sum()
    # X = np.linspace(x - 0.2, x + 0.2, num=window_width)
    # return np.dot(w, rv_bonds.pdf(X))
    X = np.linspace(x - window_width, x + window_width, num=window_length)
    return savgol_filter(rv_bonds.pdf(X), window_length, 3, axis=0)[10, :]


def pdf_contacts_smooth(x, window_length=21, window_width=0.1):
    # w = np.hanning(window_width)
    # w = w / w.sum()
    # X = np.linspace(x - 0.2, x + 0.2, num=window_width)
    # return np.dot(w, rv_contacts.pdf(X))
    X = np.linspace(x - window_width, x + window_width, num=window_length)
    return savgol_filter(rv_contacts.pdf(X), window_length, 3, axis=0)[10, :]


ax.plot(X, rv_bonds.pdf(X), "C0-", label="bond length PDF")
ax.plot(X, rv_contacts.pdf(X), "C1-", label="contact length PDF")

ax.vlines(bond_dists.mean(), -1, 4, colors="C0")
ax.vlines(contact_dists.mean(), -1, 4, colors="C1")

print(f"Bonds average distance: {bond_dists.mean():.4}")
print(f"Contacts average distance: {contact_dists.mean():.4}")

ax.set_xlim(0, 3)
ax.set_ylim(-0.1, 3.3)

ax.set_xlabel("distance")
ax.set_ylabel("PDF")

set_styling(ax)

ax.legend()
