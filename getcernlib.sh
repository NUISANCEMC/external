
# Make Folder
mkdir cernlib
cd cernlib

# Download
wget http://www-zeuthen.desy.de/linear_collider/cernlib/new/cernlib-2005-all-new.tgz
tar -zxvf cernlib-2005-all-new.tgz
wget http://www-zeuthen.desy.de/linear_collider/cernlib/new/cernlib.2005.corr.2014.04.17.tgz
cp cernlib.2005.corr.2014.04.17.tgz cernlib.2005.corr.tgz
wget http://www-zeuthen.desy.de/linear_collider/cernlib/new/cernlib.2005.install.2014.04.17.tgz
tar -zxvf cernlib.2005.install.2014.04.17.tgz

return

# Run build
./Install_cernlib_and_lapack

# Clean up
rm ./*
cd ../

# setup
echo "export CERN=$PWD/cernlib/" > setupcernlib.sh
echo 'export CERN_LEVEL=2005' >> setupcernlib.sh
echo 'export CERN_ROOT=$CERN/$CERN_LEVEL' >> setupcernlib.sh
echo 'export LD_LIBRARY_PATH=$CERN_ROOT/lib/:$LD_LIBRARY_PATH' >> setupcernlib.sh
echo 'export PATH=$CERN_ROOT/bin/:$PATH' >> setupcernlib.sh
