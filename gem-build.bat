call gem uninstall helpful_utils
del /Q pkg
call rake manifest
call rake install
cd pkg
call gem install helpful_utils-0.0.1
cd ..