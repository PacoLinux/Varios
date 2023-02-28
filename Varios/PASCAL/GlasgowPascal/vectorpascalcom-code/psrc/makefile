PASCOM=fpc
 
#PC=dcc32 
EXE=
#EXE=.exe
TPLDIR=tply41
all:    sc
clean:
	rm *.dcu *.o *.ppu *.aux *.fpw *.FPW *.tpu

ilcg$(EXE): ilcp.pas ilcg.pas #ilcggram.pas ilcglex.pas 
	$(PC) ilcg.pas

ilcggram.pas: ilcggram.y
	$(TPLDIR)/pyacc ilcggram

ilcglex.pas: ilcglex.l
	$(TPLDIR)/plex ilcglex

vplex.pas: vplex.l
	$(TPLDIR)/plex vplex

pas.pas: pas.y
	$(TPLDIR)/pyacc pas


vps.pas: vps.y
#	pyacc -d -v  vps
	$(TPLDIR)/pyacc  -v  vps

testi: ilcg$(EXE) inter.ilc
	ilcg inter.ilc

inter.ilc: demo.pas
	vpc demo -inter -S

pcc.pas: pcc.dpr
	cp pcc.dpr pcc.pas

pcc$(EXE): pcc.pas  vplex.pas vpparse.pas vps.pas lists.pas dlbvp.pas ilcg.pas rollback.pas ilcp.pas
	$(PC) pcc.pas


test: pcc$(EXE) hello.pas
	pcc hello.pas



sc : sc.pas   sasyn.pas    bufdecls.pas   errors.pas dlb.pas sagen64.pas  env.pas nodestack.pas ilcp.pas ilcgtypes.pas
	$(PASCOM)  sc    

