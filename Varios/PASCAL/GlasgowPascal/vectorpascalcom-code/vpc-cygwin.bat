@echo off
gcc -g -S %mmpcdir%\rtl.c
java -Xmx400m  -Dmmpcdir=%mmpcdir% -jar %mmpcdir%/mmpc.jar %1 -o%1.exe -cpugnuPentium -U -felf -opt0 %2 %3 %4  %5 %6 %7 %8
 
