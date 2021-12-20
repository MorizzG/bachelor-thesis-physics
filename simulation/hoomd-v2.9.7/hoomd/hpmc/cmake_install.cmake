# Install script for directory: /home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/hpmc/_hpmc.cpython-39-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/hpmc/_hpmc.cpython-39-x86_64-linux-gnu.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/hpmc/_hpmc.cpython-39-x86_64-linux-gnu.so"
         RPATH "$ORIGIN/..:$ORIGIN")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd/hpmc" TYPE SHARED_LIBRARY FILES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/_hpmc.cpython-39-x86_64-linux-gnu.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/hpmc/_hpmc.cpython-39-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/hpmc/_hpmc.cpython-39-x86_64-linux-gnu.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/hpmc/_hpmc.cpython-39-x86_64-linux-gnu.so"
         OLD_RPATH "/home/mg/Thesis/hoomd-v2.9.7/hoomd:/opt/cuda/lib64:/usr/lib/openmpi:"
         NEW_RPATH "$ORIGIN/..:$ORIGIN")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/hpmc/_hpmc.cpython-39-x86_64-linux-gnu.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd/hpmc" TYPE FILE FILES
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/analyze.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/compute.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/data.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/__init__.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/integrate.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/update.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/util.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/field.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd/include/hoomd/hpmc" TYPE FILE FILES
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/AnalyzerSDF.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ComputeFreeVolumeGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ComputeFreeVolumeGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ComputeFreeVolume.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ExternalFieldComposite.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ExternalField.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ExternalFieldLattice.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ExternalFieldWall.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/GSDHPMCSchema.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/GPUTree.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/HPMCCounters.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/HPMCPrecisionSetup.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/IntegratorHPMC.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/IntegratorHPMCMonoGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/IntegratorHPMCMonoGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/IntegratorHPMCMono.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/IntegratorHPMCMonoImplicitGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/IntegratorHPMCMonoImplicit.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/IntegratorHPMCMonoImplicitNewGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/IntegratorHPMCMonoImplicitNewGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/MinkowskiMath.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/modules.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/Moves.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/OBB.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/OBBTree.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ShapeConvexPolygon.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ShapeConvexPolyhedron.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ShapeEllipsoid.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ShapeFacetedEllipsoid.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ShapePolyhedron.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ShapeProxy.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ShapeSimplePolygon.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ShapeSphere.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ShapeSpheropolygon.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ShapeSpheropolyhedron.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ShapeSphinx.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/ShapeUnion.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/SphinxOverlap.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/UpdaterClusters.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/UpdaterExternalFieldWall.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/UpdaterMuVT.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/UpdaterMuVTImplicit.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/UpdaterRemoveDrift.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/XenoCollide2D.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/XenoCollide3D.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/test-py/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/hpmc/test/cmake_install.cmake")

endif()

