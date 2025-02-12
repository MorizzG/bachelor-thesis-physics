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

# Utility rule file for copy_dem.

# Include any custom commands dependencies for this target.
include hoomd/dem/CMakeFiles/copy_dem.dir/compiler_depend.make

# Include the progress variables for this target.
include hoomd/dem/CMakeFiles/copy_dem.dir/progress.make

hoomd/dem/CMakeFiles/copy_dem: hoomd/dem/__init__.py
hoomd/dem/CMakeFiles/copy_dem: hoomd/dem/pair.py
hoomd/dem/CMakeFiles/copy_dem: hoomd/dem/params.py
hoomd/dem/CMakeFiles/copy_dem: hoomd/dem/utils.py

hoomd/dem/__init__.py: hoomd/dem/__init__.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mg/Thesis/hoomd-v2.9.7/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Copy hoomd/dem/__init__.py"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem && /usr/bin/cmake -E copy /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem/__init__.py /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem/__init__.py

hoomd/dem/pair.py: hoomd/dem/pair.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mg/Thesis/hoomd-v2.9.7/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Copy hoomd/dem/pair.py"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem && /usr/bin/cmake -E copy /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem/pair.py /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem/pair.py

hoomd/dem/params.py: hoomd/dem/params.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mg/Thesis/hoomd-v2.9.7/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Copy hoomd/dem/params.py"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem && /usr/bin/cmake -E copy /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem/params.py /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem/params.py

hoomd/dem/utils.py: hoomd/dem/utils.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mg/Thesis/hoomd-v2.9.7/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Copy hoomd/dem/utils.py"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem && /usr/bin/cmake -E copy /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem/utils.py /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem/utils.py

copy_dem: hoomd/dem/CMakeFiles/copy_dem
copy_dem: hoomd/dem/__init__.py
copy_dem: hoomd/dem/pair.py
copy_dem: hoomd/dem/params.py
copy_dem: hoomd/dem/utils.py
copy_dem: hoomd/dem/CMakeFiles/copy_dem.dir/build.make
.PHONY : copy_dem

# Rule to build all files generated by this target.
hoomd/dem/CMakeFiles/copy_dem.dir/build: copy_dem
.PHONY : hoomd/dem/CMakeFiles/copy_dem.dir/build

hoomd/dem/CMakeFiles/copy_dem.dir/clean:
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem && $(CMAKE_COMMAND) -P CMakeFiles/copy_dem.dir/cmake_clean.cmake
.PHONY : hoomd/dem/CMakeFiles/copy_dem.dir/clean

hoomd/dem/CMakeFiles/copy_dem.dir/depend:
	cd /home/mg/Thesis/hoomd-v2.9.7 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mg/Thesis/hoomd-v2.9.7 /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem /home/mg/Thesis/hoomd-v2.9.7 /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem /home/mg/Thesis/hoomd-v2.9.7/hoomd/dem/CMakeFiles/copy_dem.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : hoomd/dem/CMakeFiles/copy_dem.dir/depend

