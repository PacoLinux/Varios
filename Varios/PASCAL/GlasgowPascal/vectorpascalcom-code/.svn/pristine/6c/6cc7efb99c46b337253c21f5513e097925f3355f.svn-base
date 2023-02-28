CFLAGS=-g

all: uselib
	uselib

examplelib.s: examplelib.pas
	vpc examplelib -S -Aexamplelib.s -cpugnuPentium
#    complile the library to assembly language

examplelib.o: examplelib.s
	gcc $(CFLAGS)    -c examplelib.s

rtl.o: rtl.c
	gcc $(CFLAGS) -DLIBRARY   -c rtl.c
# compile it in a form suitable for use in a library

rtl.c: ../../mmpc/rtl.c
	cp ../../mmpc/rtl.c rtl.c
# get a copy of the pascal run time library from wherever we have installed the vector pascal system

uselib: uselib.c examplelib.o rtl.o
	gcc $(CFLAGS) uselib.c rtl.o examplelib.o -o uselib
# link the C program with the examplelib

