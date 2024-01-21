#!/bin/sh
sudo apt-get install python2

wget https://lhapdf.hepforge.org/downloads/?f=old/lhapdf-5.9.1.tar.gz -O lhapdf-5.9.1.tar.gz
# ^ or use a web browser to download, which will get the filename correct
tar xf lhapdf-5.9.1.tar.gz
rm lhapdf-5.9.1.tar.gz
mv LHAPDF-5.9.1 lhapdf-5.9.1-src
mv lhapdf-5.9.1-src lhapdf-5.9.1
cd lhapdf-5.9.1
mkdir install-lhapdf

ln -sf $(which python2) ./python
export PATH=$PWD:$PATH

export FC=gfortran
export FCFLAGS=-std=legacy
./configure --prefix=$PWD/install-lhapdf/   --disable-old-ccwrap --disable-doxygen   --disable-silent-rules FCFLAGS=-std=legacy

make -j4
make install -j4

cd install-lhapdf/

echo "#!/bin/sh" > setup.LHAPDF.sh
echo "LHAPDF_DIR=$PWD" >> setup.LHAPDF.sh
echo 'LHAPDF_LIB_DIR=$LHAPDF_DIR/lib/' >> setup.LHAPDF.sh
echo 'LHAPDF_BIN_DIR=$LHAPDF_DIR/bin/' >> setup.LHAPDF.sh
echo 'LHAPDF_INC_DIR=$LHAPDF_DIR/include/' >> setup.LHAPDF.sh

echo 'LD_LIBRARY_PATH=$LHAPDF_LIB_DIR:$LD_LIBRARY_PATH' >> setup.LHAPDF.sh

echo 'PATH=$LHAPDF_BIN_DIR:$PATH' >> setup.LHAPDF.sh
echo 'PATH=$LHAPDF_INC_DIR:$PATH' >> setup.LHAPDF.sh

source setup.LHAPDF.sh
wget http://lhapdfsets.web.cern.ch/lhapdfsets/current/CT10nlo.tar.gz -O- | tar xz -C $LHAPDF_DIR/share/LHAPDF
