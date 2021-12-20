# Install script for directory: /home/mg/Thesis/hoomd-v2.9.7

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd" TYPE FILE FILES
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/hoomd/FindTBB.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/hoomd/HOOMDCFlagsSetup.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/hoomd/HOOMDCommonLibsSetup.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/hoomd/HOOMDCUDASetup.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/hoomd/test.cc"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/hoomd/HOOMDMacros.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/hoomd/HOOMDMPISetup.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/hoomd/HOOMDNumpySetup.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/hoomd/HOOMDOSSpecificSetup.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/hoomd/HOOMDPythonSetup.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/git/FindGit.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/git/GetGitRevisionDescription.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/libgetar/Findlibgetar.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake/thrust/FindThrust.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake_build_options.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake_install_options.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake_preprocessor_flags.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake_src_setup.cmake"
    "/home/mg/Thesis/hoomd-v2.9.7/CMake_version_options.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/hoomd/CMake/hoomd" TYPE FILE FILES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/CMake/hoomd/hoomd_cache.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mg/Thesis/hoomd-v2.9.7/CMake/cmake_install.cmake")
  include("/home/mg/Thesis/hoomd-v2.9.7/hoomd/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/mg/Thesis/hoomd-v2.9.7/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
