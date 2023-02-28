#CLASSPATH=/usr/java/lib/classes.zip
DC=c:\classes
VERBOSE=-V
OUT=.
CC=gcc -c 
TM=
#JVC=javac -d $(OUT)
JVC=javac
#JVC=gcj
#JVC=jikes  
#JAVA=java  -classpath $(CLASSPATH)
JAVA=java
TREE=ilcg/tree/Node.class  ilcg/tree/Assign.class ilcg/tree/Block.class ilcg/tree/Cartesian.class ilcg/tree/Label.class ilcg/tree/Cast.class ilcg/tree/CommonSubExpressionFinder.class ilcg/tree/Deref.class ilcg/tree/Dyad.class ilcg/tree/ExpressionSubstituter.class ilcg/tree/For.class ilcg/tree/Format.class ilcg/tree/If.class ilcg/tree/Int.class ilcg/tree/LocalStoreAllocator.class ilcg/tree/Mem.class ilcg/tree/Memref.class ilcg/tree/Monad.class ilcg/tree/Node.class ilcg/tree/Num.class ilcg/tree/Op.class ilcg/tree/Procedure.class ilcg/tree/Push.class ilcg/tree/Real.class ilcg/tree/Ref.class ilcg/tree/Register.class ilcg/tree/RegReservation.class ilcg/tree/RollBackBuffer.class ilcg/tree/Statement.class ilcg/tree/Variable.class 

.SUFFIXES: .java .class

.java.class:
	$(JVC)   $<

.c.o :
	$(CC) $<

all:   	prog   test 



clean:
	rm ilcg/analysis/*.java
	rm ilcg/node/*.java
	rm ilcg/node/*.class
	rm ilcg/parser/*.java
	rm ilcg/lexer/*.java
	rm -r ilcg/*.class
	rm ilcg/tree/*.class
	rm ilcg/Pascal/*.class

doc: 	prog ilcg.dvi
	javadoc -d doc ilcg ilcg.tree ilcg.Pascal ilcg.node ilcg.analysis	

test: prog testK6 testIA32 testPentium  



prog:  ilcg/Pascal/PascalCompiler.class ilcg/Pascal/rtl.o



ilcg.dvi: ilcg.tex ilcggram.tex
	latex ilcg

ilcg/tree/Loader.class:  ilcg/tree/Loader.java  ilcg/tree/AssignmentException.class $(TREE)


tests/ia32/test.asm:   prog tests/test.pas  	ilcg/tree/IA32.class ilcg/tree/IA32CG.class
	 $(JAVA) ilcg.Pascal.PascalCompiler tests/test -cpuIA32 -S -otests/ia32/test.exe -Atests/ia32/test.asm $(VERBOSE) 

 

tests/Pentium/test:   prog tests/test.pas  	ilcg/tree/Pentium.class ilcg/tree/PentiumCG.class
	 $(JAVA) ilcg.Pascal.PascalCompiler tests/test  -cpuPentium -otests/Pentium/test -Atests/Pentium/test.asm $(VERBOSE)



tests/K6/test:   prog tests/test.pas  	ilcg/tree/K6.class ilcg/tree/K6CG.class
	 $(JAVA) ilcg.Pascal.PascalCompiler tests/test  -cpuK6 -otests/K6/test -Atests/K6/test.asm $(VERBOSE)



tests/Delphi/test.exe: tests/test.pas
	dcc32 -CC -E"tests/Delphi" "tests/test.pas"

tests/ia32/test.o: tests/ia32/test.asm 
	nasm -felf -g -o tests/ia32/test.o tests/ia32/test.asm

tests/ia32/test: tests/ia32/test.o
	gcc -g -o tests/ia32/test tests/ia32/test.o ilcg/Pascal/rtl.o

testIA32: tests/ia32/test
	$(TM) tests/ia32/test
 
testDelphi: tests/Delphi/test.exe
	$(TM) tests/Delphi/test

testPentium: tests/Pentium/test
	$(TM) tests/Pentium/test

testK6: tests/K6/test
	$(TM) tests/K6/test
	 
ilcg/tree/IA32CG.class: ilcg/tree/IA32.class  

ilcg/tree/PentiumCG.class: ilcg/tree/Pentium.class

ilcg/tree/K6CG.class: ilcg/tree/K6.class


ilcg/Pascal/rtl.o: ilcg/Pascal/rtl.c
	gcc -g -c -o ilcg/Pascal/rtl.o ilcg/Pascal/rtl.c

ilcg/parser/Parser.java: ilcggram.tex
	$(JAVA) -jar sablecc.jar ilcggram.tex

postfix: ../simpleC/parser/Parser.class ../simpleC/Main.class 

../simpleC/Main.class: ../simpleC/Main.java

ilcg/tree/Assign.class: ilcg/tree/Node.class ilcg/tree/Format.class

ilcg/tree/For.class: ilcg/tree/Goto.class

ilcg/tree/Monad.class: ilcg/tree/Node.class

ilcg/tree/Node.class: ilcg/tree/TreeExaminer.class ilcg/tree/TreeModifier.class

ilcg/tree/Deref.class: ilcg/tree/Monad.class ilcg/tree/Node.class

../simpleC/parser/Parser.java: ../simpleC/simple.txt
	savlecc ../simpleC/simple.txt

ilcg/ILCG.class: ilcg/ILCG.java ilcg/parser/Parser.class ilcg/analysis/Analysis.class ilcg/IlcgTreeWalkGenerator.class
	$(JVC) ilcg/ILCG.java


ilcg/IlcgTreeWalkGenerator.class: ilcg/IlcgTreeWalkGenerator.java ilcg/parser/Parser.class
	 $(JVC) ilcg/IlcgTreeWalkGenerator.java

ilcg/Pascal/Yylex.java:ilcg/Pascal/Yylex
	java JLex.Main ilcg/Pascal/Yylex
	cp ilcg/Pascal/yylex.java ilcg/Pascal/Yylex.java


ilcg/Pascal/PascalCompiler.class:   ilcg/SymbolTable.class \
			ilcg/Pascal/PascalCompiler.java\
                        ilcg/tree/Walker.class\
			ilcg/tree/CharLit.class\
			ilcg/Pascal/Yylex.class \
			ilcg/Pascal/Compiler.class	
	$(JVC)  ilcg/Pascal/PascalCompiler.java



ilcg/tree/Walker.class: $(TREE) ilcg/tree/Loader.class

ilcg/tree/IA32.java: cpus/ia32.ilc  ilcg/ILCG.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.ILCG cpus/ia32.ilc ilcg/tree/IA32.java IA32

ilcg/tree/Pentium.java: cpus/pentium.ilc  ilcg/ILCG.class  ilcg/IlcgTreeWalkGenerator.class  
	$(JAVA) ilcg.ILCG cpus/pentium.ilc ilcg/tree/Pentium.java Pentium

ilcg/tree/K6.java: cpus/K6.ilc  ilcg/ILCG.class  ilcg/IlcgTreeWalkGenerator.class
	$(JAVA) ilcg.ILCG cpus/K6.ilc ilcg/tree/K6.java K6

cpus/ia32.ilc: cpus/ia32.m4 cpus/i386base.m4 cpus/ifpu.m4
	m4 <cpus/ia32.m4 >cpus/ia32.ilc


cpus/K6.ilc: cpus/K6.m4 cpus/i386base.m4 cpus/ifpu.m4 cpus/mmx.m4
	m4 <cpus/K6.m4 >cpus/K6.ilc

cpus/pentium.ilc: cpus/pentium.m4 cpus/i386base.m4 cpus/ifpu.m4 cpus/mmx.m4
	m4 <cpus/pentium.m4 >cpus/pentium.ilc



# benchmarks

benchmarks: vecaddC  vecaddpent vecaddia32 vecaddasm seraddC 

seraddC: tests/C/seradd.exe
	$(TM) tests/C/seradd.exe

vecaddC: tests/C/vecadd.exe
	$(TM) tests/C/vecadd.exe

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
	$(JAVA) ilcg.Pascal.PascalCompiler tests/vecadd -cpuIA32  -otests/Ia32/vecadd.exe -Atests/Ia32/vecadd.asm $(VERBOSE) 


vecaddpent: tests/Pentium/vecadd.exe
	$(TM) tests/pentium/vecadd.exe

tests/Pentium/vecadd.exe:   prog tests/vecadd.pas  	ilcg/tree/Pentium.class ilcg/tree/PentiumCG.class
	$(JAVA) ilcg.Pascal.PascalCompiler tests/vecadd -cpuPentium -otests/Pentium/vecadd.exe -Atests/Pentium/vecadd.asm $(VERBOSE)

vecaddasm: tests/asm/vecadd.exe
	$(TM) tests/asm/vecadd.exe



tests/asm/vecadd.exe: tests/asm/vecadd.o
	gcc -o tests/asm/vecadd.exe  tests/asm/vecadd.o

tests/asm/vecadd.o: tests/asm/vecadd.asm
	nasmw -f coff -o tests/asm/vecadd.o tests/asm/vecadd.asm
