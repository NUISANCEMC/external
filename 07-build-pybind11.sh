pybind11_DIR="pybind11"
pybind11_BRANCH="v2.9"
pybind11_REPO="https://github.com/pybind/pybind11.git"

git clone ${pybind11_REPO} ${pybind11_DIR}
cd ${pybind11_DIR}; git checkout ${pybind11_BRANCH}; cd ../
mkdir ${pybind11_DIR}/install
mkdir ${pybind11_DIR}/build
cd ${pybind11_DIR}/build; cmake ../ -DCMAKE_INSTALL_PREFIX=../install/; make install; cd ../
cd install/

echo "#!/bin/sh" > setup.PYBIND11.sh
echo "PYBIND11_DIR=$PWD" >> setup.PYBIND11.sh
echo 'PYBIND11_LIB_DIR=$PYBIND11_DIR/lib/' >> setup.PYBIND11.sh
echo 'PYBIND11_INC_DIR=$PYBIND11_DIR/include/' >> setup.PYBIND11.sh
echo 'LD_LIBRARY_PATH=$PYBIND11_LIB_DIR:$LD_LIBRARY_PATH' >> setup.PYBIND11.sh
