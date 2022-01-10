import numpy as np

import gsd.hoomd

import quaternions


from scipy.optimize import minimize


def centre(x):
    return x - x.mean(axis=0)


def rmsd(x, ref):
    return np.sqrt(np.sum((x - ref) ** 2) / len(x))


def cost(angles, xy):
    [th, phi, psi] = angles
    x = xy[0]
    y = xy[1]
    rot = quaternions.Quaternion.from_angles(th, phi, psi).to_rotation_matrix()
    return np.sum((x - np.apply_along_axis(lambda v: np.dot(rot, v), 1, y)) ** 2)


if __name__ == "__main__":
    f = gsd.hoomd.open(name="../trajs/traj_all_cell2_21-12-28-01-26-03.gsd", mode="rb")

    N = f[0].particles.N

    pos = np.array([f[i].particles.position for i in range(len(f))])

    mean_pos = pos.mean(axis=0)

    opt = minimize(cost, [0, 0, 0], args=((pos[-1], mean_pos),))

    print(opt)

    print()

    print(cost([0, 0, 0], (pos[-1], mean_pos)))

    print()

    print(cost(opt.x, (pos[-1], mean_pos)))
