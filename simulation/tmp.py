import numpy as np
import pandas as pd

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


min_pos_A = {
    n: min(df_contact_pairs[df_contact_pairs["chr_A"] == n]["pos_A"])
    for n in range(1, 21)
}
min_pos_B = {
    n: min(df_contact_pairs[df_contact_pairs["chr_B"] == n]["pos_B"])
    for n in range(1, 21)
}

min_pos = {n: min(min_pos_A[n], min_pos_B[n]) for n in range(1, 21)}


max_pos_A = {
    n: max(df_contact_pairs[df_contact_pairs["chr_A"] == n]["pos_A"])
    for n in range(1, 21)
}
max_pos_B = {
    n: max(df_contact_pairs[df_contact_pairs["chr_B"] == n]["pos_B"])
    for n in range(1, 21)
}

max_pos = {n: max(max_pos_A[n], max_pos_B[n]) for n in range(1, 21)}


chr_len = {n: (max_pos[n] - min_pos[n]) + 1 for n in range(1, 21)}


df_contact_pairs["ind_A"] = df_contact_pairs.apply(
    lambda row: (row["pos_A"] - min_pos[row["chr_A"]]),
    axis=1,
)
df_contact_pairs["ind_B"] = df_contact_pairs.apply(
    lambda row: (row["pos_B"] - min_pos[row["chr_B"]]),
    axis=1,
)

df_contact_pairs = df_contact_pairs.sort_values(["chr_A", "chr_B", "pos_A", "pos_B"])

df_ref = pd.read_pickle("data/contact_pairs_jan/contact_pairs_cell2.pkl")
