mkdir lhapdf
cd lhapdf

wget http://www.hepforge.org/archive/lhapdf/lhapdf-5.9.1.tar.gz
tar xzvf lhapdf-5.9.1.tar.gz

mkdir lhapdf-install
cd lhapdf-5.9.1
./configure --prefix=$PWD/../lhapdf-install
gmake
gmake install

cd ../
rm -rf lhapdf-5.9.1
rm -rf lhapdf-5.9.1.tar.gz
cd ../

echo "export LHAPDF=$PWD/lhapdf/lhapdf-install/" > setuplhapdf.sh
echo 'export LHAPDF_LIB=$LHAPDF/lib/' >> setuplhapdf.sh
echo 'export LHAPDF_INC=$LHAPDF/include/' >> setuplhapdf.sh
echo 'export LHAPATH=$LHAPDF/share/lhapdf/PDFsets/' >> setuplhapdf.sh
echo 'export LD_LIBRARY_PATH=$LHAPDF_LIB:$LD_LIBRARY_PATH' >> setuplhapdf.sh
