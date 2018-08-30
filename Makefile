LIBDIR=$(shell mysql -u root -ss -p${MPass} mysql -e "SELECT @@plugin_dir;")
 
install:
	which gcc && which make || apt-get install -y build-essential
	ls /usr/include/mysql || apt-get install -y libmysqlclient-dev
	gcc -DMYSQL_DYNAMIC_PLUGIN -fPIC -Wall -I/usr/include/mysql -I. -shared lib_mysqludf_sys.c -o $(LIBDIR)/lib_mysqludf_sys.so
	#gcc -Wall -I/usr/include/mysql -I. -shared lib_mysqludf_sys.c -o $(LIBDIR)/lib_mysqludf_sys.so

