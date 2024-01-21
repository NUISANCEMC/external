sudo apt-get install autoconf libtool
git clone git://git.savannah.gnu.org/gsl.git gsl-2.7
cd gsl-2.7
git checkout release-2-7
./autogen.sh 
./configure 
make -j6 
./configure --prefix=$PWD/install-gsl/
make install -j6

cd $PWD/install-gsl/

echo "#!/bin/sh" > setup.GSL.sh
echo "GSL_DIR=$PWD" >> setup.GSL.sh
echo 'GSL_LIB_DIR=$GSL_DIR/lib/' >> setup.GSL.sh
echo 'GSL_BIN_DIR=$GSL_DIR/bin/' >> setup.GSL.sh
echo 'GSL_INC_DIR=$GSL_DIR/include/' >> setup.GSL.sh

echo 'LD_LIBRARY_PATH=$GSL_LIB_DIR:$LD_LIBRARY_PATH' >> setup.GSL.sh

echo 'PATH=$GSL_BIN_DIR:$PATH' >> setup.GSL.sh
echo 'PATH=$GSL_INC_DIR:$PATH' >> setup.GSL.sh
