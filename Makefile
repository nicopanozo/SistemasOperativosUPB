applic: utils_math.o utils_net.o applic.o
	cc utils_math.o utils_net.o applic.o -o applic
utils_math.o: utils_math.c common.h
	cc -fPIC -c utils_math.c
utils_net.o: utils_net.c common.h
	cc -fPIC -c utils_net.c
applic.o: applic.c common.h
	cc -fPIC -c applic.c
slib: utils_math.o utils_net.o
	ar rcs libstatic_utils.a utils_math.o utils_net.o
	ranlib libstatic_utils.a
dlib: utils_math.o utils_net.o
	cc -shared -o libdynamic_utils.so utils_math.o utils_net.o
static: applic.o
	cc -static applic.o -o s_applic libstatic_utils.a
dynamic: applic.o
	sh dynamic.sh

clean:
	rm *.o applic *.a *.so s_applic d_applic new_applic

