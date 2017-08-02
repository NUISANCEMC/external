#!/bin/sh

# Get GENIE Support Scripts and build
git clone https://github.com/GENIEMC/GENIESupport.git
cd GENIESupport
git checkout -b R-2_11_0.0-br R-2_11_0.0
./build_support.sh -p 6 
cd ../

# Make an external setup script
echo "#!/bin/sh" > setupexternal.sh
echo 'export NUISANCE_EXTERNAL="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"' >> setupexternal.sh
echo 'export LIBXML2_LIB=/usr/lib/' >> setupexternal.sh
echo 'export LIBXML2_INC=/usr/include/libxml2/' >> setupexternal.sh
echo 'source $NUISANCE_EXTERNAL/GENIESupport/environment_setup.sh' >> setupexternal.sh