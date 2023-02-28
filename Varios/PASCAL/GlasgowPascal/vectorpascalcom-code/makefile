#CLASSPATH=/usr/java/lib/classes.zip
mmpcdir=./mmpc
reldir=~/bin
DC=c:\classes
# put -V here for full debugging info from test runs
VERBOSE=
# set prefix to -U when compiling under windows
PREFIX=
PROF=-pg
# set OMF to -felf for linux or cygwin and -fcoff for djgpp
OMF=-felf
MMPC=java -jar mmpc.jar
OUT=.
CC=gcc -c
TM=time
#JVC=javac -d $(OUT)
#JVC=javac
#JVC=javac -source 1.3
JVC=javac   
#JVC=jikes
# define GCF if we are using BOEHM collector
GCF=BOEHM
#GCF=NOBOEHM
DISK=win
#JAVA=java  -classpath $(CLASSPATH)
JAVA=java -Xmx300m 
# Building the Instruction list from the "OriginalInstructionFile" file using AWK
INSLIST=gawk -f CBFM.awk TTT.txt




CGS=ilcg/tree/gnuIntelPeep.class\
  ilcg/tree/PentiumCG.class\
  ilcg/tree/MIC.class\
  ilcg/tree/AMD64.class\
  ilcg/tree/AMD64CG.class\
  ilcg/tree/ARM.class\
  ilcg/tree/ARMCG.class\
  ilcg/tree/AVX2CG.class\
  ilcg/tree/AVX2.class\
  ilcg/tree/AVX64CG.class\
	ilcg/tree/AVX64.class\
	ilcg/tree/C.class\
	ilcg/tree/CCG.class\
	ilcg/tree/C32CG.class\
	ilcg/tree/C64.class\
	ilcg/tree/C64CG.class\
	ilcg/tree/EECG.class\
	ilcg/tree/EE.class ilcg/tree/PPC.class\
	ilcg/tree/IA32.class\
	ilcg/tree/Pentium.class\
	ilcg/tree/P3.class\
	ilcg/tree/gnu486.class\
	ilcg/tree/gnuPentium.class\
	ilcg/tree/gnuP4.class\
	ilcg/tree/P4.class\
	ilcg/tree/Opteron.class\
	ilcg/tree/gnuPentiumCG.class\
	ilcg/tree/gnuP4CG.class ilcg/tree/IA32CG.class\
	ilcg/tree/OpteronCG.class\
	ilcg/tree/MIC.class\
    ilcg/tree/MICPeep.class\
	ilcg/tree/MICCG.class\
	ilcg/tree/PPCCG.class\
	ilcg/tree/PPECG.class\
	ilcg/tree/P3CG.class\
	ilcg/tree/gnu486CG.class \
	ilcg/tree/P4CG.class\
	ilcg/tree/SMICCG.class\
	ilcg/tree/SSE2CG.class 

 

PASCALSTEM= ilcg/Pascal/PascalCompiler\
						ilcg/Pascal/ArrayFinder\
						ilcg/Pascal/ArraySubscription\
                        ilcg/Pascal/ArrayType\
						ilcg/Pascal/CommonScalarFinder\
                        ilcg/Pascal/Compiler\
						ilcg/Pascal/CPUrun\
                        ilcg/Pascal/Dimensioned\
                        ilcg/Pascal/DimensionError\
                        ilcg/Pascal/Field\
                        ilcg/Pascal/ForwardProc\
                        ilcg/Pascal/GPUPascal\
                        ilcg/Pascal/IntegralType\
                        ilcg/Pascal/LiteralVector\
						ilcg/Pascal/MultiThreadPascal\
						ilcg/Pascal/NonPureFunctionFinder\
                        ilcg/Pascal/ObsConstOf\
						ilcg/Pascal/OrdinalType\
                        ilcg/Pascal/PascalFileType\
                        ilcg/Pascal/Pointer\
                        ilcg/Pascal/PointerToNamedType\
                        ilcg/Pascal/ProcType\
                        ilcg/Pascal/ProgressNotifier\
                        ilcg/Pascal/RealType\
                        ilcg/Pascal/RecordType\
                        ilcg/Pascal/Ref\
                        ilcg/Pascal/ScalarRange\
                        ilcg/Pascal/SchemaField\
                        ilcg/Pascal/SetType\
                        ilcg/Pascal/SimpleType\
                        ilcg/Pascal/StringType\
                        ilcg/Pascal/TOP\
						ilcg/Pascal/TypeTag\
						ilcg/Pascal/Undeclared\
                        ilcg/Pascal/UserDefinedOperator\
                        ilcg/Pascal/Yylex\
                        ilcg/STelEnumerator\
			ilcg/STEnumerator ilcg/SyntaxError\
			ilcg/SymbolTable


UNITS=			VPunits/invertgauss.pas\
			VPunits/VectorClient.pas\
			VPunits/cl.pas\
			VPunits/clvecmat.pas\
			VPunits/blas.pas\
			VPunits/blas1_s.pas\
			VPunits/bmp.pas\
			VPunits/genericset.pas\
			VPunits/graphio.pas\
			VPunits/maketest.pas\
			VPunits/matrices.pas\
			VPunits/matrices_real.pas\
			VPunits/pmats.pas\
			VPunits/ppm.pas\
			VPunits/pvecs.pas\
			VPunits/sdl_rwops.c\
			VPunits/numerics.pas\
			VPunits/sdl.pas\
			VPunits/sdl_mixer.pas\
			VPunits/sdl_ttf.pas\
			VPunits/testrealset.pas\
			VPunits/testset.pas\
			VPunits/transpose.pas\
			VPunits/vectors.pas\
			system.pas\
			VPunits/Unitsread.me\
			VPunits/vectors_real.pas

PASCALSRCSTEM=ilcg/Pascal/SimpleType ilcg/Pascal/UserDefinedOperator	ilcg/Pascal/Yylex\
			ilcg/Pascal/ArrayType\
			ilcg/Pascal/RecordType\
			ilcg/Pascal/IntegralType\
			ilcg/Pascal/SetType\
			ilcg/Pascal/MultiThreadPascal\
			ilcg/Pascal/PascalCompiler\
                  ilcg/Pascal/ProgressNotifier\
			ilcg/Pascal/OrdinalType\
			ilcg/Pascal/ScalarRange\
			ilcg/Pascal/StringType\
			ilcg/Pascal/ProcType\
			ilcg/Pascal/ArraySubscription\
			ilcg/Pascal/Compiler


ISOLATES=ilcg/Pascal/YyCaller.class\
	ilcg/Pascal/TreeSearcher.class\
	ilcg/Pascal/ExternalReferenceFinder.class\
	ilcg/Pascal/CommonSubscriptionFinder.class\
	ilcg/Pascal/UndeclaredType.class\
	ilcg/Pascal/CommonCastFinder.class ilcg/tree/Pushop.class\
	ilcg/Pascal/UnitHolder.class\
	ilcg/Pascal/UndeclaredVariable.class\
	ilcg/Pascal/TypeIdError.class\
	ilcg/Pascal/BoolLit.class


TREESTEM=       ilcg/tree/Annotated\
        ilcg/tree/AsmLink\
        ilcg/tree/Assign\
        ilcg/tree/AssignStreaming\
        ilcg/tree/AssignmentException\
        ilcg/tree/Block\
        ilcg/tree/BoundedHinttable\
        ilcg/tree/Cartesian\
        ilcg/tree/Cast\
        ilcg/tree/CharLit\
        ilcg/tree/CommonMemExpressionFinder\
        ilcg/tree/CommonRHSFinder\
        ilcg/tree/CommonSubExpressionFinder\
        ilcg/tree/Condition\
        ilcg/tree/Control\
        ilcg/tree/Deref\
        ilcg/tree/dif\
        ilcg/tree/div\
        ilcg/tree/Dyad\
        ilcg/tree/evaluatedDyad\
        ilcg/tree/ExpressionSearcher\
        ilcg/tree/ExpressionSubstituter\
        ilcg/tree/ExtLabel\
        ilcg/tree/Fail\
        ilcg/tree/For\
        ilcg/tree/Format\
        ilcg/tree/Function\
        ilcg/tree/Goto\
        ilcg/tree/If\
		ilcg/tree/IlcgParam\
        ilcg/tree/ImpLabel\
        ilcg/tree/Int\
        ilcg/tree/Integer\
        ilcg/tree/IntelPeep\
        ilcg/tree/IsMemref\
        ilcg/tree/Label\
        ilcg/tree/LabelFinder\
        ilcg/tree/Loader\
        ilcg/tree/LocalFinder\
        ilcg/tree/LocalStoreAllocator\
        ilcg/tree/Location\
        ilcg/tree/Mem\
        ilcg/tree/Memref\
        ilcg/tree/MICPeep\
        ilcg/tree/mod\
        ilcg/tree/Monad\
        ilcg/tree/MyHashSet\
        ilcg/tree/MySet\
        ilcg/tree/MyVecSet\
        ilcg/tree/Node\
        ilcg/tree/Num\
        ilcg/tree/Op\
        ilcg/tree/Pattern\
        ilcg/tree/Procedure\
        ilcg/tree/prod\
        ilcg/tree/Push ilcg/tree/Real\
			ilcg/tree/Pushop\
        ilcg/tree/Ref\
        ilcg/tree/Register\
        ilcg/tree/RegisterStack\
        ilcg/tree/RegReservation\
        ilcg/tree/Reservation\
        ilcg/tree/Return\
        ilcg/tree/RollBackBuffer\
        ilcg/tree/Statement\
        ilcg/tree/StreamGobbler\
        ilcg/tree/SubField\
        ilcg/tree/SubscriptionRemover\
        ilcg/tree/SubstitutionException\
        ilcg/tree/sum\
        ilcg/tree/toReal\
        ilcg/tree/TreeExaminer\
        ilcg/tree/TreeModifier\
        ilcg/tree/Type\
        ilcg/tree/UnguardedAssignFinder\
        ilcg/tree/Unit\
        ilcg/tree/Variable\
		ilcg/tree/Walker\
        ilcg/tree/Writecounter\
		ilcg/tree/WritedependencyFinder\
		ilcg/tree/WrittenSetFinder



TREESRCSTEM=ilcg/tree/Node  ilcg/tree/Assign  ilcg/tree/AssignStreaming ilcg/tree/Block ilcg/tree/BoundedHinttable\
ilcg/tree/Cartesian ilcg/tree/Label ilcg/tree/Cast\
ilcg/tree/CommonSubExpressionFinder ilcg/tree/Deref\
ilcg/tree/Dyad ilcg/tree/ExpressionSubstituter\
ilcg/tree/Fail ilcg/tree/Location ilcg/tree/Goto\
ilcg/tree/Annotated\
ilcg/tree/TreeExaminer ilcg/tree/TreeModifier\
ilcg/tree/Return\
ilcg/tree/RegisterStack\
ilcg/tree/SubField\
ilcg/tree/Control\
ilcg/tree/ImpLabel ilcg/tree/ExtLabel\
ilcg/tree/Type\
ilcg/tree/AsmLink\
ilcg/tree/AssignmentException \
ilcg/tree/For ilcg/tree/Format ilcg/tree/If\
ilcg/tree/Int ilcg/tree/Integer\
ilcg/tree/LocalStoreAllocator ilcg/tree/IntelPeep\
ilcg/tree/Mem ilcg/tree/Memref ilcg/tree/MICPeep ilcg/tree/Monad\
ilcg/tree/Num ilcg/tree/Op\
ilcg/tree/Push\
ilcg/tree/Loader\
ilcg/tree/Function\
ilcg/tree/Procedure ilcg/tree/Push ilcg/tree/Real\
ilcg/tree/Ref ilcg/tree/Register\
ilcg/tree/RegReservation ilcg/tree/RollBackBuffer\
ilcg/tree/Statement ilcg/tree/Unit ilcg/tree/Variable


#ilcg/tree/C.class ilcg/tree/CCG.class



CGO=$(subst .class,.o,$(CGS))

TREE=$(addsuffix .class, $(TREESTEM))
TREESRC=$(addsuffix .java,$(TREESRCSTEM))
PASCAL=$(addsuffix .class, $(PASCALSTEM))
PASCALSRC = $(addsuffix .java, $(PASCALSRCSTEM))
TREEO=$(addsuffix .o,$(TREESTEM))
PASCO=$(subst .class,.o,$(PASCAL))
ISOLATESO=$(subst .class,.o,$(ISOLATES))
OBJFILES=      $(ISOLATESO)   Vptex.o   compiler.o ilcg/tree/Pentium.o ilcg/tree/PentiumCG.o

all:   mmpc	prog    mmpc.jar testver pascalgenerators


cgs.jar: $(CGS)
	jar -cf cgs.jar $(CGS)

compiler.jar: $(TREE) $(PASCAL)
	jar -cf compiler.jar $(TREE) $(PASCAL)



%.c :%.pas
	p2c -LTurbo $<



.SUFFIXES: .java .class .c .o .pas .jar

.java.class:
	$(JVC)   $<


#.class.o:
#	gcj -c -o $(subst .class,.o,$< ) $<

#.jar.o:
#	gcj $(PROF) -O3 -c  -o $(subst .jar,.o,$< ) $<


.c.o :
	$(CC) $<


rtl.jar:rtl/rtl.c rtl/gc/gc.a
	jar -cf rtl.jar rtl

rtl/gc/gc.a:
	make -Crtl/gc
	cp rtl/gc/gc.a $(DISK)/mmpc
	cp rtl/gc/gc.a ilcg/Pascal


src.jar: makefile
	jar -cf src.jar  ilcg/*.java *.pas *.txt makefile ilcg/tree/*.ver *.m4 ilcg/tree/*.m4\
	 rtl/*.c ilcg/Pascal ilcg/tree/*.java ilcg/tree/*.hd\
	 macros.asm macros.s AMD64macros.s MICmacros.s PPCmacros.s system.pas cpus/fpu.m4 cpus/mmx.m4 rtl/gc\
	   cpus/fpu.m4 cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4 *.tex ilcg/Pascal/*.ver\
	   cpus/i386base.m4 cpus/ia32.m4 cpus/*.m4 ilcg/tree/*.tl cpus/*.m4\
	 viper VPTeX VPunits  org *.dvi ca JLex *.bat sab*.jar *.mf\
	 *.class *.java  vpc read* manual.pdf vp* vp

$(DISK)/$(mmpcdir)/mmpc.jar: mmpc.jar
	cp mmpc.jar $(DISK)/mmpc

$(DISK)/$(mmpcdir)/viper.jar: viper.jar
	cp viper.jar $(DISK)/mmpc
	cp vipset.bat $(DISK)/mmpc
	cp vpc.bat $(DISK)/mmpc
	cp viper.bat $(DISK)/mmpc
	cp SystemReset.class $(DISK)/mmpc

$(DISK)/$(mmpcdir)/gc.a: rtl/gc/gc.a
	cp rtl/gc/gc.a $(DISK)/mmpc



$(DISK)/$(mmpcdir)/genericset.pas: system.pas VPunits/genericset.pas
	cp system.pas $(DISK)/mmpc
	cp VPunits/genericset.pas $(DISK)/mmpc
$(DISK)/$(mmpcdir)/system.pas: system.pas VPunits/genericset.pas
	cp system.pas $(DISK)/mmpc
	cp VPunits/genericset.pas $(DISK)/mmpc
$(DISK)/$(mmpcdir)/rtlb.o: rtl/rtl.c  $(DISK)/$(mmpcdir)/gc.a
	gcc -DNOBOEHM -DDOS -g -c -o $(DISK)/$(mmpcdir)/rtl.o rtl/rtl.c
	cp $(DISK)/$(mmpcdir)/rtl.o $(DISK)/$(mmpcdir)/WIN_rtl.o
	gcc -DBOEHM -DDOS -g -c -o $(DISK)/$(mmpcdir)/rtlb.o rtl/rtl.c
	cp rtl/rtl.c $(DISK)/mmpc



tree.o: tree.jar

mmpc:
	mkdir mmpc
quickinst: mmpc.jar mmpc
	cp mmpc.jar $(mmpcdir)

 

install: install.jar

release: install.jar install.zip

install.zip:install.jar
	cp install.jar install.zip

manual.dvi: manual.tex man.tex #ilcg.tex
	latex manual
	makeindex manual
	latex manual

manual.ps: manual.dvi
	dvips -f  <manual.dvi >manual.ps

stable: $(mmpcdir) $(mmpcdir)/stablemmpc.jar
	cp $(mmpcdir)/stablemmpc.jar $(mmpcdir) 

$(reldir)/mmpc.jar: $(mmpcdir) $(mmpcdir)/mmpc.jar
	cp  $(mmpcdir)/* $(reldir) 

$(reldir)/threadlib.pas: $(mmpcdir) $(mmpcdir)/threadlib.pas
	cp  $(mmpcdir)/threadlib.pas $(reldir)/threadlib.pas

$(reldir)/clsimd.c: $(mmpcdir) $(mmpcdir)/clsimd.c
	cp  $(mmpcdir)/clsimd.c $(reldir)/clsimd.c

$(reldir)/nvidiavm.cu: $(mmpcdir) $(mmpcdir)/nvidiavm.cu
	cp  $(mmpcdir)/nvidiavm.cu $(reldir)/nvidiavm.cu

$(reldir)/kernels.h: $(mmpcdir) $(mmpcdir)/kernels.h
	cp  $(mmpcdir)/kernels.h $(reldir)/kernels.h

$(reldir)/rtl.c: rtl/rtl.c
	cp  rtl/rtl.c $(reldir)/rtl.c

testver: $(reldir)/mmpc.jar $(reldir)/threadlib.pas $(reldir)/clsimd.c $(reldir)/nvidiavm.cu $(reldir)/kernels.h $(reldir)/rtl.c mmpc.jar $(ISOLATES) $(mmpcdir)/gnuPentiumCGtaskexecute.s auxfiles
	rm -f ./PP*.vwu
	rm -f ./systemPP*.asm
	cp macros.h $(mmpcdir)
	cp macros64.h $(mmpcdir)
	cp mmpc.jar $(mmpcdir)/mmpc.jar
	cp $(mmpcdir)/* $(reldir)
	 



manual.pdf: manual.tex
	  pdflatex manual
	  makeindex manual
	  pdflatex manual

$(mmpcdir)/Makefile: makefile.ins
	cp makefile.ins ./$(mmpcdir)/Makefile

$(mmpcdir)/threadlib.pas: threadlib.pas $(mmpcdir)/gnuPentiumCGtaskexecute.s $(mmpcdir)/threadlib.c
	cp threadlib.pas mmpc

$(mmpcdir)/threadlib.c : rtl/threadlib.c
	cp rtl/threadlib.c mmpc

$(mmpcdir)/clsimd.c : rtl/clsimd.c
	cp rtl/clsimd.c $(mmpcdir)/clsimd.c

$(mmpcdir)/nvidiavm.cu : rtl/nvidiavm.cu
	cp rtl/nvidiavm.cu $(mmpcdir)/nvidiavm.cu

$(mmpcdir)/kernels.h : rtl/kernels.h
	cp rtl/kernels.h $(mmpcdir)/kernels.h

$(mmpcdir)/rtl.c : rtl/rtl.c
	cp rtl/rtl.c $(mmpcdir)/rtl.c

$(mmpcdir)/gnuPentiumCGtaskexecute.s: makefile $(mmpcdir) gnuPentiumCGtaskexecute.s gnuP4CGtaskexecute.s OpteronCGtaskexecute.s AVX32CGtaskexecute.s AVX2CGtaskexecute.s MICCGtaskexecute.s SMICCGtaskexecute.s
	cp  gnuPentiumCGtaskexecute.s mmpc
	cp gnuP4CGtaskexecute.s mmpc
	cp MICCGtaskexecute.s mmpc
	cp SMICCGtaskexecute.s mmpc
	cp OpteronCGtaskexecute.s mmpc
	cp AMD64CGtaskexecute.s mmpc
	cp AVX32CGtaskexecute.s mmpc	
	cp AVX64CGtaskexecute.s mmpc	
	cp AVX2CGtaskexecute.s mmpc	
	cp CCGtaskexecute.s mmpc
	cp gnuPentiumCGtaskexecute.s $(mmpcdir)/P4CGtaskexecute.s
	cp gnuPentiumCGtaskexecute.s $(mmpcdir)/PentiumCGtaskexecute.s

AVX32CGtaskexecute.s: gnuPentiumCGtaskexecute.s
	cp gnuPentiumCGtaskexecute.s AVX32CGtaskexecute.s

 


MICCGtaskexecute.s: OpteronCGtaskexecute.s
	cp OpteronCGtaskexecute.s MICCGtaskexecute.s


$(mmpcdir)/mmpc.jar: $(mmpcdir) mmpc.jar
	cp mmpc.jar mmpc

auxfiles: vpc-cygwin.bat vpc.bat msvpc.bat system.pas rtl/rtl.c $(mmpcdir)/threadlib.pas $(mmpcdir)/clsimd.c $(mmpcdir)/nvidiavm.cu $(mmpcdir)/kernels.h ./$(mmpcdir)/Makefile   vpc mmpc rtl.jar gpupc.bat vp.bat  rtl/gc/gc.a $(UNITS) manual.pdf
	cp $(UNITS) ./mmpc
	cp system.pas ./mmpc
	cp threadlib.pas ./mmpc
	cp mmpc.jar ./mmpc
	cp VPunits/genericset.pas ./mmpc
	chmod +x vpc
	cp vpc vpc-cygwin* msvpc.bat ./mmpc
	cp rtl/gc/gc.a .
	cp rtl/gc/gc.a ./mmpc
	cp rtl/clsimd.c ./mmpc
	cp rtl/nvidiavm.cu ./mmpc
	cp rtl/kernels.h ./mmpc
	cp rtl/rtl.c ./mmpc
	#gcc -DNOBOEHM -I rtl/gc/include -g -c -o ./$(mmpcdir)/rtl.o rtl/rtl.c
	#gcc -DBOEHM  -I rtl/gc/include -g -c -o ./$(mmpcdir)/rtlb.o rtl/rtl.c
	cp  rtl.jar ./mmpc
	cp macros.asm ./mmpc
	cp macros.h ./mmpc
	cp macros64.h ./mmpc
	cp AMD64macros.s ./mmpc
	cp AMD64macros.asm ./mmpc
	cp MICmacros.s ./mmpc
	cp macros.s ./mmpc
	cp PPCmacros.s ./mmpc
	cp vpc.bat ./mmpc
	cp mingvpc ./mmpc
	cp vp.bat ./mmpc
	cp gpupc.bat ./mmpc
	cp readme ./mmpc
	cp manual.pdf ./mmpc
	cp VPUnicode.doc ./mmpc
	cp Gcc ./mmpc
	cp vp ./mmpc
#	cp viper.jar ./mmpc
	cp *taskexecute.s ./mmpc


install.jar: prog mmpc.jar vpc-cygwin.bat vpc.bat msvpc.bat system.pas rtl/rtl.c $(mmpcdir)/threadlib.pas $(mmpcdir)/clsimd.c $(mmpcdir)/nvidiavm.cu $(mmpcdir)/kernels.h ./$(mmpcdir)/Makefile   vpc mmpc rtl.jar gpupc.bat vp.bat  rtl/gc/gc.a $(UNITS) manual.pdf auxfiles
	(cd mmpc;make clean)
	rm   -f ./$(mmpcdir)/*.vwu
	rm   -f ./$(mmpcdir)/*.mpu
	jar  -cf install.jar ./mmpc
 
nocgs:
	rm -f ilcg/tree/AVX2.java
	rm -f ilcg/tree/AVX32.java
	rm -f ilcg/tree/AVX64.java
	rm -f ilcg/tree/ARM.java
	rm -f ilcg/tree/C.java
	rm -f ilcg/tree/EE.*
	rm -f ilcg/tree/PPC.*
	rm -f ilcg/tree/Pcode.java
	rm -f ilcg/tree/IA32.*
	rm -f ilcg/tree/P3.*
	rm -f ilcg/tree/gnu486.java
	rm -f ilcg/tree/gnuP4.*
	rm -f ilcg/tree/P4.*
	rm -f ilcg/tree/Pentium.java
	rm -f ilcg/tree/CLSIMD.java
	rm -f ilcg/tree/CLSIMDwin.java
	rm -f ilcg/tree/MIC.java
	rm -f ilcg/tree/nvidia.java
	rm -f ilcg/tree/gnuPentium.java
	rm -f ilcg/tree/K6.*
	rm -f ilcg/tree/Opteron.*



clean: nocgs
#	make -Crtl/gc clean
	rm -f ca/mcgill/sable/util/*.class
	rm -f VPTeX/*.class
	rm -f ilcg/node/*.class
	rm -f viper/*.class
	rm -f ilcg/parser/*.class
	rm -f ilcg/parser/*.java
	rm -f ilcg/lexer/*.java
	rm -f -r ilcg/*.class
	rm -f ilcg/tree/*.class
	rm -f ilcg/Pascal/*.class
	rm -f org/gjt/sp/jedit/textarea/*.class
	rm -f ilcg/analysis/*.java
	rm -f ilcg/analysis/*.class
	rm -f ilcg/node/*.java
	rm -f mmpc.jar
	rm -f viper.jar
	rm -f rtl.jar
	rm -f winstall.jar
	rm -f linstall.jar
	rm -f ilcg/tree/WalkerVer.java
	rm -f ilcg/Pascal/PascalCompilerVer.java
	rm -f src.jar
	rm -f ilcg/tree/*.bak
	rm -f ilcg/Pascal/*.bak
	rm -f PP*.vwu
	rm -f ./$(mmpcdir)/systemPPC*.*
	rm -f $(mmpcdir)/*

doc: 	prog
#	javadoc  -private -d doc ilcg ilcg.tree ilcg.Pascal ilcg.analysis ilcg.node
	javadoc -J-Xmx440m  -d doc  ilcg.tree ilcg.Pascal ilcg


test: prog testIA32 testPentium testP3 testK6 testP4

buildjar:
	jar -cmf mmpc.mf  mmpc/mmpc.jar ilcg/S*.class ilcg/Pascal/*.class ilcg/R*.class  ilcg/tree/*.class VPTeX/*.class  

mmpc.jar:    $(PASCAL)  $(TREE)  $(CGS) $(ISOLATES) ilcg/Pascal/GPUPascal.class ilcg/Pascal/ExternalReferenceFinder.class  
	jar -cmf mmpc.mf  mmpc.jar ilcg/S*.class ilcg/Pascal/*.class ilcg/R*.class  ilcg/tree/*.class VPTeX/*.class  #ilcg/C/*.class 
#jar -cmf mmpc.mf  mmpc.jar ilcg/S*.class ilcg/Pascal/*.class ilcg/R*.class  ilcg/tree/*.class VPTeX/*.class  

# version including C compiler
mmpcc.jar:    $(PASCAL)  $(TREE)  $(CGS) $(ISOLATES) ilcg/Pascal/GPUPascal.class ilcg/Pascal/ExternalReferenceFinder.class ilcg/C/CCompiler.class
	jar -cmf mmpc.mf  mmpcc.jar ilcg/S*.class ilcg/Pascal/*.class ilcg/R*.class  ilcg/tree/*.class VPTeX/*.class ilcg/C/*.class 

ilcg/tree/AsmLink.class:  ilcg/tree/Pentium.java ilcg/tree/PentiumCG.java  ilcg/tree/AsmLink.java
	javac ilcg/tree/AsmLink.java


objfiles: $(OBJFILES)


 


Vptex.jar:
	jar -cf Vptex.jar VPTeX

Vptex.o: Vptex.jar
	gcj -c Vptex.jar




viper/Viper.class: viper/Viper.java
	$(JVC)   viper/*.java

ilcg/Pascal/VPC.class: ilcg/Pascal/VPC.java viper/Viper.class $(CGS)

viper.jar:  ilcg/Pascal/VPC.class viper/Viper.class\
 VPTeX/vPTeX.class  SystemReset.class ilcg/Pascal/PascalCompiler.class\
 $(TREE) $(CGS)
	jar -cmf viper.mf  viper.jar ilcg/*.class ilcg/Pascal/*.class org ilcg/tree/*.class  viper/*.class viper/resources VPTeX/*.class SystemReset.class


prog:  ilcg/tree/PentiumCG.class ilcg/Pascal/PascalCompiler.class ilcg/Pascal/rtl.o macros.asm

ilcg/tree/Condition.class: ilcg/tree/Op.class

ilcg/tree/dif.class: ilcg/tree/Op.class

ilcg/tree/MyVecSet.class: ilcg/tree/MySet.class

ilcg/tree/mod.class: ilcg/tree/Op.class

ilcg/tree/Writecounter.class: ilcg/tree/For.class

ilcg/tree/WritedependencyFinder.class: ilcg/tree/For.class

ilcg/tree/WrittenSetFinder.class:ilcg/tree/For.class

ilcg/tree/sum.class: ilcg/tree/Op.class

$(mmpcdir): 
	mkdir $(mmpcdir)

ilcg/tree/prod.class: ilcg/tree/Op.class

ilcg/tree/div.class: ilcg/tree/Op.class

ilcg/tree/Pushop.class: ilcg/tree/Push.class

ilcg/tree/Push.class: ilcg/tree/Push.java ilcg/tree/Dyad.class
	$(JVC) ilcg/tree/Push.java

ilcg/Pascal/ExternalReferenceFinder.class: ilcg/Pascal/PascalCompiler.class

#ilcg.tex: ILCG.tex
#	cp ILCG.tex ilcg.tex

#ilcg.dvi: ilcg.tex ilcggram.tex
#	latex ilcg

ilcg/tree/MyVecSet.class: ilcg/tree/MySet.class
ilcg/tree/Condition.class: ilcg/tree/Op.class
ilcg/tree/dif.class: ilcg/tree/Op.class
ilcg/tree/div.class: ilcg/tree/Op.class
ilcg/tree/mod.class: ilcg/tree/Op.class
ilcg/tree/prod.class: ilcg/tree/Op.class
ilcg/tree/sum.class: ilcg/tree/Op.class


ilcg/tree/Unit.class: ilcg/tree/Node.class ilcg/tree/Format.class ilcg/tree/Statement.class ilcg/tree/Block.class ilcg/tree/Procedure.class

ilcg/tree/Procedure.class: ilcg/tree/Statement.class ilcg/tree/Block.class   ilcg/tree/TreeExaminer.class

ilcg/tree/TreeExaminer.class: ilcg/tree/Node.class

ilcg/tree/Loader.class:  ilcg/tree/Loader.java    $(TREESRC)

ilcg/tree/Assign.class: ilcg/tree/Variable.class

tests/Delphi/test.exe: tests/test.pas
	dcc32 -CC -E"tests/Delphi" "tests/test.pas"


testDelphi: tests/Delphi/test.exe
	$(TM) tests/Delphi/test


ilcg/Pascal/rtl.o: rtl/rtl.c
	gcc -g -c -o ilcg/Pascal/rtl.o rtl/rtl.c

ilcg/parser/Parser.java: ilcggram.tex sablecc.jar sableutil.jar makefile
	$(JAVA) -jar /usr/share/java/sablecc.jar ilcggram.tex
 
ilcg2/parser/Parser.java: ilcg2.sab
	$(JAVA) -jar sablecc.jar ilcg2.sab

ilcg2/Ilcg2.class:ilcg2/Ilcg2.java ilcg2/parser/Parser.java

org/sablecc/sablecc/SableCC.class: sablecc.jar sableutil.jar
	jar -xf sablecc.jar
	jar -xf sableutil.jar

ilcgasm/parser/Parser.java: ilcgasm.tex sablecc.jar sableutil.jar
	$(JAVA) -jar sablecc.jar ilcgasm.tex

ilcgasm/Ilcgasm.class:ilcgasm/Ilcgasm.java ilcgasm/parser/Parser.java

postfix: ../simpleC/parser/Parser.class ../simpleC/Main.class

../simpleC/Main.class: ../simpleC/Main.java

ilcg/tree/Assign.class: ilcg/tree/Node.class ilcg/tree/Format.class

ilcg/tree/For.class: ilcg/tree/Goto.class  ilcg/tree/Op.class

ilcg/tree/UnguardedAssignFinder.class: ilcg/tree/For.class

ilcg/tree/LabelFinder.class: ilcg/tree/For.class


ilcg/tree/toReal.class: ilcg/tree/Op.class



ilcg/tree/Monad.class: ilcg/tree/Node.class

ilcg/tree/Variable.class:  ilcg/tree/Memref.class

ilcg/tree/ExpressionSearcher.class: ilcg/tree/For.class

ilcg/Pascal/ArrayFinder.class: ilcg/Pascal/PascalCompiler.class

ilcg/Pascal/CPUrun.class : ilcg/Pascal/Compiler.class

ilcg/Pascal/CommonScalarFinder.class: ilcg/Pascal/PascalCompiler.class

ilcg/Pascal/Dimensioned.class: ilcg/Pascal/PascalCompiler.class

ilcg/Pascal/Field.class: ilcg/Pascal/PascalCompiler.class
ilcg/Pascal/NonPureFunctionFinder.class: ilcg/Pascal/PascalCompiler.class
ilcg/Pascal/SchemaField.class: ilcg/Pascal/Field.class

ilcg/Pascal/DimensionError.class: ilcg/Pascal/Dimensioned.class

ilcg/tree/Node.class:   ilcg/tree/TreeModifier.class

ilcg/tree/Deref.class: ilcg/tree/Monad.class ilcg/tree/Node.class

../simpleC/parser/Parser.java: ../simpleC/simple.txt
	savlecc ../simpleC/simple.txt

ilcg/Ilcg.class: ilcg/Ilcg.java ilcg/parser/Parser.class ilcg/analysis/Analysis.class ilcg/IlcgTreeWalkGenerator.class ilcg/node/Switch.class ilcg/analysis/DepthFirstAdapter.class ilcg/SymbolTable.class ilcg/tree/If.class ilcg/tree/RegReservation.class ilcg/tree/Deref.class
	$(JVC) ilcg/analysis/*.java
	$(JVC) ilcg/node/*.java
	$(JVC) ilcg/parser/*.java
	$(JVC) ilcg/Ilcg.java

ilcg/pattern.class: ilcg/pattern.java  

ilcg/tree/Loader.class: ilcg/tree/LocalStoreAllocator.class ilcg/tree/Procedure.class

#ilcg/tree/LocalStoreAllocator.class: ilcg/tree/Int.class

ilcg/tree/Int.class: ilcg/tree/Loader.class  ilcg/SymbolTable.class  ilcg/tree/Real.class ilcg/tree/Num.class ilcg/tree/Node.class 
	javac   ilcg/tree/Int.java


ilcg/tree/Format.class: ilcg/tree/Format.java   ilcg/tree/Real.class ilcg/tree/Node.class 

ilcg/IlcgTreeWalkGenerator.class: ilcg/IlcgTreeWalkGenerator.java ilcg/parser/Parser.java ilcg/Ver.java \
                ilcg/tree/Format.java ilcg/tree/Node.java ilcg/RegDetails.java   ilcg/RegAlias.java\
                ilcg/Operation.java ilcg/Param.java   ilcg/tree/ExtLabel.class
	 $(JVC) ilcg/IlcgTreeWalkGenerator.java
#	java ilcg.Ver IlcgTreeWalkGenerator ilcg

ilcg/tree/ExtLabel.class:ilcg/tree/Label.class

ilcg/tree/Label.class:ilcg/tree/Int.class

ilcg/Pascal/Yylex.java:ilcg/Pascal/Yylex JLex/Main.java
	$(JVC)   JLex/Main.java
	java JLex.Main ilcg/Pascal/Yylex



ilcg/Pascal/Yylex: JLex/Main.java
	touch ilcg/Pascal/Yylex


ilcg/nl/Yylex.java:ilcg/nl/Yylex JLex/Main.java
	java JLex.Main ilcg/nl/Yylex


ilcg/nl/Cellular.class:ilcg/nl/Cellular.java ilcg/nl/Yylex.class
	$(JVC) ilcg/nl/Cellular.java

ilcg/Pascal/PascalCompiler.class:   ilcg/SymbolTable.class  ilcg/Pascal/PascalCompiler.java $(PASCALSRC) ilcg/Pascal/PascalCompilerVer.java ilcg/tree/PentiumCG.class\
                  ilcg/Pascal/ProgressNotifier.class\
ilcg/tree/Opteron.java ilcg/tree/gnuP4CG.class ilcg/tree/gnuPentiumCG.class ilcg/tree/gnuPentium.java ilcg/Pascal/MultiThreadPascal.class $(CGS)
	javac  -cp . ilcg/Pascal/PascalCompiler.java
	
ilcg/Pascal/MultiThreadPascal.class: $(CGS) ilcg/Pascal/MultiThreadPascal.java
	javac -cp . ilcg/Pascal/MultiThreadPascal.java

ilcg/Pascal/PascalCompilerVer.java: ilcg/Ver.class
	java ilcg.Ver PascalCompiler ilcg.Pascal

ilcg/tree/WalkerVer.java: ilcg/Ver.class ilcg/tree/Walker.java
	java ilcg.Ver Walker ilcg.tree

ilcg/Pascal/ArrayType.class: ilcg/Pascal/ArrayType.java ilcg/Pascal/IntegralType.class

ilcg/tree/MyRegSet.class: ilcg/tree/MyHashSet.class


ilcg/tree/MyHashSet.class: ilcg/tree/MySet.class

# build the machine descriptions all of which descend from Walker

ilcg/tree/Walker.class:  ilcg/Ver.class ilcg/tree/Walker.java ilcg/Pascal/ProgressNotifier.class  ilcg/tree/AsmLink.class ilcg/tree/MyRegSet.class ilcg/tree/Pushop.class\
              ilcg/tree/TreeExaminer.class ilcg/tree/For.class ilcg/tree/StreamGobbler.class $(TREESRC) # ilcg/tree/Loader.class
	$(JVC) ilcg/tree/Walker.java
#        java ilcg.Ver Walker ilcg.tree
# C translation
ilcg/tree/C.class: ilcg/tree/C.java ilcg/tree/Walker.java
	$(JVC) ilcg/tree/C.java

ilcg/tree/C.java: cpus/C.ilc
	$(JAVA) ilcg.Ilcg cpus/C.ilc ilcg/tree/C.java C
	
ilcg/tree/C64.java: cpus/C64.ilc
	$(JAVA) ilcg.Ilcg cpus/C64.ilc ilcg/tree/C64.java C64

ilcg/tree/CCG.class: ilcg/tree/C.class

ilcg/tree/C32CG.class: ilcg/tree/CCG.class ilcg/tree/C32CG.java

ilcg/tree/C64CG.class: ilcg/tree/C64.class ilcg/tree/C64CG.java ilcg/tree/AlignmentFixer.java

cpus/C.ilc : cpus/C.m4
	m4 <cpus/C.m4 >cpus/C.ilc
	
cpus/C64.ilc : cpus/C64.m4
	m4 <cpus/C64.m4 >cpus/C64.ilc

# basic 486 architecture
ilcg/tree/IA32CG.class: ilcg/tree/IA32.class ilcg/tree/Walker.class

ilcg/tree/IA32CG.java: ilcg/tree/IA32CG.hd ilcg/tree/I386gen.tl $(TREE)
	cat ilcg/tree/IA32CG.hd ilcg/tree/I386gen.tl >ilcg/tree/IA32CG.java


ilcg/tree/IA32.java: cpus/ia32.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/ia32.ilc ilcg/tree/IA32.java IA32

cpus/ia32.ilc: cpus/ia32.m4 cpus/i386base.m4 cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4
	m4 <cpus/ia32.m4 >cpus/ia32.ilc



tests/ia32/test.exe: tests/test.pas  mmpc.jar	ilcg/tree/IA32.class ilcg/tree/IA32CG.class vecadd.pas
	$(MMPC) tests/test -cpuIA32 -otests/ia32/test.exe -Atests/ia32/test.asm $(VERBOSE) $(OMF) $(PREFIX)


testIA32: tests/ia32/test.exe
	$(TM) tests/ia32/test.exe


ilcg/tree/IA32CG.class: ilcg/tree/Walker.class ilcg/tree/IA32CG.java


# basic 486 for gas assembler
ilcg/tree/gnu486CG.class: ilcg/tree/gnu486.class ilcg/tree/Walker.java ilcg/tree/gnu486CG.java
	$(JVC) ilcg/tree/gnu486CG.java

ilcg/tree/gnu486CG.java: ilcg/tree/gnu486CG.hd ilcg/tree/gnu486.tl
	cat ilcg/tree/gnu486CG.hd ilcg/tree/gnu486.tl >ilcg/tree/gnu486CG.java


ilcg/tree/gnu486.java: cpus/gnu486.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/gnu486.ilc ilcg/tree/gnu486.java gnu486

cpus/gnu486.ilc: cpus/gnu486.m4 cpus/i386gas.m4
	m4 <cpus/gnu486.m4 >cpus/gnu486.ilc

# basic 32 bit AVX using nasm
ilcg/tree/AVX32CG.class: ilcg/tree/AVX32.class ilcg/tree/Walker.java ilcg/tree/AVX32CG.java
	$(JVC) ilcg/tree/AVX32CG.java

ilcg/tree/AVX32CG.java: ilcg/tree/AVX32CG.hd ilcg/tree/I386gen.tl
	cat ilcg/tree/AVX32CG.hd ilcg/tree/I386gen.tl >ilcg/tree/AVX32CG.java


ilcg/tree/AVX32.java: cpus/AVX32.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/AVX32.ilc ilcg/tree/AVX32.java AVX32

cpus/AVX32.ilc: cpus/AVX32.m4 cpus/AVX32.m4 cpus/i386base.m4 cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4 cpus/AVX.m4 cpus/floattrans.m4
	m4 <cpus/AVX32.m4 >cpus/AVX32.ilc
	# basic 64 bit AMD64 using nasm
ilcg/tree/AMD64CG.class: ilcg/tree/AMD64.class ilcg/tree/Walker.java ilcg/tree/AMD64CG.java
	$(JVC) ilcg/tree/AMD64CG.java

ilcg/tree/AMD64.java: cpus/AMD64.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/AMD64.ilc ilcg/tree/AMD64.java AMD64

cpus/AMD64.ilc: cpus/AMD64.m4    cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4 cpus/i386base.m4   cpus/mmx.m4 cpus/sse2.m4 cpus/ifpums64.m4
	m4 <cpus/AMD64.m4 >cpus/AMD64.ilc
	
cpus/AMD64.m4: cpus/AMD64full.m4
	cp cpus/AMD64full.m4 cpus/AMD64.m4

 

# basic 64 bit AVX using nasm
ilcg/tree/AVX64CG.class: ilcg/tree/AVX64.class ilcg/tree/Walker.java ilcg/tree/AVX64CG.java
	$(JVC) ilcg/tree/AVX64CG.java

ilcg/tree/AVX64.java: cpus/AVX64.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/AVX64.ilc ilcg/tree/AVX64.java AVX64

cpus/AVX64.ilc: cpus/AVX64.m4    cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4 cpus/i386base.m4 cpus/AVX.m4 cpus/mmx.m4
	m4 <cpus/AVX64.m4 >cpus/AVX64.ilc
# basic 32 bit AVX2 using nasm syntax
ilcg/tree/AVX2CG.class: ilcg/tree/AVX2.class ilcg/tree/Walker.java ilcg/tree/AVX2CG.java
	$(JVC) ilcg/tree/AVX2CG.java

ilcg/tree/AVX2.java: cpus/AVX2.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/AVX2.ilc ilcg/tree/AVX2.java AVX2

cpus/AVX2.ilc: cpus/AVX2.m4  cpus/fgathertrans.m4  cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4 cpus/i386base.m4 cpus/AVX.m4 cpus/mmx.m4
	m4 <cpus/AVX2.m4 >cpus/AVX2.ilc 
 
# Xeon Phi
ilcg/tree/MICCG.class: ilcg/tree/MIC.class ilcg/tree/Walker.java ilcg/tree/MICCG.java ilcg/tree/MICPeep.java
	$(JVC) ilcg/tree/MICCG.java

ilcg/tree/MIC.java: cpus/MIC.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/MIC.ilc ilcg/tree/MIC.java MIC

cpus/MIC.ilc: cpus/MIC.m4    cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4 cpus/i386base.m4
	m4 <cpus/MIC.m4 >cpus/MIC.ilc
# Pentium for gas assembler
ilcg/tree/gnuPentiumCG.class: ilcg/tree/gnuPentiumCG.java ilcg/tree/gnuPentium.class
	$(JVC) ilcg/tree/gnuPentiumCG.java

ilcg/tree/gnuPentiumCG.java: ilcg/tree/gnuPentiumCG.hd ilcg/tree/gnu486.tl ilcg/tree/gnuPentium.java
	cat ilcg/tree/gnuPentiumCG.hd ilcg/tree/gnu486.tl >ilcg/tree/gnuPentiumCG.java


ilcg/tree/gnuPentium.java: cpus/gnuPentium.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/gnuPentium.ilc ilcg/tree/gnuPentium.java gnuPentium

cpus/gnuPentium.ilc: cpus/gnuPentium.m4 cpus/i386gas.m4 cpus/gnummx.m4
	m4 <cpus/gnuPentium.m4 >cpus/gnuPentium.ilc






# P4 for gas assembler
ilcg/tree/gnuP4CG.class: ilcg/tree/gnuP4CG.java ilcg/tree/gnuIntelPeep.class

ilcg/tree/gnuP4CG.java: ilcg/tree/gnuP4CG.hd ilcg/tree/gnu486.tl ilcg/tree/gnuP4.java
	cat ilcg/tree/gnuP4CG.hd ilcg/tree/gnu486.tl >ilcg/tree/gnuP4CG.java


ilcg/tree/gnuP4.java: cpus/gnuP4.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/gnuP4.ilc ilcg/tree/gnuP4.java gnuP4

cpus/gnuP4.ilc: cpus/gnuP4.m4 cpus/i386gas.m4 cpus/gnusse2.m4
	m4 <cpus/gnuP4.m4 >cpus/gnuP4.ilc


# open cl simd machine
ilcg/tree/CLSIMDCG.class: ilcg/tree/CLSIMDCG.java ilcg/tree/gnuIntelPeep.class
 

ilcg/tree/CLSIMD.java: cpus/CLSIMD.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/CLSIMD.ilc ilcg/tree/CLSIMD.java CLSIMD

cpus/CLSIMD.ilc: cpus/CLSIMD.m4 cpus/i386gas.m4 cpus/gnusse2.m4
	m4 <cpus/CLSIMD.m4 >cpus/CLSIMD.ilc

# open cl simd machine windows version
ilcg/tree/CLSIMDwinCG.class: ilcg/tree/CLSIMDwinCG.java ilcg/tree/gnuIntelPeep.class


ilcg/tree/CLSIMDwin.java: cpus/CLSIMDwin.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/CLSIMDwin.ilc ilcg/tree/CLSIMDwin.java CLSIMDwin

cpus/CLSIMDwin.ilc: cpus/CLSIMDwin.m4 cpus/i386gas.m4 cpus/gnusse2.m4
	m4 <cpus/CLSIMDwin.m4 >cpus/CLSIMDwin.ilc


# AMD k6 architecture

ilcg/tree/K6CG.class: ilcg/tree/K6.class ilcg/tree/K6CG.java

ilcg/tree/K6CG.java: ilcg/tree/K6CG.hd ilcg/tree/I386gen.tl
	cat ilcg/tree/K6CG.hd ilcg/tree/I386gen.tl >ilcg/tree/K6CG.java

ilcg/tree/K6.java: cpus/K6.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/K6.ilc ilcg/tree/K6.java K6

cpus/K6.ilc: cpus/K6.m4 cpus/i386base.m4 cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4 cpus/mmx.m4
	m4 <cpus/K6.m4 >cpus/K6.ilc


tests/K6/test:   prog tests/test.pas  	ilcg/tree/K6.class ilcg/tree/K6CG.class
	 $(MMPC) tests/test $(OMF)  -cpuK6 -otests/K6/test -Atests/K6/test.asm $(VERBOSE)  $(PREFIX)

testK6: tests/K6/test
	$(TM) tests/K6/test




# AMD opteron architecture

#ilcg/tree/AMD64CG.class: ilcg/tree/Opteron.class ilcg/tree/OpteronCG.class ilcg/tree/AMD64CG.java

ilcg/tree/OpteronCG.class: ilcg/tree/Opteron.class ilcg/tree/OpteronCG.java


ilcg/tree/Opteron.java: cpus/opteron.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/opteron.ilc ilcg/tree/Opteron.java Opteron

cpus/opteron.ilc: cpus/opteron.m4 cpus/sse2-opteron.m4 cpus/ifpu-gas.m4 cpus/amd64.m4 cpus/gnummx.m4 cpus/gnusse2.m4 cpus/amd64base.m4
	m4 <cpus/opteron.m4 >cpus/opteron.ilc

# Pentium with MMX

PentiumCG.vwu:  ilcg/tree/Pentium.class tests/trainer.pas tests/seive.pas

#  Note the order in which these is run is crucial trainer must come first
	$(JAVA) ilcg.Pascal.PascalCompiler tests/trainer -T -S -opt3 $(VERBOSE)
	$(JAVA) ilcg.Pascal.PascalCompiler tests/seive  -S -opt3

cpus/pentium.ilc: cpus/pentium.m4 cpus/i386base.m4 cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4 cpus/mmx.m4
	m4 <cpus/pentium.m4 >cpus/pentium.ilc

ilcg/tree/Pentium.java: cpus/pentium.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/pentium.ilc ilcg/tree/Pentium.java Pentium

ilcg/tree/PentiumCG.class: ilcg/tree/Walker.class ilcg/tree/Pentium.java ilcg/tree/PentiumCG.java
	$(JVC) ilcg/tree/PentiumCG.java

testPentium: tests/Pentium/test
	$(TM) tests/Pentium/test

ilcg/tree/PentiumCG.java: ilcg/tree/PentiumCG.hd ilcg/tree/I386gen.tl
	cat ilcg/tree/PentiumCG.hd ilcg/tree/I386gen.tl >ilcg/tree/PentiumCG.java


tests/Pentium/test:   prog tests/test.pas  mmpc.jar	ilcg/tree/Pentium.class ilcg/tree/PentiumCG.class
#	touch vectests.pas
	$(MMPC) tests/test $(OMF)  -cpuPentium -otests/Pentium/test -Atests/Pentium/test.asm $(VERBOSE)  $(PREFIX)

# intel P3 architecture


# train the code generator cache on the standard training program
P3CG.vwu:   ilcg/tree/P3.class tests/trainer.pas tests/seive.pas
#  Note the order in which these is run is crucial trainer must come first
	$(JAVA) ilcg.Pascal.PascalCompiler tests/trainer  -S -cpuP3
	$(JAVA) ilcg.Pascal.PascalCompiler tests/seive  -S  -cpuP3



ilcg/tree/P3CG.java: ilcg/tree/P3CG.hd ilcg/tree/I386gen.tl ilcg/tree/P3.java
	cat ilcg/tree/P3CG.hd ilcg/tree/I386gen.tl >ilcg/tree/P3CG.java



ilcg/tree/P3.java: cpus/P3.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class  
	$(JAVA) ilcg.Ilcg cpus/P3.ilc ilcg/tree/P3.java P3

cpus/P3.ilc: cpus/P3.m4 cpus/i386base.m4 cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4 cpus/mmx.m4 cpus/sse.m4
	m4 <cpus/P3.m4 >cpus/P3.ilc


tests/P3/test:prog ilcg/tree/P3CG.class tests/test.pas ilcg/tree/P3.class mmpc.jar
	 $(MMPC) tests/test $(OMF)  -cpuP3 -otests/P3/test -Atests/P3/test.asm  $(PREFIX) $(VERBOSE)

testP3: tests/P3/test
	$(TM) tests/P3/test

testP3asm: tests/P3/test.asm   ilcg/tree/P3.class
	nasm -felf -g -o tests/P3/test.o tests/P3/test.asm


# Sony PS2

ilcg/tree/EECG.class: ilcg/tree/EE.class ilcg/tree/EECG.java ilcg/tree/Walker.class
	$(JVC) ilcg/tree/EECG.java
ilcg/tree/EE.java: cpus/EE.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/EE.ilc ilcg/tree/EE.java EE
cpus/EE.ilc: cpus/EE.m4
	m4 <cpus/EE.m4 >cpus/EE.ilc
# pcode
ilcg/tree/PcodeCG.class: ilcg/tree/Pcode.class ilcg/tree/PcodeCG.java ilcg/tree/Walker.class $(TREE)
	$(JVC) ilcg/tree/PcodeCG.java

ilcg/tree/Pcode.java: cpus/Pcode.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/Pcode.ilc ilcg/tree/Pcode.java Pcode
cpus/Pcode.ilc: cpus/pcode.m4
	m4 <cpus/pcode.m4 >cpus/Pcode.ilc

# NIOS

ilcg/tree/NIOSCG.class: ilcg/tree/NIOS.class ilcg/tree/NIOSCG.java ilcg/tree/Walker.class $(TREE)
	$(JVC) ilcg/tree/NIOSCG.java
ilcg/tree/NIOS.java: cpus/NIOS.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/NIOS.ilc ilcg/tree/NIOS.java NIOS
cpus/NIOS.ilc: cpus/nios.m4
	m4 <cpus/nios.m4 >cpus/NIOS.ilc
# ARM

ilcg/tree/ARMCG.class: ilcg/tree/ARM.class ilcg/tree/ARMCG.java ilcg/tree/Walker.class $(TREE)
	$(JVC) ilcg/tree/ARMCG.java
ilcg/tree/ARM.java: cpus/ARM.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/ARM.ilc ilcg/tree/ARM.java ARM
cpus/ARM.ilc: cpus/ARM.m4
	m4 <cpus/ARM.m4 >cpus/ARM.ilc

# Power PC architecture

ilcg/tree/CELLCG.class: ilcg/tree/PPC.class ilcg/tree/CELLCG.java ilcg/tree/Walker.class $(TREE)
	$(JVC) ilcg/tree/CELLCG.java

ilcg/tree/PPCCG.class: ilcg/tree/PPC.class ilcg/tree/PPCCG.java ilcg/tree/Walker.class $(TREE)
	$(JVC) ilcg/tree/PPCCG.java

ilcg/tree/PPC.java: cpus/PPC.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class  
	$(JAVA) ilcg.Ilcg cpus/PPC.ilc ilcg/tree/PPC.java PPC


TTT.txt :
	ls >TTT.txt

cpus/PPC.ilc: cpus/PowerPC.m4 cpus/PPCfp.m4  cpus/PPCint.m4 cpus/PPCNew.m4 cpus/PPCVecfp.m4 cpus/PPCVecInt.m4 PPCmacros.s CBFM.awk TTT.txt
	m4 <cpus/PowerPC.m4 >cpus/PPC.ilc
	$(INSLIST)


# intel P4 architecture




ilcg/tree/P4CG.java: ilcg/tree/P4CG.hd ilcg/tree/I386gen.tl
	cat ilcg/tree/P4CG.hd ilcg/tree/I386gen.tl >ilcg/tree/P4CG.java

ilcg/tree/SSE2CG.java: ilcg/tree/SSE2CG.hd ilcg/tree/I386gen.tl
	cat ilcg/tree/SSE2CG.hd ilcg/tree/I386gen.tl >ilcg/tree/SSE2CG.java

ilcg/tree/P4.java: cpus/P4.ilc  ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/P4.ilc ilcg/tree/P4.java P4

cpus/P4.ilc: cpus/P4.m4 cpus/i386base.m4 cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4 cpus/mmx.m4 cpus/sse2.m4  cpus/floattrans.m4
	m4 <cpus/P4.m4 >cpus/P4.ilc


tests/P4/test:prog  tests/test.pas ilcg/tree/P4.class mmpc.jar ilcg/tree/P4CG.class
	 $(MMPC) tests/test $(OMF)  -cpuP4 -otests/P4/test -Atests/P4/test.asm  $(PREFIX) $(VERBOSE)

testP4: tests/P4/test
	$(TM) tests/P4/test

testP4asm: tests/P4/test.asm   ilcg/tree/P4.class
	nasm -felf -g -o tests/P4/test.o tests/P4/test.asm


# intel + Nvidia GPU - kepler model

ilcg/tree/nvidiaCG.class: ilcg/tree/nvidia.class ilcg/tree/Walker.java ilcg/tree/nvidiaCG.java
	$(JVC) ilcg/tree/nvidiaCG.java

ilcg/tree/nvidia.java: cpus/nvidia.ilc ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/nvidia.ilc ilcg/tree/nvidia.java nvidia

cpus/nvidia.ilc: cpus/nvidia.m4 cpus/i386base.m4 cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4
	m4 <cpus/nvidia.m4>cpus/nvidia.ilc

# AMD64  + Nvidia GPU 

ilcg/tree/nvidia64CG.class: ilcg/tree/nvidia64.class ilcg/tree/Walker.java ilcg/tree/nvidia64CG.java
	$(JVC) ilcg/tree/nvidia64CG.java

ilcg/tree/nvidia64.java: cpus/nvidia64.ilc ilcg/Ilcg.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.Ilcg cpus/nvidia64.ilc ilcg/tree/nvidia64.java nvidia64

cpus/nvidia64.ilc: cpus/nvidia64.m4 cpus/i386base.m4 cpus/ifpu.m4 cpus/ifpums64.m4 cpus/ifpums32.m4
	m4 <cpus/nvidia64.m4>cpus/nvidia64.ilc

# benchmarks



konv.exe: Konv.pas prog ilcg/tree/PentiumCG.class
	time java ilcg.Pascal.PascalCompiler Konv $(OMF) -okonv $(PREFIX) $(VERBOSE)

dconv.exe: dconv.pas prog
	java ilcg.Pascal.PascalCompiler dconv $(OMF) -odconv $(PREFIX) -CPU P3

konvtest: konv.exe
	konv

konv32test: konv32.exe
	konv32

konv32.exe: Konv.pas prog ilcg/tree/IA32CG.class
	time java ilcg.Pascal.PascalCompiler Konv $(OMF) -okonv32 $(PREFIX) $(VERBOSE) -cpuIA32

dhry.exe: dhry.pas ilcg/Pascal/PascalCompiler.class ilcg/tree/Pentium.class system.pas macros.asm
	java ilcg.Pascal.PascalCompiler dhry $(OMF) -odhry $(PREFIX) $(VERBOSE)
	dhry

seraddC: tests/C/seradd.exe
	$(TM) tests/C/seradd.exe

vecaddC: tests/C/vecadd.exe
	$(TM) tests/C/vecadd.exe

benchtime: bench
	bench > benchtime

bench: bench.pas testver
	vpc bench -cpuTest

tests/C/vecadd.exe: tests/C/vecadd.cpp
	iccvars
	icl /S /I "/program files/intel/compiler4.0/include" tests/C/vecadd.cpp
	icl /I "/program files/intel/compiler4.0/include" tests/C/vecadd.cpp

tests/C/seradd.exe: tests/C/seradd.c
	iccvars
	icl  tests/C/seradd.c

vecaddia32: tests/Ia32/vecadd.exe
	$(TM) tests/Ia32/vecadd.exe

tests/Ia32/vecadd.exe:   prog tests/vecadd.pas  	ilcg/tree/IA32.class ilcg/tree/Ia32CG.class
	$(MMPC) tests/vecadd -cpuIA32  -otests/Ia32/vecadd.exe -Atests/Ia32/vecadd.asm $(VERBOSE)


vecaddpent: tests/Pentium/vecadd.exe
	$(TM) tests/pentium/vecadd.exe

tests/Pentium/vecadd.exe:   prog tests/vecadd.pas  	ilcg/tree/Pentium.class ilcg/tree/PentiumCG.class
	$(JAVA) ilcg.Pascal.PascalCompiler tests/vecadd -cpuPentium -otests/Pentium/vecadd.exe -Atests/Pentium/vecadd.asm $(PREFIX) $(VERBOSE)

vecaddasm: tests/asm/vecadd.exe
	$(TM) tests/asm/vecadd.exe



tests/asm/vecadd.exe: tests/asm/vecadd.o
	gcc -o tests/asm/vecadd.exe  tests/asm/vecadd.o

tests/asm/vecadd.o: tests/asm/vecadd.asm
	nasmw -f coff -o tests/asm/vecadd.o tests/asm/vecadd.asm

rtl/ncurses/testn: rtl/ncurses/testn.pas  ncurses.pas prog
		 $(JAVA) ilcg.Pascal.PascalCompiler rtl/ncurses/testn $(OMF)   -ortl/ncurses/testn  $(PREFIX) $(VERBOSE)

testn:	rtl/ncurses/testn
	rtl/ncurses/testn

pascalgenerators:   psrc/i486.pas psrc/amd64.pas  psrc/C.pas
	jar -cf pascalgenerators.zip psrc/C.pas psrc/i486.pas psrc/amd64.pas psrc/ilcp.pas psrc/R*pas  
	
	
ilcg/tree/K6v2CG.class: ilcg/tree/K6v2.class ilcg/tree/Walker2.class

ilcg/tree/Walker2.class: ilcg/tree/Pattern.java ilcg/tree/Walker2.java

psrc/i486.pas: ilcg/Ilcp.class cpus/ia32.ilc
	java ilcg.Ilcp cpus/ia32.ilc I486 psrc
	cd psrc;	m4  I486.pas >  i486.pas;	cd ..
	rm psrc/I486*.pas
	
psrc/C.pas: ilcg/Ilcp.class cpus/C.ilc
	java ilcg.Ilcp cpus/C.ilc c psrc
	cd psrc;	m4  c.pas >  C.pas;	cd ..
	rm psrc/c*.pas

psrc/amd64.pas: ilcg/Ilcp.class cpus/AMD64small.m4 cpus/sse2small.m4 cpus/mmxsmall.m4
	m4 cpus/AMD64small.m4 > cpus/AMD64small.ilc
	$(JAVA) ilcg.Ilcg cpus/AMD64small.ilc ilcg/tree/AMD64small.java AMD64small
	java ilcg.Ilcp cpus/AMD64small.ilc AMD64 psrc
	cd psrc;	m4  AMD64.pas >  amd64.pas;cd ..
	rm psrc/AMD64*.pas

psrc/p4.pas: ilcg/Ilcp.class cpus/P4.ilc
	java ilcg.Ilcp cpus/P4.ilc P4 psrc
	cd psrc;	m4  P4.pas >  p4.pas;	cd ..
	rm psrc/P4*.pas

# matlab
matlab/y.tab.c: matlab/matlab.y
	yacc  matlab/matlab.y

matlab/y.tab.h: matlab/matlab.y
	yacc -d matlab/matlab.y

matlab/lex.yy.c: matlab/matlab.l matlab/y.tab.h
	flex matlab/matlab.l

MATLAB: matlab/lex.yy.c matlab/i486.o

matlab/i486.o: matlab/i486.c matlab/i486.h matlab/rollback.h \
               matlab/ilcp.h
	gcc matlab/i486.c

matlab/%.c:psrc/%.c
	cp $<  matlab

matlab/%.h:%.h
	mv $< matlab



%.h: psrc/%.pas
	p2c -LTurbo $< $*
	
CTest: ilcg/C/CCompiler.class ilcg/C/test.c mmpcc.jar
	java ilcg.C.CCompiler  ilcg/C/test.c 

	 
	
runCTest: CTest
	./a.out
	
Cshow: ilcg/C/CCompiler.class ilcg/C/test.c
	java org.antlr.v4.runtime.misc.TestRig ilcg.C.C compilationUnit -gui <ilcg/C/test.c
	
C: ilcg/C/CCompiler.class

ilcg/C/CCompiler.class:  ilcg/C/CParser.class ilcg/C/CCompiler.java
	javac ilcg/C/CCompiler.java

ilcg/C/CParser.class: ilcg/C/C.g4
	java -Xmx500M -cp "/usr/local/lib/antlr-4.5.3-complete.jar:$CLASSPATH" org.antlr.v4.Tool -package ilcg.C    ilcg/C/C.g4
	javac ilcg/C/CParser.java
	
Pretty:
	astyle --style=gnu -xe "ilcg/*java"
	astyle --style=gnu -xe "ilcg/tree/*java"
	
# stuff that uses ilcg2	

tinybasic.zip: tinybasic.jar
	cp tinybasic.jar tinybasic.zip

tinyb.sab: tinyb.m4
	m4 tinyb.m4 >tinyb.sab


tinyb/tinybasic.class: ilcg2/tinyb.ilc cpus/ARM.ilc tinyb.sab ilcg2.jar tinyb/Translator.java ilcg/tree/ARMCG.java
	java   -jar ilcg2.jar  ilcg2/tinyb.ilc
	javac tinyb/tinybasic.java

fast/Faster.java: fast.sab fast/fast.ilc ilcg2.jar ilcg/tree/P4CG.java
	java -jar ilcg2.jar -cp sablecc.jar fast/fast.ilc

fast/Faster.class: fast/Translator.java fast/Faster.java
	javac fast/Faster.java

testtinyb: tinyb/tinybasic.class tinyb/rtl.c
	java tinyb.tinybasic tinyb/sum.bas  
	gcc -m32 tinyb/sum.bas.o tinyb/rtl.c
	./a.out

tinybasic.jar: tinyb/Translator.java tinyb.sab tinyb/rtl.c nocgs ilcg/tree/Pentium.java ilcg/tree/gnuPentium.java
	jar -cf tinybasic.jar tinyb/Translator.java tinyb/rtl.c ilcg2/tinyb.ilc ilcg/Pascal/*.java cpus/IA32.ilc ilcg/tree/*.java ilcg/*.java tinyb.sab ilcg/tree/*.html

ilcg2.jar: ilcg2/Ilcg2.class ilcg/Ilcg.class   ilcg2/ilcg2.mf makefile
		jar -cmf  ilcg2/ilcg2.mf ilcg2.jar ilcg/*.class ilcg2    ilcg/analysis/*.class ilcg/lexer/* ilcg/parser/* ilcg/node/*.class ca ilcg/tree/*.class ilcg/Pascal/ProgressNotifier.class


testb: basic1.bas tinyb/Translator.java tinyb/tinybasic.class  
	cp basic1.bas basic1
	java tinyb.tinybasic basic1 
	gcc  -obasic1 -g  basic1.o tinyb/rtl.c
	 basic1
tinyb/Translator.class: tinyb/Translator.java 

	

