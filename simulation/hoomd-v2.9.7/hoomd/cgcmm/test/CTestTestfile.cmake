# CMake generated Testfile for 
# Source directory: /home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/test
# Build directory: /home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_cgcmm_angle_force "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/test/test_cgcmm_angle_force")
set_tests_properties(test_cgcmm_angle_force PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/test/CMakeLists.txt;40;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/test/CMakeLists.txt;0;")
add_test(test_cgcmm_force "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/test/test_cgcmm_force")
set_tests_properties(test_cgcmm_force PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/test/CMakeLists.txt;40;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/cgcmm/test/CMakeLists.txt;0;")
