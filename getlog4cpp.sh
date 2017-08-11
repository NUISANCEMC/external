
mkdir log4cpp
cd log4cpp

mkdir log4cpp-install
export CVSROOT=':pserver:anonymous@log4cpp.cvs.sourceforge.net:/cvsroot/log4cpp'
cvs -z3 co log4cpp
cd log4cpp
./autogen.sh
./configure --prefix=$PWD/../log4cpp-install
gmake
gmake install

cd ../
rm -r log4cpp
cd ../

echo "export LOG4CPP=$PWD/log4cpp/log4cpp-install/" > setuplog4cpp.sh
echo 'export LOG4CPP_INC=$LOG4CPP/include/' >> setuplog4cpp.sh
echo 'export LOG4CPP_LIB=$LOG4CPP/lib/' >> setuplog4cpp.sh
echo 'export LD_LIBRARY_PATH=$LOG4CPP_LIB:$LD_LIBRARY_PATH' >> setuplog4cpp.sh
