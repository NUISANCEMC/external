
# Target: yaml-cpp
YAML_CPP_DIR := yaml-cpp
YAML_CPP_BRANCH := yaml-cpp-0.6.3
YAML_CPP_REPO := https://github.com/jbeder/yaml-cpp.git

yaml-cpp: yaml-cpp-clean yaml-cpp-checkout yaml-cpp-build

yaml-cpp-checkout:
	git clone $(YAML_CPP_REPO) $(YAML_CPP_DIR)
	cd $(YAML_CPP_DIR); git checkout $(YAML_CPP_BRANCH)
	mkdir $(YAML_CPP_DIR)/install
	mkdir $(YAML_CPP_DIR)/build
	cd $(YAML_CPP_DIR)/build; cmake ../ -DCMAKE_INSTALL_PREFIX=../install/ -DYAML_BUILD_SHARED_LIBS=ON; make install
