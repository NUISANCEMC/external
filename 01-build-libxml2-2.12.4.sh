git clone https://gitlab.gnome.org/GNOME/libxml2.git libxml2-2.12.4
cd libxml2-2.12.4
git checkout v2.12.4
mkdir build
mkdir install
cd build
cmake ../ -DCMAKE_INSTALL_PREFIX=$PWD/../install/ -DLIBXML2_WITH_LZMA=OFF
make install -j6
cd ../install


echo "#!/bin/sh" > setup.LIBXML2.sh
echo "LIBXML2_DIR=$PWD" >> setup.LIBXML2.sh
echo 'LIBXML2_LIB_DIR=$LIBXML2_DIR/lib/' >> setup.LIBXML2.sh
echo 'LIBXML2_BIN_DIR=$LIBXML2_DIR/bin/' >> setup.LIBXML2.sh
echo 'LIBXML2_INC_DIR=$LIBXML2_DIR/include/' >> setup.LIBXML2.sh

echo 'LD_LIBRARY_PATH=$LIBXML2_LIB_DIR:$LD_LIBRARY_PATH' >> setup.LIBXML2.sh

echo 'PATH=$LIBXML2_BIN_DIR:$PATH' >> setup.LIBXML2.sh
echo 'PATH=$LIBXML2_INC_DIR:$PATH' >> setup.LIBXML2.sh

