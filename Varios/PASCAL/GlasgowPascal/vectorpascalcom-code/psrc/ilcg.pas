program ilcg(input,output);
{ apptype console}
{$LONGSTRINGS OFF}
{interface}
  uses Rollback,lexlib,ilcp,yacclib,p3;    {  }

type cheat=record
           case boolean of
           true : (p:pilcgnode);
           false: (i:integer);
           end;
 function intelentry(p:pilcgnode;var b:rollbackbuffer):boolean;
	var pref:string;
        begin
	     appendstr(b,'section .text\n');
	     pref:='';
	     if p^.imported then
	     BEGIN pref:=procprefix;
		   appendstr(b,'extern '+pref+p^.startlab^.opname+'\n');
	     END;
	     if p^.exported then
	     begin
		   appendstr(b,'export '+procprefix+p^.extname^.opname+'\n');
		   appendstr(b,procprefix+p^.extname^.opname+':\n');
	     end;

	     appendstr(b,'\n');
	     if p^.startlab^.tag= extlabel
	     then appendstr(b,pref+p^.startlab^.opname+':');
             appendstr(b,'enter 0,0\n');
	     intelentry:=true;
        end;
 var rms:pilcgnode; { points to reg main stack }
 function intelcall(p:pilcgnode;var b:rollbackbuffer):boolean;
        var theproc,plist:pilcgnode;
	function makelist(l:pilcgnode):pilcgnode;
        
	begin
		if l=nil
		then makelist:=nil
		else if l^.tag=sequence then
                begin
		     makelist:=new_seq(new_dyad(rms,ilcppush,l^.current),makelist(l^.next))
		end
		else makelist:=new_dyad(rms,ilcppush,l)
	end;
	var nom:string;
	begin
		writeln('dummy call ');
	     appendstr(b,'\n');
	     theproc:=findproc(p^.arg^.opname);
	     plist:=makelist(p^.arg2);
	     printtree(plist,output);
	     if match(plist,b) then begin
	        if theproc<> nil then
                begin
		  nom:=theproc^.startlab^.opname;
		  if theproc^.imported then 
		  begin
			nom:=procprefix+nom;
			appendstr(b,'extern '+nom+'\n');
		  end;
	      	  appendstr(b,'call '+nom+'\n');
	     	  intelcall:=true;
	        end
	        else intelcall:=false;
	     end 
	     else intelcall:=false;
        end;
function ilcg2int(p: pilcgnode):integer;
var t:cheat;
begin
     t.p:=p; ilcg2int:=t.i;
end;
function int2ilcg(i: integer):pilcgnode;
var t:cheat;
begin
     t.i:=i; int2ilcg:=t.p;
end;

var tree:pilcgnode;

var filename:string[80];
list,asmf:text;
THENUM:EXTENDED;
theid:string;
parsecode:integer;

 {$i ilcggram.pas}

    {$i ilcglex.pas}
begin
  procedureentrycode:=intelentry;
  new(rms);
  rms^.tag:=regstack;
  rms^.stackdetails:=regmainstack_stack;
  procedurecallcode:=intelcall;
  filename := paramStr(1);
  if filename='' then
    begin
      write('input file: ');
      readln(filename);
    end;
  assign(yyinput, filename);
  reset(yyinput);    assign(list,'parsed.lst');
  rewrite(list);
  tree:=nil;
  message:='ok';
  parsecode:=yyparse;
  writeln(message);
  if parsecode=0
  then
  begin
       writeln('successful parse!')   ;
       assign(asmf,'p.asm');
       rewrite (asmf);
     { verbose:=true;     {}
       if codegen(tree, asmf)
       then write(' code generated ')
       else write(' could not codegenerate');     {}
       close(asmf);
  end
  else writeln('parse of intermediate code failed  code =', parsecode);

  

 { printtree(tree,list);      }
end.{    }
