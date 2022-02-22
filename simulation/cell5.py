import gsd.hoomd
import matplotlib.pyplot as plt
import numpy as np
import tools.rmsd as rmsd
from tools.mg_plot import new_fig, set_styling

rmsd1 = rmsd.cell_file_rmsds("data/trajs/traj_cell5.gsd")
rmsd2 = rmsd.cell_file_rmsds("data/trajs/traj_cell5_1.gsd")
rmsd3 = rmsd.cell_file_rmsds("data/trajs/traj_cell5_2.gsd")

fig, (ax1, ax2, ax3) = plt.subplots(1, 3, sharey=True, figsize=(18, 6))

# ax1 = plt.subplot(121)

# ax2 = plt.subplot(122, sharey=ax1)

ax1.plot(rmsd1)

ax2.plot(rmsd2)

ax3.plot(rmsd3)

set_styling([ax1, ax2])


f1 = gsd.hoomd.open("data/trajs/traj_cell5.gsd")
f2 = gsd.hoomd.open("data/trajs/traj_cell5_1.gsd")
f3 = gsd.hoomd.open("data/trajs/traj_cell5_2.gsd")

pos1 = [snap.particles.position for snap in f1]
pos2 = [snap.particles.position for snap in f2]
pos3 = [snap.particles.position for snap in f3]

pos_all = np.stack(pos1 + pos2 + pos3, axis=0)

rmsds = np.empty(pos_all.shape[0])

for i in range(pos_all.shape[0] - 1):
    rmsds[i] = rmsd.rmsd(pos_all[i, :, :], pos_all[-1, :, :])

rmsds[-1] = 0


fig, ax = new_fig()


ax.plot(range(105), rmsds[:105], "C0-", label="Simulation 1")
ax.plot(range(105, 210), rmsds[105:210], "C1-", label="Simulation 2")
ax.plot(range(210, 315), rmsds[210:315], "C2-", label="Simulation 3")

ax.legend()

set_styling(ax)
