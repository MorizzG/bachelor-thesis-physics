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
include hoomd/test/CMakeFiles/test_warp_tools.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include hoomd/test/CMakeFiles/test_warp_tools.dir/compiler_depend.make

# Include the progress variables for this target.
include hoomd/test/CMakeFiles/test_warp_tools.dir/progress.make

# Include the compile flags for this target's objects.
include hoomd/test/CMakeFiles/test_warp_tools.dir/flags.make

hoomd/test/CMakeFiles/cuda_compile_4.dir/cuda_compile_4_generated_test_warp_tools.cu.o: hoomd/test/CMakeFiles/cuda_compile_4.dir/cuda_compile_4_generated_test_warp_tools.cu.o.depend
hoomd/test/CMakeFiles/cuda_compile_4.dir/cuda_compile_4_generated_test_warp_tools.cu.o: hoomd/test/CMakeFiles/cuda_compile_4.dir/cuda_compile_4_generated_test_warp_tools.cu.o.Release.cmake
hoomd/test/CMakeFiles/cuda_compile_4.dir/cuda_compile_4_generated_test_warp_tools.cu.o: hoomd/test/test_warp_tools.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mg/Thesis/hoomd-v2.9.7/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building NVCC (Device) object hoomd/test/CMakeFiles/cuda_compile_4.dir/cuda_compile_4_generated_test_warp_tools.cu.o"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd/test/CMakeFiles/cuda_compile_4.dir && /usr/bin/cmake -E make_directory /home/mg/Thesis/hoomd-v2.9.7/hoomd/test/CMakeFiles/cuda_compile_4.dir//.
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd/test/CMakeFiles/cuda_compile_4.dir && /usr/bin/cmake -D verbose:BOOL=$(VERBOSE) -D build_configuration:STRING=Release -D generated_file:STRING=/home/mg/Thesis/hoomd-v2.9.7/hoomd/test/CMakeFiles/cuda_compile_4.dir//./cuda_compile_4_generated_test_warp_tools.cu.o -D generated_cubin_file:STRING=/home/mg/Thesis/hoomd-v2.9.7/hoomd/test/CMakeFiles/cuda_compile_4.dir//./cuda_compile_4_generated_test_warp_tools.cu.o.cubin.txt -P /home/mg/Thesis/hoomd-v2.9.7/hoomd/test/CMakeFiles/cuda_compile_4.dir//cuda_compile_4_generated_test_warp_tools.cu.o.Release.cmake

hoomd/test/CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.o: hoomd/test/CMakeFiles/test_warp_tools.dir/flags.make
hoomd/test/CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.o: hoomd/test/test_warp_tools.cc
hoomd/test/CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.o: hoomd/test/CMakeFiles/test_warp_tools.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mg/Thesis/hoomd-v2.9.7/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object hoomd/test/CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.o"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT hoomd/test/CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.o -MF CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.o.d -o CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.o -c /home/mg/Thesis/hoomd-v2.9.7/hoomd/test/test_warp_tools.cc

hoomd/test/CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.i"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mg/Thesis/hoomd-v2.9.7/hoomd/test/test_warp_tools.cc > CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.i

hoomd/test/CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.s"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mg/Thesis/hoomd-v2.9.7/hoomd/test/test_warp_tools.cc -o CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.s

# Object files for target test_warp_tools
test_warp_tools_OBJECTS = \
"CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.o"

# External object files for target test_warp_tools
test_warp_tools_EXTERNAL_OBJECTS = \
"/home/mg/Thesis/hoomd-v2.9.7/hoomd/test/CMakeFiles/cuda_compile_4.dir/cuda_compile_4_generated_test_warp_tools.cu.o"

hoomd/test/test_warp_tools: hoomd/test/CMakeFiles/test_warp_tools.dir/test_warp_tools.cc.o
hoomd/test/test_warp_tools: hoomd/test/CMakeFiles/cuda_compile_4.dir/cuda_compile_4_generated_test_warp_tools.cu.o
hoomd/test/test_warp_tools: hoomd/test/CMakeFiles/test_warp_tools.dir/build.make
hoomd/test/test_warp_tools: hoomd/_hoomd.cpython-39-x86_64-linux-gnu.so
hoomd/test/test_warp_tools: /usr/lib/libpython3.9.so
hoomd/test/test_warp_tools: /opt/cuda/lib64/libcudart_static.a
hoomd/test/test_warp_tools: /usr/lib/librt.so
hoomd/test/test_warp_tools: /opt/cuda/lib64/libcufft.so
hoomd/test/test_warp_tools: /opt/cuda/lib64/libcurand.so
hoomd/test/test_warp_tools: /usr/lib/openmpi/libmpi_cxx.so
hoomd/test/test_warp_tools: /usr/lib/openmpi/libmpi.so
hoomd/test/test_warp_tools: hoomd/libquickhull.so
hoomd/test/test_warp_tools: /usr/lib/librt.so
hoomd/test/test_warp_tools: /opt/cuda/lib64/libcufft.so
hoomd/test/test_warp_tools: /opt/cuda/lib64/libcurand.so
hoomd/test/test_warp_tools: /usr/lib/openmpi/libmpi_cxx.so
hoomd/test/test_warp_tools: /usr/lib/openmpi/libmpi.so
hoomd/test/test_warp_tools: hoomd/test/CMakeFiles/test_warp_tools.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mg/Thesis/hoomd-v2.9.7/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable test_warp_tools"
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_warp_tools.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
hoomd/test/CMakeFiles/test_warp_tools.dir/build: hoomd/test/test_warp_tools
.PHONY : hoomd/test/CMakeFiles/test_warp_tools.dir/build

hoomd/test/CMakeFiles/test_warp_tools.dir/clean:
	cd /home/mg/Thesis/hoomd-v2.9.7/hoomd/test && $(CMAKE_COMMAND) -P CMakeFiles/test_warp_tools.dir/cmake_clean.cmake
.PHONY : hoomd/test/CMakeFiles/test_warp_tools.dir/clean

hoomd/test/CMakeFiles/test_warp_tools.dir/depend: hoomd/test/CMakeFiles/cuda_compile_4.dir/cuda_compile_4_generated_test_warp_tools.cu.o
	cd /home/mg/Thesis/hoomd-v2.9.7 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mg/Thesis/hoomd-v2.9.7 /home/mg/Thesis/hoomd-v2.9.7/hoomd/test /home/mg/Thesis/hoomd-v2.9.7 /home/mg/Thesis/hoomd-v2.9.7/hoomd/test /home/mg/Thesis/hoomd-v2.9.7/hoomd/test/CMakeFiles/test_warp_tools.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : hoomd/test/CMakeFiles/test_warp_tools.dir/depend

