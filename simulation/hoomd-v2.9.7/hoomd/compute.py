# Copyright (c) 2009-2019 The Regents of the University of Michigan
# This file is part of the HOOMD-blue project, released under the BSD 3-Clause License.

# Maintainer: joaander / All Developers are free to add commands for new features

r""" Compute system properties

A compute calculates properties of the system on demand. Most computes are automatically generated by the command
that needs them (e.g. integrate.nvt creates a compute.thermo for temperature calculations). User-specified computes
can be used when more flexibility is needed. Properties calculated by specified computes (automatically, or by the
user) can be logged with analyze.log.
"""

import sys

import hoomd
from hoomd import _hoomd


## \internal
# \brief Base class for computes
#
# A compute in hoomd reflects a Compute in c++. It is responsible
# for all high-level management that happens behind the scenes for hoomd
# writers. 1) The instance of the c++ compute itself is tracked and added to the
# System 2) methods are provided for disabling the compute
class _compute:
    ## \internal
    # \brief Constructs the compute
    #
    # Initializes the cpp_compute to None.
    # Assigns a name to the compute in compute_name
    def __init__(self):
        # check if initialization has occurred
        if not hoomd.init.is_initialized():
            hoomd.context.msg.error("Cannot create compute before initialization\n")
            raise RuntimeError("Error creating compute")

        self.cpp_compute = None

        # increment the id counter
        id = _compute.cur_id
        _compute.cur_id += 1

        self.compute_name = "compute%d" % (id)
        self.enabled = True

    ## \var enabled
    # \internal
    # \brief True if the compute is enabled

    ## \var cpp_compute
    # \internal
    # \brief Stores the C++ side Compute managed by this class

    ## \var compute_name
    # \internal
    # \brief The Compute's name as it is assigned to the System

    ## \internal
    # \brief Checks that proper initialization has completed
    def check_initialization(self):
        # check that we have been initialized properly
        if self.cpp_compute is None:
            hoomd.context.msg.error("Bug in hoomd: cpp_compute not set, please report\n")
            raise RuntimeError()

    def disable(self):
        r"""Disables the compute.

        Examples::

            c.disable()

        Executing the disable command will remove the compute from the system. Any :py:meth:`hoomd.run()` command
        executed after disabling a compute will not be able to log computed values with :py:class:`hoomd.analyze.log`.

        A disabled compute can be re-enabled with :py:meth:`enable()`.
        """

        hoomd.util.print_status_line()
        self.check_initialization()

        # check if we are already disabled
        if not self.enabled:
            hoomd.context.msg.warning("Ignoring command to disable a compute that is already disabled")
            return

        hoomd.context.current.system.removeCompute(self.compute_name)
        self.enabled = False

    def enable(self):
        r"""Enables the compute.

        Examples::

            c.enable()

        See :py:meth:`disable()`.
        """
        hoomd.util.print_status_line()
        self.check_initialization()

        # check if we are already disabled
        if self.enabled:
            hoomd.context.msg.warning("Ignoring command to enable a compute that is already enabled")
            return

        hoomd.context.current.system.addCompute(self.cpp_compute, self.compute_name)
        self.enabled = True

    @classmethod
    def _gsd_state_name(cls):
        raise NotImplementedError("GSD Schema is not implemented for {}".format(cls.__name__))

    def _connect_gsd(self, gsd):
        # This is an internal method, and should not be called directly. See gsd.dump_state() instead
        if isinstance(gsd, hoomd.dump.gsd) and hasattr(self.cpp_compute, "connectGSDStateSignal"):
            self.cpp_compute.connectGSDStateSignal(gsd.cpp_analyzer, self._gsd_state_name())
        else:
            raise NotImplementedError("GSD Schema is not implemented for {}".format(self.__class__.__name__))

    def restore_state(self):
        """Restore the state information from the file used to initialize the simulations"""
        hoomd.util.print_status_line()
        if isinstance(hoomd.context.current.state_reader, _hoomd.GSDReader) and hasattr(
            self.cpp_compute, "restoreStateGSD"
        ):
            self.cpp_compute.restoreStateGSD(hoomd.context.current.state_reader, self._gsd_state_name())
        else:
            if hoomd.context.current.state_reader is None:
                hoomd.context.msg.error("Can only restore after the state reader has been initialized.\n")
            else:
                hoomd.context.msg.error(
                    "Restoring state from {reader_name} is not currently supported for {name}\n".format(
                        reader_name=hoomd.context.current.state_reader.__name__, name=self.__class__.__name__,
                    )
                )
            raise RuntimeError("Can not restore state information!")


# set default counter
_compute.cur_id = 0


class thermo(_compute):
    r"""Compute thermodynamic properties of a group of particles.

    Args:
        group (:py:mod:`hoomd.group`): Group to compute thermodynamic properties for.

    :py:class:`hoomd.compute.thermo` acts on a given group of particles and calculates thermodynamic properties of those particles when
    requested. A default :py:class:`hoomd.compute.thermo` is created that operates on the group of all particles. Integration methods
    such as :py:class:`hoomd.md.integrate.nvt` automatically create an internal :py:class:`hoomd.compute.thermo` for the group that they operate on.
    If thermodynamic properties are needed on additional groups, a user can specify additional :py:class:`hoomd.compute.thermo` commands.

    Whether they are automatically created or created by a user, all specified thermos are available for logging via
    the :py:class:`hoomd.analyze.log` command. Each one provides a set of quantities for logging, suffixed with *_groupname*, so that
    values for different groups are differentiated in the log file. The default :py:class:`hoomd.compute.thermo` specified on the group
    of all particles has no suffix placed on its quantity names.

    The quantities provided are (where **groupname** is replaced with the name of the group):

    * **num_particles_groupname** - :math:`N` number of particles in the group
    * **ndof_groupname**  - :math:`N_{\mathrm{dof}}` number of degrees of freedom given to the group by
      integrate commands
    * **translational_ndof_groupname**  - :math:`N_{\mathrm{dof}}` number of translational degrees of
      freedom given to the group by integrate commands
    * **rotational_ndof_groupname**  - :math:`N_{\mathrm{dof}}` number of rotational degrees of
      freedom given to the group by integrate commands
    * **potential_energy_groupname** - :math:`U` potential energy that the group contributes to the entire
      system (in energy units)
    * **kinetic_energy_groupname** - :math:`K` total kinetic energy of all particles in the group (in energy units)
    * **translational_kinetic_energy_groupname** - :math:`K` translational kinetic energy of all particles in the group (in energy units)
    * **rotational_kinetic_energy_groupname** - :math:`K` rotational kinetic energy of all particles in the group (in energy units)
    * **temperature_groupname** - :math:`kT` instantaneous thermal energy of the group (in energy units). Calculated as

      .. math::

        kT = 2 \cdot \frac{K}{N_{\mathrm{dof}}}

    * **pressure_groupname** - :math:`P` instantaneous pressure of the group (in pressure units). Calculated as

      .. math::

          W = \frac{1}{2} \sum_{i}\sum_{j \ne i} \vec{F}_{ij} \cdot \vec{r_{ij}} + \sum_{k} \vec{F}_{k} \cdot \vec{r_{k}}

      where :math:`\vec{F}_{ij}` are pairwise forces between particles and :math:`\vec{F}_k` are forces due to explicit constraints, implicit rigid
      body constraints, external walls, and fields. In 2D simulations,
      :math:`P = (K + \frac{1}{2}\cdot W)/A` where :math:`A` is the area of the simulation box.
      of the simulation box.
    * **pressure_xx_groupname**, **pressure_xy_groupname**, **pressure_xz_groupname**,
      **pressure_yy_groupname**, **pressure_yz_groupname**, **pressure_zz_groupname** -
      instantaneous pressure tensor of the group (in pressure units).

      .. math::

          P_{ij} = \left[  \sum_{k\in[0..N)} m_k v_{k,i} v_{k,j} +
                           \sum_{k\in[0..N)} \sum_{l > k} \frac{1}{2} \left(\vec{r}_{kl,i} \vec{F}_{kl,j} + \vec{r}_{kl,j} \vec{F}_{kl, i} \right) \right]/V

    See Also:
        :py:class:`hoomd.analyze.log`.

    Examples::

        g = group.type(name='typeA', type='A')
        compute.thermo(group=g)
    """

    def __init__(self, group):
        hoomd.util.print_status_line()

        # initialize base class
        _compute.__init__(self)

        suffix = ""
        if group.name != "all":
            suffix = "_" + group.name

        # warn user if an existing compute thermo already uses this group or name
        for t in hoomd.context.current.thermos:
            if t.group is group:
                hoomd.context.msg.warning("compute.thermo already specified for this group")
            elif t.group.name == group.name:
                hoomd.context.msg.warning(
                    "compute.thermo already specified for a group with name " + str(group.name) + "\n"
                )

        # create the c++ mirror class
        if not hoomd.context.exec_conf.isCUDAEnabled():
            self.cpp_compute = _hoomd.ComputeThermo(hoomd.context.current.system_definition, group.cpp_group, suffix)
        else:
            self.cpp_compute = _hoomd.ComputeThermoGPU(hoomd.context.current.system_definition, group.cpp_group, suffix)

        hoomd.context.current.system.addCompute(self.cpp_compute, self.compute_name)

        # save the group for later referencing
        self.group = group
        # add ourselves to the list of compute thermos specified so far
        hoomd.context.current.thermos.append(self)

    def disable(self):
        r"""Disables the thermo.

        Examples::

            my_thermo.disable()

        Executing the disable command will remove the thermo compute from the system. Any :py:meth:`hoomd.run()` command
        executed after disabling a thermo compute will not be able to log computed values with :py:class:`hoomd.analyze.log`.

        A disabled thermo compute can be re-enabled with :py:meth:`enable()`.
        """
        hoomd.util.print_status_line()

        hoomd.util.quiet_status()
        _compute.disable(self)
        hoomd.util.unquiet_status()

        hoomd.context.current.thermos.remove(self)

    def enable(self):
        r"""Enables the thermo compute.

        Examples::

            my_thermo.enable()

        See :py:meth:`disable()`.
        """
        hoomd.util.print_status_line()

        hoomd.util.quiet_status()
        _compute.enable(self)
        hoomd.util.unquiet_status()

        hoomd.context.current.thermo.append(self)


## \internal
# \brief Returns the previously created compute.thermo with the same group, if created. Otherwise, creates a new
# compute.thermo
def _get_unique_thermo(group):

    # first check the context for an existing compute.thermo
    for t in hoomd.context.current.thermos:
        # if we find a match, return it
        if t.group is group:
            return t

    # if we get here, there were no matches: create a new one
    hoomd.util.quiet_status()
    res = thermo(group)
    hoomd.util.unquiet_status()
    return res
