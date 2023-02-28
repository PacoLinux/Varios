all: rtlb.o rtl.o

rtlb.o: rtl.c gc.a
	gcc -c -DBOEHM -Igc/include -o rtlb.o rtl.c
	cp rtlb.o ..
	cp gc.a ..

rtl.o: rtl.c
	gcc -c  -o rtl.o rtl.c
	cp rtl.o ..

clean:
	rm rtlb.o rtl.o


gc.a:	gc/gc.a
	cp gc/gc.a .

gc/gc.a:
	(cd gc; make)
