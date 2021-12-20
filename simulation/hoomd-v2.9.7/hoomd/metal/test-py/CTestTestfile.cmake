# CMake generated Testfile for 
# Source directory: /home/mg/Thesis/hoomd-v2.9.7/hoomd/metal/test-py
# Build directory: /home/mg/Thesis/hoomd-v2.9.7/hoomd/metal/test-py
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(script-test_eam-cpu "/usr/bin/mpiexec" "-n" "1" "/usr/bin/python3" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/metal/test-py/test_eam.py" "--mode=cpu" "--gpu_error_checking")
set_tests_properties(script-test_eam-cpu PROPERTIES  ENVIRONMENT "PYTHONPATH=/home/mg/Thesis/hoomd-v2.9.7:" _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/metal/test-py/CMakeLists.txt;11;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/metal/test-py/CMakeLists.txt;37;add_hoomd_script_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/metal/test-py/CMakeLists.txt;0;")
add_test(script-test_eam-gpu "/usr/bin/mpiexec" "-n" "1" "/usr/bin/python3" "/home/mg/Thesis/hoomd-v2.9.7/hoomd/metal/test-py/test_eam.py" "--mode=gpu" "--gpu_error_checking")
set_tests_properties(script-test_eam-gpu PROPERTIES  ENVIRONMENT "PYTHONPATH=/home/mg/Thesis/hoomd-v2.9.7:" _BACKTRACE_TRIPLES "/home/mg/Thesis/hoomd-v2.9.7/hoomd/metal/test-py/CMakeLists.txt;16;add_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/metal/test-py/CMakeLists.txt;37;add_hoomd_script_test;/home/mg/Thesis/hoomd-v2.9.7/hoomd/metal/test-py/CMakeLists.txt;0;")
