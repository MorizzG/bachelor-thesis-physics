# Install script for directory: /home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/mpcd/_mpcd.cpython-39-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/mpcd/_mpcd.cpython-39-x86_64-linux-gnu.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/mpcd/_mpcd.cpython-39-x86_64-linux-gnu.so"
         RPATH "$ORIGIN/..:$ORIGIN/../md:$ORIGIN")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd/mpcd" TYPE SHARED_LIBRARY FILES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/_mpcd.cpython-39-x86_64-linux-gnu.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/mpcd/_mpcd.cpython-39-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/mpcd/_mpcd.cpython-39-x86_64-linux-gnu.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/mpcd/_mpcd.cpython-39-x86_64-linux-gnu.so"
         OLD_RPATH "/home/mg/Thesis/hoomd-v2.9.7/hoomd/md:/opt/cuda/lib64:/usr/lib/openmpi:/home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/neighbor/neighbor:/home/mg/Thesis/hoomd-v2.9.7/hoomd:"
         NEW_RPATH "$ORIGIN/..:$ORIGIN/../md:$ORIGIN")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/mpcd/_mpcd.cpython-39-x86_64-linux-gnu.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd/mpcd" TYPE FILE FILES
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/__init__.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/collide.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/data.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/force.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/init.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/integrate.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/stream.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/update.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd/include/hoomd/mpcd" TYPE FILE FILES
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/ATCollisionMethod.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/BounceBackNVE.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/BoundaryCondition.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/BulkGeometry.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/CellCommunicator.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/CellThermoCompute.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/CellList.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/CollisionMethod.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/ConfinedStreamingMethod.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/Communicator.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/CommunicatorUtilities.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/ExternalField.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/Integrator.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/ParticleData.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/ParticleDataSnapshot.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/ParticleDataUtilities.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SlitGeometry.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SlitGeometryFiller.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SlitPoreGeometry.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SlitPoreGeometryFiller.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/Sorter.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SRDCollisionMethod.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/StreamingGeometry.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/StreamingMethod.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SystemData.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SystemDataSnapshot.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/VirtualParticleFiller.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/ATCollisionMethodGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/ATCollisionMethodGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/BounceBackNVEGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/BounceBackNVEGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/CellCommunicator.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/CellThermoComputeGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/CellThermoComputeGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/CellListGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/CellListGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/CommunicatorGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/CommunicatorGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/ConfinedStreamingMethodGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/ConfinedStreamingMethodGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/ParticleData.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SlitGeometryFillerGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SlitGeometryFillerGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SlitPoreGeometryFillerGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SlitPoreGeometryFillerGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SorterGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SorterGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SRDCollisionMethodGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/SRDCollisionMethodGPU.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test-py/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/cmake_install.cmake")

endif()

