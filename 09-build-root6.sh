
sudo apt-get update
sudo apt-get install dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev python3 libssl-dev libafterimage0
sudo apt-get install gfortran libpcre3-dev \
xlibmesa-glu-dev libglew-dev libftgl-dev \
libmysqlclient-dev libfftw3-dev libcfitsio-dev \
graphviz-dev libavahi-compat-libdnssd-dev \
libldap2-dev python3-dev python3-numpy libxml2-dev libkrb5-dev \
libgsl0-dev qtwebengine5-dev nlohmann-json3-dev

mkdir root-6.28.10
cd root-6.28.10
wget https://root.cern/download/root_v6.28.10.source.tar.gz
tar -zxvf root_v6.28.10.source.tar.gz
mv root-6.28.10/* ./

mkdir build-root
mkdir install-root
cd build-root


cmake ../ -GNinja -DCMAKE_INSTALL_PREFIX=$PWD/../install-root/ -Dccache=ON -Dpythia6=ON -Dmathmore=ON -DPYTHIA6_LIBRARY=$PYTHIA6_DIR/$PYTHIA6_LIB
ninja -8
cd ../install-root
echo "source $PWD/bin/thisroot.sh" > setup.ROOT.sh
