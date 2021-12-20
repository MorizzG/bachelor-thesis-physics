

HOOMD_DIR=hoomd-v2.9.7

.PHONY: hoomd
hoomd:
	cmake DCMAKE_INSTALL_PREFIX=`python3 -c "import site; print(site.getsitepackages()[0])"` -DCMAKE_CXX_FLAGS=-march=native -DCMAKE_C_FLAGS=-march=native -DENABLE_CUDA=ON -DENABLE_MPI=ON -S hoomd-v2.9.7/ -B build/ -GNinja
	cmake --build build/

install:
	cp -R build/hoomd/ hoomd/

.PHONY: clean
clean:
	rm -rf build/*
