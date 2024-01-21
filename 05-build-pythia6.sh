# Get dependencies
sudo apt-get install wget gfortran sed

wget https://raw.githubusercontent.com/GENIE-MC/Generator/master/src/scripts/build/ext/build_pythia6.sh
chmod +x ./build_pythia6.sh
./build_pythia6.sh

rm ./build_pythia6.sh

mv v6_428 pythia6-6.4.28
cd pythia6-6.4.28
# #make temporary directory for downloading sources
# mkdir ./pythia6
# cd ./pythia6
# unamevar=$(uname)
# unamelow=$(echo "$unamevar" | tr '[:upper:]' '[:lower:]')
# echo $unamelow
# #dowload pythia6 sources 
# wget https://root.cern.ch/download/pythia6.tar.gz
# tar xzf pythia6.tar.gz
# mv pythia6/* ./
# rm pythia6.tar.gz
# #modify ./makePythia6.linux to use gfortran in place of g77
# sed -i 's/g77/gfortran/g' ./makePythia6.${unamelow}
# sed -i 's@gcc -c -fPIC pythia6_common_address.c@gcc -c -fPIC pythia6_common_address.c -DWIN32=0@g' ./makePythia6.${unamelow}
# #make libPythia6.so
# bash ./makePythia6.${unamelow}

echo "#!/bin/sh" > setup.PYTHIA6.sh
echo "PYTHIA6_DIR=$PWD" >> setup.PYTHIA6.sh
echo 'PYTHIA6_LIB=libPythia6.so' >> setup.PYTHIA6.sh
echo 'PYTHIA6_LIB_DIR=$PYTHIA6_DIR/lib/' >> setup.PYTHIA6.sh
echo 'LD_LIBRARY_PATH=$PYTHIA6_LIB_DIR:$LD_LIBRARY_PATH' >> setup.PYTHIA6.sh
