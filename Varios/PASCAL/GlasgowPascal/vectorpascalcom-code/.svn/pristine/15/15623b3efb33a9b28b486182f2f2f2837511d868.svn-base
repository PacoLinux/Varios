# install make file
all: rtl rtl.o rtlb.o

rtl: rtl.jar
	jar -xf rtl.jar
	touch rtl/rtl.c

rtl.o: rtl rtl/rtl.c rtl
	(cd rtl;make rtl.o)

rtlb.o: rtl rtl/rtl.c rtl 
	(cd rtl;make rtlb.o)



clean: 
	rm -r -f rtl
