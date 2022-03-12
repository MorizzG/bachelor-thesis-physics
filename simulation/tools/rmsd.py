#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 19 20:12:34 2022.

@author: mg
"""

from multiprocessing import Pool
from os import path

import gsd.hoomd
import numpy as np
import scipy.spatial


def rmsd(pos1, pos2):
    """
    Calculate the RMSD between two arrays os positions.

    Parameters
    ----------
    pos1 : numpy.ndarray
        First array of positions.
    pos2 : numpy.ndarray
        Second array of positions.

    Returns
    -------
    float64
        RMSD

    """
    mean_pos1 = np.mean(pos1, axis=0)

    norm1 = np.linalg.norm(pos1 - mean_pos1)

    mtx1, mtx2, M_sq = scipy.spatial.procrustes(pos1, pos2)

    # scipy.spatial.procrustes normalises both trajectories so that
    # the sum of all norms is equal to 1
    # we want the rmsd of the original positions, so we reverse it by multiplying by the norm
    return norm1 * np.sqrt(3 * ((mtx1 - mtx2) ** 2).mean())
