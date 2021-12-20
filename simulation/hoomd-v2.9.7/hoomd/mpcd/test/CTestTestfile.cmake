# CMake generated Testfile for 
# Source directory: /home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test
# Build directory: /home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(mpcd-core-at_collision_method "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/at_collision_method_test")
set_tests_properties(mpcd-core-at_collision_method PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;77;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-cell_list "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/cell_list_test")
set_tests_properties(mpcd-core-cell_list PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;77;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-cell_thermo_compute "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/cell_thermo_compute_test")
set_tests_properties(mpcd-core-cell_thermo_compute PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;77;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-slit_geometry_filler "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/slit_geometry_filler_test")
set_tests_properties(mpcd-core-slit_geometry_filler PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;77;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-slit_pore_geometry_filler "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/slit_pore_geometry_filler_test")
set_tests_properties(mpcd-core-slit_pore_geometry_filler PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;77;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-sorter "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/sorter_test")
set_tests_properties(mpcd-core-sorter PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;77;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-srd_collision_method "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/srd_collision_method_test")
set_tests_properties(mpcd-core-srd_collision_method PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;77;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-streaming_method "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/streaming_method_test")
set_tests_properties(mpcd-core-streaming_method PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;77;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-virtual_particle "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/virtual_particle_test")
set_tests_properties(mpcd-core-virtual_particle PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;77;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-cell_communicator-mpi "/usr/bin/mpiexec" "-n" "8" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/cell_communicator_mpi_test")
set_tests_properties(mpcd-core-cell_communicator-mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;90;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-cell_list-mpi "/usr/bin/mpiexec" "-n" "8" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/cell_list_mpi_test")
set_tests_properties(mpcd-core-cell_list-mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;90;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-cell_thermo_compute-mpi "/usr/bin/mpiexec" "-n" "8" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/cell_thermo_compute_mpi_test")
set_tests_properties(mpcd-core-cell_thermo_compute-mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;90;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-slit_geometry_filler-mpi "/usr/bin/mpiexec" "-n" "8" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/slit_geometry_filler_mpi_test")
set_tests_properties(mpcd-core-slit_geometry_filler-mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;90;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
add_test(mpcd-core-slit_pore_geometry_filler-mpi "/usr/bin/mpiexec" "-n" "8" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/slit_pore_geometry_filler_mpi_test")
set_tests_properties(mpcd-core-slit_pore_geometry_filler-mpi PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;90;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/mpcd/test/CMakeLists.txt;0;")
