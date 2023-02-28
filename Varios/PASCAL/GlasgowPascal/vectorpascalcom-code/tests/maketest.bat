cp p.asm p.s
rem gcc   -m32 -msse2 -Wpointer-arith  -DCLSIMD -Wfloat-equal -g3    -I"C:\Program Files\AMD APP\/include"      ../mmpc/clsimd.c  -o test.exe  -lglu32 -lOpenCL  -L"C:\Program Files\AMD APP\/lib/x86" p.o  ../mmpc/rtl.c
gcc   -m32 -msse2 -Wpointer-arith  -DCLSIMD -Wfloat-equal -g3    -I"C:\Program Files\AMD APP\/include"      ../mmpc/clsimd.c  -o test.exe  -lglu32 -lOpenCL   p.o  ../mmpc/rtl.c
rem gcc -m32 -msse2 -Wpointer-arith -Wfloat-equal -g3 -DCLSIMD -o simplevec.exe  -lglu32  -lOpenCL  p.o   d:/vp/mmpc/rtl.c -I"C:\Program Files\AMD APP\/include"  d:/vp/mmpc/clsimd.c -L"C:\Program Files\AMD APP\/lib/x86"
