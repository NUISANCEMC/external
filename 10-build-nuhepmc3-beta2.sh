NuHepMC_DIR="NuHepMC"
NuHepMC_BRANCH="beta2.0"
NuHepMC_REPO="https://github.com/NuHepMC/HepMC3.git"

git clone ${NuHepMC_REPO} NuHepMC-beta2.0

cd NuHepMC-beta2.0/
git checkout $(NuHepMC_BRANCH)

mkdir install
mkdir build
cd build

cmake ../ -DCMAKE_INSTALL_PREFIX=../install/ -DHEPMC3_Python_SITEARCH39=../install/ -DHEPMC3_BUILD_STATIC_LIBS=OFF -DHEPMC3_INSTALL_EXAMPLES=OFF

make install -j6

cd ../install

echo "#!/bin/sh" > setup.NUHEPMC3.sh
echo "NUHEPMC3_DIR=$PWD" >> setup.NUHEPMC3.sh
echo 'NUHEPMC3_LIB_DIR=$NUHEPMC3_DIR/lib/' >> setup.NUHEPMC3.sh
echo 'NUHEPMC3_BIN_DIR=$NUHEPMC3_DIR/bin/' >> setup.NUHEPMC3.sh
echo 'NUHEPMC3_INC_DIR=$NUHEPMC3_DIR/include/' >> setup.NUHEPMC3.sh

echo 'LD_LIBRARY_PATH=$NUHEPMC3_LIB_DIR:$LD_LIBRARY_PATH' >> setup.NUHEPMC3.sh
echo 'PATH=$NUHEPMC3_BIN_DIR:$PATH' >> setup.NUHEPMC3.sh
echo 'PATH=$NUHEPMC3_INC_DIR:$PATH' >> setup.NUHEPMC3.sh


