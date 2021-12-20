# Install script for directory: /home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/cgcmm/_cgcmm.cpython-39-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/cgcmm/_cgcmm.cpython-39-x86_64-linux-gnu.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/cgcmm/_cgcmm.cpython-39-x86_64-linux-gnu.so"
         RPATH "$ORIGIN/..:$ORIGIN/../md:$ORIGIN")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd/cgcmm" TYPE SHARED_LIBRARY FILES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/_cgcmm.cpython-39-x86_64-linux-gnu.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/cgcmm/_cgcmm.cpython-39-x86_64-linux-gnu.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/cgcmm/_cgcmm.cpython-39-x86_64-linux-gnu.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/cgcmm/_cgcmm.cpython-39-x86_64-linux-gnu.so"
         OLD_RPATH "/home/mg/Thesis/hoomd-v2.9.7/hoomd/md:/opt/cuda/lib64:/usr/lib/openmpi:/home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/neighbor/neighbor:/home/mg/Thesis/hoomd-v2.9.7/hoomd:"
         NEW_RPATH "$ORIGIN/..:$ORIGIN/../md:$ORIGIN")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/hoomd/cgcmm/_cgcmm.cpython-39-x86_64-linux-gnu.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd/cgcmm" TYPE FILE FILES
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/__init__.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/angle.py"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/pair.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd/include/hoomd/cgcmm" TYPE FILE FILES
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/CGCMMAngleForceComputeGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/CGCMMAngleForceCompute.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/CGCMMAngleForceGPU.cuh"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/CGCMMForceComputeGPU.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/CGCMMForceCompute.h"
    "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/CGCMMForceGPU.cuh"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/test-py/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/test/cmake_install.cmake")

endif()

