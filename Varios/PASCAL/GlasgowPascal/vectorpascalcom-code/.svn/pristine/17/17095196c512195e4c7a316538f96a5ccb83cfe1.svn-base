echo on
cl /c /D SYSTIME /D NIOS /D UNISTD /D NOBOEHM /F4000000 /D MSVC rtl.c
java -Xmx300m  -Dmmpcdir=%mmpcdir% -jar %mmpcdir%/mmpc.jar %1  -cpuPentium -U -fwin32 -opt0 -S %2 %3 %4  %5 %6 %7 %8

 
