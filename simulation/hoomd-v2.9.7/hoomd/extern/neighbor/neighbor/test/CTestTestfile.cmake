# CMake generated Testfile for 
# Source directory: /home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/neighbor/neighbor/test
# Build directory: /home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/neighbor/neighbor/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(neighbor-lbvh "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/neighbor/neighbor/test/lbvh_test")
set_tests_properties(neighbor-lbvh PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/neighbor/neighbor/test/CMakeLists.txt;43;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/neighbor/neighbor/test/CMakeLists.txt;0;")
add_test(neighbor-uniform_grid "/usr/bin/mpiexec" "-n" "1" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/neighbor/neighbor/test/uniform_grid_test")
set_tests_properties(neighbor-uniform_grid PROPERTIES  _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/neighbor/neighbor/test/CMakeLists.txt;43;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/extern/neighbor/neighbor/test/CMakeLists.txt;0;")
