all: nVPV4     test
CORES=4
CPU=AVX32




V12$(CPU)c$(CORES): V12.pas
	../../mmpc/vpc V12  -cpu$(CPU) -opt3	 -oV12$(CPU)c$(CORES) -cores$(CORES)

nbody: nbody.cpp
	g++ -O3 nbody.cpp -o nbody
nVPV4.tex: nVPV4

test:   V12$(CPU)c$(CORES)
	./V12$(CPU)c$(CORES)

nVPV4.pdf: nVPV4.dvi
	dvipdfm nVPV4

nVPV4.dvi: nVPV4.tex
	latex nVPV4.tex

