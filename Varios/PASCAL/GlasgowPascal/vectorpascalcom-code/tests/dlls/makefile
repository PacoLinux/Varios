CFLAGS=-mno-cygwin
# specify that cygwin gcc is to rely on the windows built in C libraries

all: usedll.exe exampledll.dll
	usedll

exampledll.s: exampledll.pas
	vpc-cygwin exampledll -S -Aexampledll.s
#    use the special cygwin version of the vpc compiler

exampledll.o: exampledll.s
	gcc $(CFLAGS) -DBUILD_DLL   -c exampledll.s 

rtl.o: rtl.c
	gcc $(CFLAGS) -DBUILD_DLL   -c rtl.c
# compile it in a form suitable for use in a dll

rtl.c: ../../mmpc/rtl.c
	cp ../../mmpc/rtl.c rtl.c
# get a copy of the pascal run time library

exports.o: exampledll.a
	 

exampledll.a: exampledll.def makefile
	dlltool -v    -e exports.o -l exampledll.a  -d exampledll.def -D exampledll.dll exampledll.o  rtl.o 
#	Note that you must use the -D option to tell dlltool the name of the dll you will build
#     this also reads in the .def file it produces exampledll.a with which
#     you statically link your c program ( it contains stubs to the real dynamic fns )


exampledll.dll: exports.o rtl.o exampledll.o
	gcc $(CFLAGS) -shared exports.o rtl.o exampledll.o   -o exampledll.dll  
# build the dll using the export spec produced by dlltool
 
usedll.o: usedll.c
	gcc $(CFLAGS) -c usedll.c
# compile the c program to an object file

usedll.exe: usedll.o exampledll.a 
	gcc $(CFLAGS) usedll.c exampledll.a -o usedll
# link the c program with the exampledll stub library

