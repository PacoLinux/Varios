echo run times > times
for cg in P4 gnuP4 AVX32 gnu486 Pentium gnuPentium P3 IA32 ia32 AVX64 K6
do
echo $cg
vpc vectest -cpu$cg -opt3 >/dev/null
time -o$cg vectest >/dev/null
echo $cg >> times
cat $cg >>times
done
 
 cg=C
 echo $cg
 vpc vectest -cpu$cg >/dev/null
time -o$cg vectest >/dev/null
echo $cg >> times
cat $cg >>times
