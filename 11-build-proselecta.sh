ProSelecta_DIR="ProSelecta"
ProSelecta_BRANCH="main"
ProSelecta_REPO="https://github.com/NUISANCEMC/ProSelecta.git"

git clone ${ProSelecta_REPO} ${ProSelecta_DIR}
cd ${ProSelecta_DIR}/; git checkout ${ProSelecta_BRANCH}; cd ../
mkdir ${ProSelecta_DIR}/install
rm -rf ${ProSelecta_DIR}/build
mkdir ${ProSelecta_DIR}/build
cd ${ProSelecta_DIR}/build; cmake ../ -DCMAKE_INSTALL_PREFIX=../install/; make install
cd ../
cd install/

echo "#!/bin/sh" > setup.PROSELECTA.sh
echo "PROSELECTA_DIR=$PWD" >> setup.PROSELECTA.sh
echo 'PROSELECTA_LIB_DIR=$PROSELECTA_DIR/lib/' >> setup.PROSELECTA.sh
echo 'PROSELECTA_INC_DIR=$PROSELECTA_DIR/include/' >> setup.PROSELECTA.sh
echo 'LD_LIBRARY_PATH=$PROSELECTA_LIB_DIR:$LD_LIBRARY_PATH' >> setup.PROSELECTA.sh
