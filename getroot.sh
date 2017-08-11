
if [ -f "packages/root-package.tar.gz" ]
then
    echo "ROOT found! Extracting!"
    tar -zxvf packages/root-package.tar.gz
else
    echo "Cannot find root package. Building from source!"
    
    return

    mkdir root
    cd root

    wget https://root.cern.ch/download/root_v5.34.36.source.tar.gz
    tar -zxvf root_v5.34.36.source.tar.gz
    mkdir root-build
    mkdir root-install
    cd root-build
    export PYTHIA6=/home/nuisdock/NUISANCEMC/external/pythia6/lib/
    
    cmake ../root/ -DCMAKE_INSTALL_PREFIX=$PWD/../root-install/  -Dbuiltin_gsl=ON -Dmathmore=ON -Dminuit2=ON -Dgenvector=ON -Dbuiltin_freetype=ON -Dbuiltin_glew=ON -Dbuiltin_ftgl=ON -Dbuiltin_zlib=ON -Dpythia6=ON -DPYTHIA6_LIBRARY=$PYTHIA6/libPythia6.so -Dtmva=OFF
    
    make 
    make install
    
    cd ../
    cp $PYTHIA6/libPythia6.so root-install
    rm -rf root-build
    rm -rf root
    rm -rf root_v5.34.36.source.tar.gz
    
    cd ../
fi
    
# Create setup script
echo "source $PWD/root/root-install/bin/thisroot.sh" > ./setuproot.sh

