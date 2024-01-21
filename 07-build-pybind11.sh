	git clone $(pybind11_REPO) $(pybind11_DIR)
	cd $(pybind11_DIR); git checkout $(pybind11_BRANCH)
	mkdir $(pybind11_DIR)/install
	rm -rf $(pybind11_DIR)/build
	mkdir $(pybind11_DIR)/build
	cd $(pybind11_DIR)/build; cmake ../ -DCMAKE_INSTALL_PREFIX=../install/; make install
