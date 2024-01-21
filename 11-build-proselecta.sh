	git clone $(ProSelecta_REPO) $(ProSelecta_DIR)
	cd $(ProSelecta_DIR)/; git checkout $(ProSelecta_BRANCH)
	mkdir $(ProSelecta_DIR)/install
	rm -rf $(ProSelecta_DIR)/build
	mkdir $(ProSelecta_DIR)/build
	cd $(ProSelecta_DIR)/build; cmake ../ -DCMAKE_INSTALL_PREFIX=../install/; make install
