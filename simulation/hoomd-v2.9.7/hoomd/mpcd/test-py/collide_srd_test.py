# Copyright (c) 2009-2019 The Regents of the University of Michigan
# This file is part of the HOOMD-blue project, released under the BSD 3-Clause License.

# Maintainer: mphoward

import unittest

import hoomd
import numpy as np
from hoomd import md, mpcd


# unit tests for mpcd.collide.srd
class mpcd_collide_srd_test(unittest.TestCase):
    def setUp(self):
        # establish the simulation context
        hoomd.context.initialize()

        # default testing configuration
        hoomd.init.read_snapshot(hoomd.data.make_snapshot(N=1, box=hoomd.data.boxdim(L=20.0)))

        # initialize the system from the starting snapshot
        mpcd.init.read_snapshot(mpcd.data.make_snapshot(N=1))

        # create an integrator
        mpcd.integrator(dt=0.02)

    # test basic creation
    def test_create(self):
        srd = mpcd.collide.srd(seed=42, period=5, angle=90.0)
        self.assertEqual(srd.enabled, True)
        self.assertEqual(hoomd.context.current.mpcd._collide, srd)

        srd.disable()
        self.assertEqual(srd.enabled, False)
        self.assertEqual(hoomd.context.current.mpcd._collide, None)

        srd.enable()
        self.assertEqual(srd.enabled, True)
        self.assertEqual(hoomd.context.current.mpcd._collide, srd)

    # test for setting of embedded group
    def test_embed(self):
        group = hoomd.group.all()
        srd = mpcd.collide.srd(seed=42, period=5, angle=90.0, group=group)
        self.assertEqual(srd.group, group)
        srd.disable()

        srd2 = mpcd.collide.srd(seed=7, period=10, angle=130.0)
        srd2.embed(group)
        self.assertEqual(srd2.group, group)

    # test creation of multiple collision rules
    def test_multiple(self):
        # after a collision rule has been set, another cannot be created without
        # removing the first one
        srd = mpcd.collide.srd(seed=42, period=5, angle=90.0)
        with self.assertRaises(RuntimeError):
            mpcd.collide.srd(seed=7, period=10, angle=130.0)

        # okay, now it should work
        srd.disable()
        mpcd.collide.srd(seed=7, period=10, angle=130.0)

    def test_set_params(self):
        srd = mpcd.collide.srd(seed=42, period=5, angle=130.0)
        self.assertEqual(srd.angle, 130.0)
        self.assertEqual(srd.shift, True)

        srd.set_params(angle=90.0)
        self.assertEqual(srd.angle, 90.0)
        self.assertEqual(srd.shift, True)

        srd.set_params(shift=False)
        self.assertEqual(srd.angle, 90.0)
        self.assertEqual(srd.shift, False)

        srd.set_params(angle=85.0, shift=True)
        self.assertEqual(srd.angle, 85.0)
        self.assertEqual(srd.shift, True)

    # test common initialization errors
    def test_init_errors(self):
        # clear out the system
        hoomd.context.initialize()

        # it is an error to make a collision rule without initializing first
        with self.assertRaises(RuntimeError):
            mpcd.collide.srd(seed=42, period=5, angle=90.0)

        # it is an error to make a collision rule without initializing MPCD first
        hoomd.init.read_snapshot(hoomd.data.make_snapshot(N=1, box=hoomd.data.boxdim(L=20.0)))
        with self.assertRaises(RuntimeError):
            mpcd.collide.srd(seed=42, period=5, angle=90.0)

        # OK, now it should go
        mpcd.init.read_snapshot(mpcd.data.make_snapshot(N=1))
        mpcd.collide.srd(seed=42, period=5, angle=90.0)

    # test thermostat
    def test_thermostat(self):
        srd = mpcd.collide.srd(seed=42, period=5, angle=90.0, kT=1.0)
        self.assertTrue(srd.kT is not False)
        srd.disable()

        srd = mpcd.collide.srd(seed=42, period=5, angle=90.0)
        self.assertTrue(srd.kT is False)

        srd.set_params(kT=hoomd.variant.linear_interp([[0, 2.0], [10, 1.0]]))
        self.assertTrue(srd.kT is not False)

        srd.set_params(kT=False)
        self.assertTrue(srd.kT is False)

    # test methods for setting the collision period
    def test_set_period(self):
        srd = mpcd.collide.srd(seed=42, period=5, angle=130.0)
        # can change period right away
        srd.set_period(2)

        # running one step forbids changing period until we advance to a multiple
        hoomd.run(1)
        with self.assertRaises(RuntimeError):
            srd.set_period(3)
        hoomd.run(1)
        srd.set_period(2)

        # skip ahead to timestep 10, where setting period of 9 is invalid
        hoomd.run(8)
        with self.assertRaises(RuntimeError):
            srd.set_period(9)
        # period of 5 is OK because 10 is a multiple of 5
        srd.set_period(5)

    def tearDown(self):
        pass


if __name__ == "__main__":
    unittest.main(argv=["test.py", "-v"])
