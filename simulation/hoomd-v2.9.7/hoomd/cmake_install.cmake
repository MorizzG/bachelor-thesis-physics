# Install script for directory: /home/mg/Thesis/hoomd-v2.9.7/hoomd

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/lib/python3.9/site-packages")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd/include" TYPE FILE FILES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/include/HOOMDVersion.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/_hoomd.cpython-39-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/_hoomd.cpython-39-x86_64-linux-gnu.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/_hoomd.cpython-39-x86_64-linux-gnu.so"
         RPATH "$ORIGIN")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd" TYPE SHARED_LIBRARY FILES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/_hoomd.cpython-39-x86_64-linux-gnu.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/_hoomd.cpython-39-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/_hoomd.cpython-39-x86_64-linux-gnu.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/_hoomd.cpython-39-x86_64-linux-gnu.so"
         OLD_RPATH "/home/mg/Thesis/hoomd-v2.9.7/hoomd:/opt/cuda/lib64:/usr/lib/openmpi:"
         NEW_RPATH "$ORIGIN")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/_hoomd.cpython-39-x86_64-linux-gnu.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/libquickhull.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/libquickhull.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/libquickhull.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd" TYPE SHARED_LIBRARY FILES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/libquickhull.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/libquickhull.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/libquickhull.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/libquickhull.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd" TYPE FILE FILES
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/analyze.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/benchmark.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cite.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/comm.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/compute.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/context.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/data.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/dump.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/group.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/__init__.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/init.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/integrate.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/meta.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/option.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/update.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/util.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/variant.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/lattice.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hdf5.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd/include/hoomd" TYPE FILE FILES
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/AABB.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/AABBTree.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Analyzer.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Autotuner.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/BondedGroupData.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/BondedGroupData.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/BoxDim.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/BoxResizeUpdater.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/CachedAllocator.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/CallbackAnalyzer.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/CellListGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/CellListGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/CellList.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/CellListStencil.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ClockSource.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/CommunicatorGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/CommunicatorGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Communicator.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Compute.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ComputeThermoGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ComputeThermoGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ComputeThermo.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ComputeThermoTypes.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ConstForceCompute.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/DCDDumpWriter.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/DomainDecomposition.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ExecutionConfiguration.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Filesystem.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ForceCompute.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ForceConstraint.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GetarDumpIterators.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GetarDumpWriter.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GetarInitializer.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GlobalArray.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GPUArray.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GPUFlags.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GPUPartition.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GPUPolymorph.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GPUPolymorph.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GPUVector.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GSDDumpWriter.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GSDReader.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/GSDShapeSpecWriter.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/HalfStepHook.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/HOOMDMath.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/HOOMDMPI.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/IMDInterface.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Index1D.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Initializers.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Integrator.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/IntegratorData.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Integrator.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/LoadBalancerGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/LoadBalancerGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/LoadBalancer.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Logger.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/LogPlainTXT.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/LogMatrix.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/LogHDF5.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/managed_allocator.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ManagedArray.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/MemoryTraceback.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Messenger.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/MPIConfiguration.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ParticleData.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ParticleData.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ParticleGroup.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/ParticleGroup.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Profiler.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/RandomNumbers.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/RNGIdentifiers.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Saru.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/SFCPackUpdaterGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/SFCPackUpdaterGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/SFCPackUpdater.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/SharedSignal.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/SignalHandler.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/SnapshotSystemData.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/SystemDefinition.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/System.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/TextureTools.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Updater.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/Variant.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/VectorMath.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/WarpTools.cuh"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/test-py/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/test/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/dfftlib/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/neighbor/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/md/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/deprecated/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/metal/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/dem/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/example_plugin/cmake_install.cmake")

endif()

