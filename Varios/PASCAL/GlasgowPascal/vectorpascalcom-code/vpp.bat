@echo off
gcc -g -S %mmpcdir%\rtl.c
java -Xrunhprof:heap=sites,depth=6,interval=50,cpu=samples -Xmx100m  -Dmmpcdir=%mmpcdir% -jar %mmpcdir%/mmpc.jar %1 -o%1.exe  -fcoff -opt0 %2 %3 %4  
rem nasm -fcoff -o p.o p.asm
rem gcc -g -o%1.exe p.o %mmpcdir%\rtl.c %2 %3 %4  
 
