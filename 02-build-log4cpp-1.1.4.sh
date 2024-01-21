mkdir log4cpp-1.1.4
cd log4cpp-1.1.4
wget https://deac-fra.dl.sourceforge.net/project/log4cpp/log4cpp-1.1.x%20%28new%29/log4cpp-1.1/log4cpp-1.1.4.tar.gz
tar -zxvf log4cpp-1.1.4.tar.gz
rm log4cpp-1.1.4.tar.gz 
mv log4cpp/* ./
mkdir install-log4cpp
./configure --prefix=$PWD/install-log4cpp
make -j6 install

cd install-log4cpp

echo "#!/bin/sh" > setup.LOG4CPP.sh
echo "LOG4CPP_DIR=$PWD" >> setup.LOG4CPP.sh
echo 'LOG4CPP_LIB_DIR=$LOG4CPP_DIR/lib/' >> setup.LOG4CPP.sh
echo 'LOG4CPP_BIN_DIR=$LOG4CPP_DIR/bin/' >> setup.LOG4CPP.sh
echo 'LOG4CPP_INC_DIR=$LOG4CPP_DIR/include/' >> setup.LOG4CPP.sh

echo 'LD_LIBRARY_PATH=$LOG4CPP_LIB_DIR:$LD_LIBRARY_PATH' >> setup.LOG4CPP.sh

echo 'PATH=$LOG4CPP_BIN_DIR:$PATH' >> setup.LOG4CPP.sh
echo 'PATH=$LOG4CPP_INC_DIR:$PATH' >> setup.LOG4CPP.sh
