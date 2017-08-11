
mkdir pythia6
cd pythia6
wget https://genie.hepforge.org/trac/export/7085/generator/trunk/src/scripts/build/ext/build_pythia6.sh
chmod +x build_pythia6.sh
./build_pythia6.sh 6428
mv v6_428/lib/ ./lib/
mv v6_428/inc/ ./inc/
rm -rf v6_428/
cd ../
echo "export PYTHIA6=$PWD/pythia6/lib/" > setuppythia6.sh
echo 'export LD_LIBRARY_PATH=$PYTHIA6/:$LD_LIBRARY_PATH' >> setuppythia6.sh
