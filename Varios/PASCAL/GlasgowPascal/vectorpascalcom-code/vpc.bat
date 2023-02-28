@echo off
 
java -Xmx800m  -Dmmpcdir=%mmpcdir% -jar %mmpcdir%/mmpc.jar %1 -o%1.exe -cpugnuP4 -U -felf -DPTW32 -opt0 %2 %3 %4  %5 %6 %7 %8
 
