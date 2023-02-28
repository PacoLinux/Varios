@echo off
gcc -g -S %mmpcdir%\rtl.c
java -Xmx800m  -Dmmpcdir=%mmpcdir% -jar %mmpcdir%/mmpc.jar %1 -o%1.exe -cpuP3 -U -fcoff -opt0 %2 %3 %4  %5 %6 %7 %8
 
