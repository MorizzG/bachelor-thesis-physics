# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mg/Thesis/hoomd-v2.9.7

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mg/Thesis/hoomd-v2.9.7

# Include any dependencies generated for this target.
include hoomd/CMakeFiles/quickhull.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include hoomd/CMakeFiles/quickhull.dir/compiler_depend.make

# Include the progress variables for this target.
include hoomd/CMakeFiles/quickhull.dir/progress.make

# Include the compile flags for this target's objects.
include hoomd/CMakeFiles/quickhull.dir/flags.make

hoomd/CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.o: hoomd/CMakeFiles/quickhull.dir/flags.make
hoomd/CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.o: hoomd/extern/quickhull/QuickHull.cpp
hoomd/CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.o: hoomd/CMakeFiles/quickhull.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mg/Thesis/hoomd-v2.9.7/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object hoomd/CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.o"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT hoomd/CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.o -MF CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.o.d -o CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.o -c /home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/quickhull/QuickHull.cpp

hoomd/CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.i"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/quickhull/QuickHull.cpp > CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.i

hoomd/CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.s"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/quickhull/QuickHull.cpp -o CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.s

# Object files for target quickhull
quickhull_OBJECTS = \
"CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.o"

# External object files for target quickhull
quickhull_EXTERNAL_OBJECTS =

hoomd/libquickhull.so: hoomd/CMakeFiles/quickhull.dir/extern/quickhull/QuickHull.cpp.o
hoomd/libquickhull.so: hoomd/CMakeFiles/quickhull.dir/build.make
hoomd/libquickhull.so: hoomd/CMakeFiles/quickhull.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mg/Thesis/hoomd-v2.9.7/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libquickhull.so"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/quickhull.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
hoomd/CMakeFiles/quickhull.dir/build: hoomd/libquickhull.so
.PHONY : hoomd/CMakeFiles/quickhull.dir/build

hoomd/CMakeFiles/quickhull.dir/clean:
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd && $(CMAKE_COMMAND) -P CMakeFiles/quickhull.dir/cmake_clean.cmake
.PHONY : hoomd/CMakeFiles/quickhull.dir/clean

hoomd/CMakeFiles/quickhull.dir/depend:
	cd /home/mg/Thesis/hoomd-v2.9.7 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mg/Thesis/hoomd-v2.9.7 /home/mg/Thesis/hoomd-v2.9.7/hoomd /home/mg/Thesis/hoomd-v2.9.7 /home/mg/Thesis/hoomd-v2.9.7/hoomd /home/mg/Thesis/hoomd-v2.9.7/hoomd/CMakeFiles/quickhull.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : hoomd/CMakeFiles/quickhull.dir/depend

