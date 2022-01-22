#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 12 17:51:54 2022.

@author: mg
"""

import numpy as np
import pandas as pd


def remove_neighbours(df_contact_pairs):
    """
    Remove neighbouring contacts pairs.

    Parameters
    ----------
    df_contact_pairs : pandas.DataFrame
        data frame containing contact pair information

    Returns
    -------
    pandas.DataFrame
        data frame that has been stripped of neighbouring contacts

    """
    return df_contact_pairs.drop(
        df_contact_pairs[
            (df_contact_pairs["chr_A"] == df_contact_pairs["chr_B"])
            & (
                (df_contact_pairs["pos_A"] == df_contact_pairs["pos_B"] - 1)
                | (df_contact_pairs["pos_A"] == df_contact_pairs["pos_B"])
                | (df_contact_pairs["pos_A"] == df_contact_pairs["pos_B"] + 1)
            )
        ].index
    )


def min_ind(df, ch):
    """
    Return smallest index in a chromosome.

    Parameters
    ----------
    df : pandas.DataFrame
        Contact data
    ch : int
        number of chromosome

    Returns
    -------
    int
        minimum index

    """
    return min(min(df[df["chr_A"] == ch]["ind_A"]), min(df[df["chr_B"] == ch]["ind_B"]))


def max_ind(df, ch):
    """
    Return largest index in a chromosome.

    Parameters
    ----------
    df : pandas.DataFrame
        Contact data
    ch : int
        number of chromosome

    Returns
    -------
    int
        maximum index

    """
    return max(max(df[df["chr_A"] == ch]["ind_A"]), max(df[df["chr_B"] == ch]["ind_B"]))


def main():
    """Execute main function."""
    global df_contact_pairs, df_ref
    df_contact_pairs = pd.read_csv(
        "data/contact_pairs_raw/Cell2_contact_pairs.txt", sep="\t"
    )

    df_contact_pairs["chr_A"] = df_contact_pairs["chr_A"].apply(
        lambda s: "chr20" if s == "chrX" else s
    )
    df_contact_pairs["chr_A"] = df_contact_pairs["chr_A"].apply(lambda s: int(s[3:]))

    df_contact_pairs["chr_B"] = df_contact_pairs["chr_B"].apply(
        lambda s: "chr20" if s == "chrX" else s
    )
    df_contact_pairs["chr_B"] = df_contact_pairs["chr_B"].apply(lambda s: int(s[3:]))

    df_contact_pairs["pos_A"] = df_contact_pairs["pos_A"] // 100000
    df_contact_pairs["pos_B"] = df_contact_pairs["pos_B"] // 100000

    df_contact_pairs = remove_neighbours(df_contact_pairs)

    min_pos_A = {
        n: min(df_contact_pairs[df_contact_pairs["chr_A"] == n]["pos_A"])
        for n in range(1, 21)
    }
    min_pos_B = {
        n: min(df_contact_pairs[df_contact_pairs["chr_B"] == n]["pos_B"])
        for n in range(1, 21)
    }

    min_pos = {n: min(min_pos_A[n], min_pos_B[n]) for n in range(1, 21)}

    df_contact_pairs["ind_A"] = df_contact_pairs.apply(
        lambda row: (row["pos_A"] - min_pos[row["chr_A"]]),
        axis=1,
    )
    df_contact_pairs["ind_B"] = df_contact_pairs.apply(
        lambda row: (row["pos_B"] - min_pos[row["chr_B"]]),
        axis=1,
    )

    df_contact_pairs = df_contact_pairs.sort_values(
        ["chr_A", "chr_B", "pos_A", "pos_B"]
    )

    max_ind_A = {
        n: max(df_contact_pairs[df_contact_pairs["chr_A"] == n]["ind_A"])
        for n in range(1, 21)
    }
    max_ind_B = {
        n: max(df_contact_pairs[df_contact_pairs["chr_B"] == n]["ind_B"])
        for n in range(1, 21)
    }

    max_ind = [0] + [max(max_ind_A[n], max_ind_B[n]) for n in range(1, 21)]

    max_ind_cumsum = np.cumsum(max_ind) + np.arange(21)

    df_contact_pairs["ind_A"] = df_contact_pairs.apply(
        lambda row: (row["ind_A"] + max_ind_cumsum[row["chr_A"] - 1]),
        axis=1,
    )
    df_contact_pairs["ind_B"] = df_contact_pairs.apply(
        lambda row: (row["ind_B"] + max_ind_cumsum[row["chr_B"] - 1]),
        axis=1,
    )

    df_ref = pd.read_pickle("data/contact_pairs_jan/contact_pairs_cell2.pkl")


if __name__ == "__main__":
    main()
