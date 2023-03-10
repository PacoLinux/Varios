 
opt=2
rm time.log
 for test in  brock2*.clq
do
for cpu in AVX32   Pentium P4 gnuP4 IA32
do
for cores in  12 6 4 2 1
do
for prog in parcliqasm parcliq
do

vpc $prog -cpu$cpu -opt$opt -cores$cores pcount.o >vplog
echo $test $prog $cpu  cores $cores at opt $opt >>time.log
  ./$prog <$test >>time.log
done
done
done
done

 for test in  brock2*.clq
do
for cpu in Opteron
do
for cores in  12 6 4 2 1
do
for prog in   parcliq
do

vpc $prog -cpu$cpu -opt$opt -cores$cores   >vplog
echo $test $prog $cpu  cores $cores at opt $opt >>time.log
  ./$prog <$test >>time.log
done
done
done
done
 


 for test in  brock2*.clq
do
for cpu in Opteron AVX32   Pentium P4 gnuP4 IA32
do
for cores in   1
do
for prog in   maxcliq
do

vpc $prog -cpu$cpu -opt$opt -cores$cores   >vplog
echo $test $prog $cpu  cores $cores at opt $opt >>time.log
  ./$prog <$test >>time.log
done
done
done
done
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         t -cores$cores pcount.o >vplog
echo $test $prog $cpu  cores $cores at opt $opt >>time.log
  ./$prog <$test >>time.log
done
done

 


done
done


 

]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> cp script.sh scri[K[K[K[K[K| script.sh
If 'script.sh' is not a typo you can run the following command to lookup the package that contains the binary:
    command-not-found script.sh
bash: script.sh: command not found
cp: missing destination file operand after `script.sh'
Try `cp --help' for more information.
]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> cp script.sh| script.sh[1P script.sh* script.sh[1P script.sh[1P script.sh[1P script.sh[1P script.sh[1P script.sh[1P script.sh[1P script.sh[1P script.sh[1P script.sh[1P script.sh[1Pscript.sh[1P script.sh[1P script.sh
If 'script.sh' is not a typo you can run the following command to lookup the package that contains the binary:
    command-not-found script.sh
bash: script.sh: command not found
]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> cp script.sh| script.sh[12Pat script*ls[Kcat script.sh[7@svn update[C[C[C[C[C[C[C[C[C[C[7Pcat[C[C[C[C[C[C[C[C[C[Cls[Ksh script.sh
]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> sh maxcliq.sh

real	0m12.808s
user	0m12.769s
sys	0m0.008s
^C
]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> sh maxcliq.sh
^C
]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> sh maxcliq.sh
brock200.clq maxcliq Opteron cores 1 at opt
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m12.757s
user	0m12.729s
sys	0m0.000s
brock200.clq maxcliq AVX32 cores 1 at opt
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m12.775s
user	0m12.749s
sys	0m0.000s
brock200.clq maxcliq Pentium cores 1 at opt
^^C^C
]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> 
]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> sh maxcliq.sh
brock200.clq maxcliq Opteron cores 1 at opt 2
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m8.984s
user	0m8.961s
sys	0m0.000s
brock200.clq maxcliq AVX32 cores 1 at opt 2
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m10.953s
user	0m10.929s
sys	0m0.000s
brock200.clq maxcliq Pentium cores 1 at opt 2
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m11.041s
user	0m11.017s
sys	0m0.000s
brock200.clq maxcliq P4 cores 1 at opt 2
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m11.018s
user	0m10.981s
sys	0m0.012s
brock200.clq maxcliq gnuP4 cores 1 at opt 2
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m12.156s
user	0m12.125s
sys	0m0.004s
brock200.clq maxcliq IA32 cores 1 at opt 2
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m12.754s
user	0m12.721s
sys	0m0.004s
]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> sh maxcliq.sh
maxcliq.sh: line 2: syntax error near unexpected token `for'
maxcliq.sh: line 2: ` for test in  brock2*.clq'
]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> sh maxcliq.sh
brock200.clq maxcliq Opteron cores 1 at opt 0
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m9.139s
user	0m9.117s
sys	0m0.000s
brock200.clq maxcliq AVX32 cores 1 at opt 0
^C
]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> sh maxcliq.sh
brock200.clq maxcliq Opteron cores 1 at opt 0
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m9.104s
user	0m9.081s
sys	0m0.004s
brock200.clq maxcliq AVX32 cores 1 at opt 0
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m15.142s
user	0m15.109s
sys	0m0.000s
brock200.clq maxcliq IA32 cores 1 at opt 0
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m18.088s
user	0m18.045s
sys	0m0.004s
brock200.clq maxcliq Opteron cores 1 at opt 1
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m8.845s
user	0m8.825s
sys	0m0.000s
brock200.clq maxcliq AVX32 cores 1 at opt 1
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m15.127s
user	0m15.093s
sys	0m0.000s
brock200.clq maxcliq IA32 cores 1 at opt 1
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m18.010s
user	0m17.965s
sys	0m0.004s
brock200.clq maxcliq Opteron cores 1 at opt 2
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m8.979s
user	0m8.957s
sys	0m0.000s
brock200.clq maxcliq AVX32 cores 1 at opt 2
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m10.942s
user	0m10.917s
sys	0m0.000s
brock200.clq maxcliq IA32 cores 1 at opt 2
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m12.789s
user	0m12.757s
sys	0m0.000s
brock200.clq maxcliq Opteron cores 1 at opt 3
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m8.927s
user	0m8.901s
sys	0m0.004s
brock200.clq maxcliq AVX32 cores 1 at opt 3
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m10.768s
user	0m10.745s
sys	0m0.000s
brock200.clq maxcliq IA32 cores 1 at opt 3
           1           6          10          11          14          19          23          25          30          32          50          52          60          62          86          97         133         136         138         147         176
cliquesize          21

real	0m12.698s
user	0m12.665s
sys	0m0.004s
]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> svn add maxcli[K[K[K[K[K[Ktime.log
A         time.log
]2;wpc@manipa:...-code/tests/sicsa3]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests/sicsa3> av[K[Ksvn commit[K[K[K[K[K[K[K[K[K[Kcd ..
]2;wpc@manipa:...scalcom-code/tests]1;manipawpc@manipa:~/src/vectorpascalcom-code/tests> svn commit
[?1049h[?1h=[1;72r[?12;25h[?12l[?25h[27m[m[H[2J[?25l[72;1H"svn-commit.2.tmp" "svn-commit.2.tmp" 10L, 257C[>c[2;1H[34m--This line, and those below, will be ignored--[m

[35mM    tests/ACCEPT/conf575.pas
M    tests/sicsa3/.directory
M    tests/sicsa3/maxcliq.pas
M    tests/sicsa3/parcliq.pas
M    tests/sicsa3/parcliqasm.pas
M    tests/sicsa3/script.sh[m
[36mA    tests/sicsa3/time.log[m
[1m[34m~                                                                                                                                                                                                                                            [12;1H~                                                                                                                                                                                                                                            [13;1H~                                                                                                                                                                                                                                            [14;1H~                                                                                                                                                                                                                                            [15;1H~                                                                                                                                                                                                                                            [16;1H~                                                                                                                                                                                                                                            [17;1H~                                                                                                                                                                                                                                            [18;1H~                                                                                                                                                                                                                                            [19;1H~                                                                                                                                                                                                                                            [20;1H~                                                                                                                                                                                                                                            [21;1H~                                                                                                                                                                                                                                            [22;1H~                                                                                                                                                                                                                                            [23;1H~                                                                                                                                                                                                                                            [24;1H~                                                                                                                                                                                                                                            [25;1H~                                                                                                                                                                                                                                            [26;1H~                                                                                                                                                                                                                                            [27;1H~                                                                                                                                                                                                                                            [28;1H~                                                                                                                                                                                                                                            [29;1H~                                                                                                                                                                                                                                            [30;1H~                                                                                                                                                                                                                                            [31;1H~                                                                                                                                                                                                                                            [32;1H~                                                                                                                                                                                                                                            [33;1H~                                                                                                                                                                                                                                            [34;1H~                                                                                                                                                                                                                                            [35;1H~                                                                                                                                                                                                                                            [36;1H~                                                                                                                                                                                                                                            [37;1H~                                                                                                                                                                                                                                            [38;1H~                                                                                                                                                                                                                                            [39;1H~                                                                                                                                                                                                                                            [40;1H~                                                                                                                                                                                                                                            [41;1H~                                                                                                                                                                                                                                            [42;1H~                                                                                                                                                                                                                                            [43;1H~                                                                                                                                                                                                                                            [44;1H~                                                                                                                                                                                                                                            [45;1H~                                                                                                                                                                                                                                            [46;1H~                                                                                                                                                                                                                                            [47;1H~                                                                                                                                                                                                                                            [48;1H~                                                                                                                                                                                                                                            [49;1H~                                                                                                                                                                                                                                            [50;1H~                                                                                                                                                                                                                                            [51;1H~                                                                                                                                                                                                                                            [52;1H~                                                                                                                                                                                                                                            [53;1H~                                                                                                                                                                                                                                            [54;1H~                                                                                                                                                                                                                                            [55;1H~                                                                                                                                                                                                                                            [56;1H~                                                                                                                                                                                                                                            [57;1H~                                                                                                                                                                                                                                            [58;1H~                                                                                                                                                                                                                                            [59;1H~                                                                                                                                                                                                                                            [60;1H~                                                                                                                                                                                                                                            [61;1H~                                                                                                                                                                                                                                            [62;1H~                                                                                                                                                                                                                                            [63;1H~                                                                                                                                                                                                                                            [64;1H~                                                                                                                                                                                         