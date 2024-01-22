sudo apt-get install gfortran fort77 csh tcsh
sudo apt-get install libmotif-dev

#git clone https://github.com/luketpickering/cernlibgcc5-.git cernlib-2005
mkdir cernlib-2005
cd cernlib-2005

#echo 'sed -i -e "s/ar clq/ar cq/g" $(find ./ -name Makefile)' >> ./pull_down_and_patch.sh 
# Download
wget http://www-zeuthen.desy.de/linear_collider/cernlib/new/cernlib-2005-all-new.tgz
tar -zxvf cernlib-2005-all-new.tgz
wget http://www-zeuthen.desy.de/linear_collider/cernlib/new/cernlib.2005.corr.2020.12.11.tgz
tar -zxvf cernlib.2005.corr.2020.12.11.tgz
wget http://www-zeuthen.desy.de/linear_collider/cernlib/new/cernlib.2005.install.2020.12.11.tgz
tar -zxvf cernlib.2005.install.2020.12.11.tgz

echo '#!/bin/bash' > g77
echo 'ARGS="$@"' >> g77
echo 'ARGS="${ARGS//\-fugly\-complex}"' >> g77
echo 'ARGS="${ARGS//\-DCERNLIB\_QMGLIBC}"' >> g77
echo 'gfortran -std=legacy -fallow-invalid-boz -fno-automatic -fno-second-underscore -fallow-argument-mismatch -fallow-invalid-boz $ARGS'  >> g77
chmod +x g77

export PATH=$PWD:$PATH

# setup
echo "export CERN=$PWD/cernlib-build/" > setup.CERNLIB.sh
echo 'export CERN_LEVEL=2005' >> setup.CERNLIB.sh
echo 'export CERN_ROOT=$CERN/$CERN_LEVEL' >> setup.CERNLIB.sh
echo 'export LD_LIBRARY_PATH=$CERN_ROOT/lib/:$LD_LIBRARY_PATH' >> setup.CERNLIB.sh
echo 'export PATH=$CERN_ROOT/bin/:$PATH' >> setup.CERNLIB.sh

source setup.CERNLIB.sh

./Install_cernlib


# ./build_cernlib.sh

# # Make Folder
# mkdir cernlib-2005
# cd cernlib-2005





# # Run build
# # sed -i -e 's/FC=" "/FC="gfortran"/g' ./Install_cernlib_and_lapack
# ./Install_cernlib_and_lapack

