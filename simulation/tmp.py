import pandas as pd
import numpy as np

cps = {}
chr_min_pos = {}

for cell_n in range(1, 9):
    cp_raw = pd.read_csv(f"data/Cell{cell_n}_contact_pairs.txt", sep="\t")

    # chr_A and chr_B are labeled as "chr{n}" for n=1..19 or "chrX"
    # first rename "chrX" -> "chr
    cp_raw["chr_A"] = cp_raw["chr_A"].apply(lambda s: "chr20" if s == "chrX" else s)
    cp_raw["chr_A"] = cp_raw["chr_A"].apply(lambda s: int(s[3:]))

    cp_raw["chr_B"] = cp_raw["chr_B"].apply(lambda s: "chr20" if s == "chrX" else s)
    cp_raw["chr_B"] = cp_raw["chr_B"].apply(lambda s: int(s[3:]))

    chr_min_pos[cell_n] = {}

    # calculate min pos for each chromosome
    for n in range(1, 21):
        chrn_minA = min(cp_raw.loc[cp_raw["chr_A"] == n]["pos_A"])
        chrn_minB = min(cp_raw.loc[cp_raw["chr_B"] == n]["pos_B"])

        chr_min_pos[cell_n][n] = min(chrn_minA, chrn_minB)

    lengths = pd.read_pickle("data/chromosome_lengths.pkl")

    lengths_cumsum = np.array(np.cumsum(lengths))
    lengths_cumsum = np.insert(lengths_cumsum, 0, 0)

    cp_raw["ind_A"] = cp_raw.apply(
        lambda row: (row["pos_A"] - chr_min_pos[cell_n][row["chr_A"]]) // 100000
        + lengths_cumsum[row["chr_A"] - 1],
        axis=1,
    )
    cp_raw["ind_B"] = cp_raw.apply(
        lambda row: (row["pos_B"] - chr_min_pos[cell_n][row["chr_B"]]) // 100000
        + lengths_cumsum[row["chr_B"] - 1],
        axis=1,
    )

    # cp_raw["ind_A"] = cp_raw.apply(
    #     lambda row: (row["pos_A"] - 3000000) // 100000 + lengths_cumsum[row["chr_A"] - 1],
    #     axis=1,
    # )
    # cp_raw["ind_B"] = cp_raw.apply(
    #     lambda row: (row["pos_B"] - 3000000) // 100000 + lengths_cumsum[row["chr_B"] - 1],
    #     axis=1,
    # )

    # drop self-interacting and neighbouring terms
    cp_raw = cp_raw.loc[
        (cp_raw["ind_A"] != cp_raw["ind_B"])
        & (cp_raw["ind_A"] != cp_raw["ind_B"] + 1)
        & (cp_raw["ind_A"] != cp_raw["ind_B"] - 1)
    ]

    cps[cell_n] = cp_raw.sort_values(by=["chr_A", "chr_B", "ind_A", "ind_B"], ignore_index=True)
