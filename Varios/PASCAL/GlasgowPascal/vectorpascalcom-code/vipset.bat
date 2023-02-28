rem @echo off

cp %mmpcdir%rtl.o WIN_rtl.o
cp %mmpcdir%System.pas .
cp %mmpcdir%macros.asm .

java    %mmpcdir%SystemReset
