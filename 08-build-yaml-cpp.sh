
# Target: yaml-cpp
YAML_CPP_DIR="yaml-cpp"
YAML_CPP_BRANCH="yaml-cpp-0.6.3"
YAML_CPP_REPO="https://github.com/jbeder/yaml-cpp.git"

git clone ${YAML_CPP_REPO} ${YAML_CPP_DIR}
cd ${YAML_CPP_DIR}; git checkout ${YAML_CPP_BRANCH}; cd ../
mkdir ${YAML_CPP_DIR}/install
mkdir ${YAML_CPP_DIR}/build
cd ${YAML_CPP_DIR}/build; cmake ../ -DCMAKE_INSTALL_PREFIX=../install/ -DYAML_BUILD_SHARED_LIBS=ON; make install; 
cd ../../
cd ${YAML_CPP_DIR}/install

echo "#!/bin/sh" > setup.YAMLCPP.sh
echo "YAMLCPP_DIR=$PWD" >> setup.YAMLCPP.sh
echo 'YAMLCPP_LIB_DIR=$YAMLCPP_DIR/lib/' >> setup.YAMLCPP.sh
echo 'YAMLCPP_INC_DIR=$YAMLCPP_DIR/include/' >> setup.YAMLCPP.sh
echo 'LD_LIBRARY_PATH=$YAMLCPP_LIB_DIR:$LD_LIBRARY_PATH' >> setup.YAMLCPP.sh
