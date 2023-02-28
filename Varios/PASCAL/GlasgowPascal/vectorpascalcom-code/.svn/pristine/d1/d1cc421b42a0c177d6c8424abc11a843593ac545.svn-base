unit ilcp;
(*! This contains the types used to represent ilcg internally in pascal *)
interface
uses rollback;
(*! flags to encode formats *)
const foctet=0;
      fhalfword=1;
      fword=2;
      fdword=3;

      fqword=4;
      fquadword=fqword;
      fvoid=-1;
      freal=16;
      fvector=32;
      fref=64;
      fnotreal=128;
      fsigned=8+fnotreal;
      funsigned=fnotreal;
      fint8=foctet+fsigned;
      fuint8=foctet+funsigned;
      fint16=fhalfword+fsigned;
      fuint16=fhalfword+funsigned;
      fint32=fword+fsigned;
      fuint32=fword+funsigned;
      fint64=fdword+fsigned;
      fuint64=fdword+funsigned;
      fdoubleword=fdword;
      fieee32=fword+freal;
      fieee64=fdword+freal;
      fint=fint32;
      fbool=fint8;
      faddr:integer=fint;{ this must be overriden in specific machines }
      fvecmult=256;     { multiply vec length by this and pack into word }
      maxalt=2000;
      maxparam=12;
      maxflag=32;
      maxreg=255;
      realLitSupported=1;
      rollbacksize=2000000;
      ilcptimes='*';
      ilcpand='AND';
      ilcpdivide='/';
      ilcpempty='EMPTY';
      ilcpexponentiate='**';
      ilcpextend='EXTEND';
      ilcpfull='FULL';
      ilcppop='POP';
      ilcppush='PUSH';
      ilcpnot='NOT';
      ilcpor='OR';
      ilcpplus='+';
      ilcpmax='MAX';
      ilcpmin='MIN';
      ilcpminus='-';
      ilcpsubscript='SUBSCRIPT';
      ilcpremainder='MOD';
      ilcpreplicate='REP';
      ilcpcall='CALL';
      ilcpsatplus='+:';
      ilcpsatminus='-:';
      ilcpsatmult='*:';
      ilcpshl='<<';
      ilcpshr='>>';
      ilcplt='<';
      ilcpgt='>';
      ilcpleq='<=';
      ilcpgeq='>=';
      ilcpneq='<>';
      ilcpSQRT='SQRT';
      ilcpROUND='ROUND';
      ilcptrunc = 'TRUNCATE';
      ilcpCOS='COS';
      ilcpSIN='SIN';
      ilcpLN='LN';
      ilcpTAN='TAN';
      ilcpABS='ABS';
      ilcpFLOAT='FLOAT';
      ilcpeq='=';
      ilcpxor='XOR';
      ilcprep=ilcpreplicate;
      recmax=80;
      constfoldingon:boolean=true;

type pilcgnode=^ilcgnode;
     formatcode=integer;
     regbytecode= 0..255;
     reservationcode=set of regbytecode;
     ilcpop = string[10];
     instructionsetindex=0..1023;
     (*! lists the possible types of ilcg node *)
     nodeclass=(deref,
               arraysubscript,
                reallit,
                intlit,
                format,
                regstack,
                unboundformat,        { this will match any format }
                ref,
                gotonode,
                patterntag,
                failure,                    { represents an interrupt exception }
                typevar,                  { matches any type in a pattern }
                Assignop,
                forloop,
                memref,
                dyadicop,
                ifnode,
                sequence,
                alternation,
                monad,
                monop,
                dyad,
                typecast,
                constant,
                param,
                reg,
                location,
                labelnode,
                extlabel,
                procedurenode);

     (*! representation of reals within the compiler *)
     intreal = double;
     {$ifdef windows}
     intint = int64;
     {$endif}
     {$ifndef windows}
     intint = longint;
     {$endif}
     ppattern = ^pattern;

     registerstack=record
                         format:formatcode;
                         depth:integer;
                         printsas:string[40];
    end;
     (*! An ilcg node is a record with a tag field to discriminate type *)
     ilcgnode= record
                simple:boolean;  { true if already simplified }
                case tag:nodeclass of
                patterntag:(pat:ppattern;);

                deref,
                ref,
                constant,
                monad,
                dyad,
                memref,
                typecast,
                failure:(arg,fn,arg2:pilcgnode;);

                location:(locvalue:pilcgnode;);

                regstack:(stackdetails:registerstack;);

                arraysubscript:(     base,        {  base address }


                                     offset:pilcgnode;      { i,th element }
                                                  { step calculated from  format}
                                     elementformat:integer);

                Assignop,
                gotonode:(src,dest:pilcgnode;);

                alternation:(first,last:integer);

                intlit,
                reallit:( reallitarg:intreal;

                          intlitarg:intint;
                          litformat:integer);

                ifnode:( condition,

                         action,
                         alternative:pilcgnode;);

                unboundformat,
                format:(formatarg:integer);
                monop,
                extlabel,
                dyadicop:(opname:string[24];);
                labelnode,
                param,
        	reg:(index:integer;);
        	sequence:(current,next:pilcgnode;);
        	forloop:( indexvar,

                          start,
                          stop,
                          incr,
                          loopaction:pilcgnode);

           procedurenode:( procedurebody:pilcgnode;
			   languagespecificInfo:pointer;
			   imported,calleepopsargs,lefttoright,
			   exported:boolean;
			   paramtype:pilcgnode;
			   returntype,level:integer;
			   startlab,extname:pilcgnode;);
    end;


     register= record
        	format:formatcode;
                permanentlyreserved:boolean;
        	printsas:string[15];
        	code:integer;
                basecode:reservationcode;
    end;
     pprintlist = ^ printnode;
     patternindex = ppattern;
     paramnode =ppattern;
     paramref=0..maxparam;
     paramlist=array[paramref] of paramnode;
     pparamlist = ^ paramlist;
     printsort = (printchar,printparam);
     printnode = record

                 next:pprintlist;

               case literal:printsort of
               printchar:(litval:char;);

               printparam:(index:paramref);
               end;

     pattern = record

             meaning:pilcgnode;
             matchedassembler:pprintlist;
             params:pparamlist;
             paramcount:integer;
         end;

     nodevisitor=procedure(var p:pilcgnode);
     assemblercallback=function(p:pilcgnode;var b:rollbackbuffer):boolean;
     registernumber=0..maxreg;
var
     registers:array[registerNumber] of register ;
     reservations:reservationcode;
     { flags are integers passed through from the
       ilcg source that can be used to guide compilation }
     flags:array[0..maxflag] of integer;
     { controls if debug info sent to output }
     verbose:boolean;

     procprefix:string[10]; { assume this will be _ }
     { predefined patterns }
     pattype_, patlabel_,
     patlabel:ppattern;
     fp,sp:integer; { holds the register numbers }
     (*! alternatives are filled in by machine generated code generator
         it holds a list of alternative patterns in the order they
         must be matched.

         *)
     alternatives:array[0..maxalt] of ppattern;

     instructionsetorder:array[instructionsetindex] of patternindex;
     lastinstruction, { the last valid entry in the instructionsetorder}
     LASTREG,
     lastalt:integer;{ the last valid entry in alternatives }

     { callback functions initialised by the syntax analyser }
     procedureentrycode,
     procedurecallcode,
     procedureexitcode:assemblercallback;


     function findproc( name:string):pilcgnode;
      (*! This is the master matching routine in the code generator
         it matches the tree n against the instructionset until
         it gets a resolution, or if it fails returns false *)

     function match(m:pilcgnode;var b:rollbackbuffer):boolean;


     { functions called by the machine generated code }
     function buildparamref(i:integer):pilcgnode;
     function typeparam:ppattern;
     function string2printlist(s:String ):pprintlist;
     procedure pappendp(var l:pprintlist; i:integer);
     procedure pappends(var l:pprintlist; s:string);

     {------------------------------------------------------------------}
     { below here are the user api functions of ilcp                    }

     { prints an ilcg node tree }
     procedure printtree(n:Pilcgnode; var f:text);
     { print the assembler spec of a pattern }
     procedure printassmspec(p:pprintlist;var f:text);

     (*! Constructors for ilcp nodes *)
     function new_arraysubscript(baseaddr,index:pilcgnode;form:integer):pilcgnode;
     function new_assign(dest,src:pilcgnode):pilcgnode;
     function new_deref(loc:pilcgnode):pilcgnode;
     function new_dyad(left:pilcgnode;op:string;right:pilcgnode):pilcgnode;
     function new_extlabel(s:string):pilcgnode;
     function new_monad(op:string;right:pilcgnode):pilcgnode;
     function new_op(s:string;t:nodeclass):pilcgnode;

     function new_failure(i:pilcgnode):pilcgnode;
     function new_for( indexvar,
                          start,
                          stop,
                          incr,
                          loopaction:pilcgnode):pilcgnode;
     function new_format(form:integer):pilcgnode;
     function new_goto(dest:pilcgnode):pilcgnode;
     function new_if(condition,thenpart,elsepart:pilcgnode):pilcgnode;
     function new_intlit(i:extended;intformat:integer):pilcgnode;
     function new_label:pilcgnode;
     function new_location(v:pilcgnode):pilcgnode;
     function new_memref(dest:pilcgnode;form:integer):pilcgnode;
     function new_procedure(body:pilcgnode;compilerinfo:pointer):pilcgnode;
     function new_reallit(i:intreal;rformat:integer):pilcgnode;
     function new_register(regindex:integer):pilcgnode;
     function new_seq(hd,tl:pilcgnode):pilcgnode;
     function new_typecast(format:integer; exp:pilcgnode):pilcgnode;


     (*! Codegen
         This outputs assembler for the tree pointed to
         by n to the file assemblerfile
         *)
     function codegen(n:pilcgnode; var assemblerfile:text):boolean;
     { perform depth first traversal of tree p
       calling visitor on all nodes. This may
       change the original tree }
     procedure visit(var p:pilcgnode;visitor:nodevisitor);

     { returns the format code of the return type of an expression }
     function getformat(n:pilcgnode):integer;

     { uses a format code to obtaing the length in bytes of the object }
     function lengthinbytes(format:integer):integer;

     { create a vector type descriptor }
     function vectorof(basetype, length:integer):integer;

      {  masks out all vector information from a type }
     function getbaseformat(f:integer):integer;

     {  remove any refs from the format }
     function formatderef(f:integer):integer;

      { replace all occurences of A with B in the tree C
      return a complete new copy of the tree
      }
      Function substituteAwithBinC(A,B:pilcgnode;C:pilcgnode):pilcgnode;


     { perform basic simplification of an ilcg tree }
     function simplify(n:pilcgnode):pilcgnode;

     { remove one level of cast from n }
     function decast(n:pilcgnode):pilcgnode;

     { true if the general format includes the specific one }
     function formatincludes(general,specific:integer):boolean;

     (*! Functions to manipulate register reservation *)

     function reserved(r:integer):boolean;
     (*! true if register r is reserved *)


     procedure reserve(r:integer);
     (*! add register r to the reservation set *)

     function findfreereg(format:integer):integer;
     (*! looks for a free reg of the given type and returns -1 if
       it does not find it otherwise returns the register number*)

     function is_literal(node:pilcgnode):boolean;
     { return true if the node is a compile time constant }

     function get_IntValue(node:pilcgnode):longint;

     function get_RealValue(node:pilcgnode):double;

     procedure unreserve(r:integer);
     function ii2i(ii:intint):integer;

var
     plus_,
   minus_ ,
   identifier,
  exponentiate_,
   times_ ,
   divide_ ,
  replicate_,
   lt_,
   gt_,
   call_,
  le_,
  ge_,
  equals_,
  ne_,
  min_,
  max_,
  push_,
  subscript_,
  satplus_,
  satmult_,
  satminus_,
  shl_,
  shr_,
        remainder_,
        or_,
        and_,
        xor_,not_
  ,full_
  ,empty_
  ,pop_
  ,sin_
  ,trunc_
  ,round_
  ,float_
  ,extend_
  ,cos_
  ,tan_
  ,abs_
  ,sqrt_
  ,ln_:pilcgnode;

implementation

    type
        checkpoint = record
                   mark:integer;
                   reserved:reservationcode;
                   end;
         pilcglist=^ilcglist;
         ilcglist=record
                        head:pilcgnode;
                        tail:pilcglist;
                  end;
     var bitbucket:string ; { this string is used to dispose of matches we }
                            {  do not need to record }
         labcount:integer;
         recursiondepth:integer;
	 proclist:pilcgnode;
         alternativesBeingTried:array[0..maxalt]of pilcgnode;
     function binarymatch(src,template:pilcgnode):boolean;
              forward;
  function get_IntValue(node:pilcgnode):longint;
  begin get_intValue:=node^.intlitarg end;
  function get_RealValue(node:pilcgnode):double;
  begin get_realValue:=node^.reallitarg end;
  function is_literal(node:pilcgnode):boolean;
  begin is_literal:= node^.tag in [intlit,reallit] end;
  function ii2i(ii:intint):integer;
  begin ii2i:=round(1.0*ii) end;
     function cons(p:pilcgnode;l:pilcglist):pilcglist;
     var t:pilcglist;
     begin
          new(t);
          t^.head:=p;t^.tail:=l;
          cons:=t;
     end;
     procedure freelist(n:pilcglist);
     begin
          if n <> nil
          then begin
               freelist(n^.tail);
               dispose(n);
          end;
     end;
     function inlist(l:pilcglist;n:pilcgnode):boolean;
     begin
          if l=nil
          then inlist:=false
          else if binarymatch(l^.head,n)
               then inlist:=true
               else inlist:= inlist(l^.tail,n)
     end;
     procedure addtoset(var l:pilcglist;n:pilcgnode);
     begin
          if not inlist(l,n)
          then l:=cons(n,l)
     end;
     {----------------------------------------------------------}
     { Tree visiting utilities                                  }
     {----------------------------------------------------------}
     procedure visit(var p:pilcgnode;visitor:nodevisitor);
     begin

      if p<> nil then
       with p^ do
        case tag of
                monop,
                labelnode,extlabel,
                dyadicop,
                alternation,
                intlit,
                reallit,
                regstack,
                patterntag,
                reg,
                format,
                param:   { no subnodes }
                         begin  { do nothing}
                         end;

                monad:   begin
                              visit(fn,visitor);
                              visit(arg,visitor);
                         end;
                constant,
                ref,
                memref,
    deref:   visit(arg,visitor);

    procedurenode: visit(procedurebody,visitor);

                gotonode: visit(dest,visitor);

                dyad:   begin
                         visit(arg,visitor);
                         visit(fn,visitor);
                         visit(arg2,visitor);
                        end;

                location: visit(locvalue,visitor);

                typecast: begin
                           visit(arg,visitor);
                           visit(arg2,visitor);
                          end;
                arraysubscript: begin
                                     visit(base,visitor);
                                     visit(offset,visitor);
                                end;

                assignop:begin
                              visit(dest,visitor);
                              visit(src,visitor);
                         end     ;
                sequence:begin
                              visit(current,visitor);
                              visit(next,visitor);
                         end;
                forloop:begin visit(indexvar,visitor);
                              visit(start,visitor);
                              visit(stop,visitor);
                              visit(incr,visitor);
                              visit(loopaction,visitor);
                        end;
                ifnode:begin

                            visit(condition,visitor);
                            visit(action,visitor);
                            visit(alternative,visitor);
                       end;
            else write( ' visit unknown node type tag ',ord(tag));
            end;
            if p<>nil then visitor(p);
     end;
     type prenodevisitor=function (var p:pilcgnode):boolean;
     { previsit will only visit the subsidiary nodes if
       the prenodevisitor function returns true }
     procedure previsit(var p:pilcgnode;visitor:prenodevisitor);
       procedure visit(var p:pilcgnode;visitor:prenodevisitor);
       begin

        if p<> nil then
        if visitor(p )
        then
         with p^ do
          case tag of
                  monop,
                  labelnode,
                  extlabel,
                  dyadicop,
                  alternation,
                  intlit,
                  reallit,
                  regstack,
                  patterntag,
                  reg,
                  format,
                  param:   { no subnodes }
                           begin  { do nothing}
                           end;

                  monad:   begin
                                visit(fn,visitor);
                                visit(arg,visitor);
                           end;
                  constant,
                  ref,
                  memref,
      deref:   visit(arg,visitor);

                        procedurenode: visit(procedurebody,visitor);

                  gotonode: visit(dest,visitor);

                  dyad:   begin
                           visit(arg,visitor);
                           visit(fn,visitor);
                           visit(arg2,visitor);
                          end;

                  location: visit(locvalue,visitor);

                        forloop:begin visit(indexvar,visitor);
                              visit(start,visitor);
                              visit(stop,visitor);
                              visit(incr,visitor);
                              visit(loopaction,visitor);
                        end;
                  typecast: begin
                             visit(arg,visitor);
                             visit(arg2,visitor);
                            end;
                  arraysubscript: begin
                                       visit(base,visitor);
                                       visit(offset,visitor);
                                  end;

                  assignop:begin
                                visit(dest,visitor);
                                visit(src,visitor);
                           end     ;
                  sequence:begin
                                visit(current,visitor);
                                visit(next,visitor);
                           end;
                  ifnode:begin

                              visit(condition,visitor);
                              visit(action,visitor);
                              visit(alternative,visitor);
                         end;
              else write( ' visit unknown node type tag ',ord(tag));
              end;

       end;
     begin
          visit(p,visitor);
     end;
     { produce a modified copy of the tree p under
       the filter provided by node visitor.
       the original is unchanged.
       At the end, p points to a new tree
       }
     procedure modify(var p:pilcgnode; visitor:nodevisitor);
     var q:pilcgnode;
     begin
      if p<> nil then begin
       new (q);
       q^:=p^;
       p:=q;

       with p^ do
        case tag of
                monop,
                labelnode,
                extlabel,
                dyadicop,
                alternation,
                intlit,
                reallit,
                regstack,
                patterntag,
                reg,
                format,
                param:   { no subnodes }
                         begin  { do nothing}
                         end;

                monad:   begin
                              modify(fn,visitor);
                              modify(arg,visitor);
                         end;
                constant,
                ref,
                memref,
    deref:   modify(arg,visitor);


                forloop:begin modify(indexvar,visitor);
                              modify(start,visitor);
                              modify(stop,visitor);
                              modify(incr,visitor);
                              modify(loopaction,visitor);
                        end;
                arraysubscript: begin
                                     modify(base,visitor);
                                     modify(offset,visitor);
                                end;

                procedurenode: modify(procedurebody,visitor);

                gotonode: modify(dest,visitor);

                dyad:   begin
                         modify(arg,visitor);
                         modify(fn,visitor);
                         modify(arg2,visitor);
                        end;

                location: modify(locvalue,visitor);

                typecast: begin
                           modify(arg,visitor);
                           modify(arg2,visitor);
                          end;


                assignop:begin
                              modify(dest,visitor);
                              modify(src,visitor);
                         end     ;
                sequence:begin
                              modify(current,visitor);
                              modify(next,visitor);
                         end;
                ifnode:begin

                            modify(condition,visitor);
                            modify(action,visitor);
                            modify(alternative,visitor);
                       end;
            else write( ' modify unknown node type tag ',ord(tag));
            end;
            if p<> nil then visitor(p);
        end;
     end;
     procedure nullmodifier(var p:pilcgnode);begin end;
     {make an exact copy of a node }
     function clone(p:pilcgnode):pilcgnode;
     const modi:nodevisitor=nullmodifier;
     begin
          modify(p,modi);
          clone:=p;
     end;
     { replace an array subscription with a memref }
     procedure subscript2memref( var p:pilcgnode);
     var t:pilcgnode;
     begin
          if (p ^.tag = arraysubscript)
          then
          begin
               t:=new_memref(
                             new_dyad( p^.base,
                               ilcpplus,
                               new_dyad(p^.offset,
                                        ilcptimes,
                                        new_intlit(
                                            lengthinbytes(p^.elementformat),
                                            fint))),
                                p^.elementformat);
               p:=t;

          end;
     end;
     procedure replacesubscripts(var p:pilcgnode);
     begin visit(p,subscript2memref) end;
     {-------------------------------------------------------}
     {  Vectorisation section of codegen                     }
     {-------------------------------------------------------}

     var assignmentcount:integer;
         assigntype:integer;
     procedure assignfinder(var p:pilcgnode);
     begin
          if p<>nil
          then if p^.tag=assignop
               then begin
                     assignmentcount:=assignmentcount+1;
                     assigntype:=getformat(p^.src);
                     end
     end;
     function getparallelism(n:pilcgnode):integer;
     var i,k,j,f:integer;
     begin
          k:=1;
          assignmentcount:=0;
          visit(n,assignfinder);
          for i:=0 to lastreg do
          begin
               f:=getbaseformat(registers[i].format);
               if (f and not fref)=assigntype
               then begin
                    j:=(registers[i].format) div fvecmult;
                    if j>k
                    then k:=j;
               end
          end;
          getparallelism:=k;
     end;
     var callcount:integer;
     procedure callfinder(var p:pilcgnode);
     begin
          if p<>nil
          then if p^.tag=dyadicop
               then if p^.opname=ilcpcall
                    then callcount:=callcount+1;
     end;

     var forcount,gotocount:integer;
     procedure forfinder(var p:pilcgnode);
     begin
          if p<>nil
          then if p^.tag=forloop
                    then forcount:=forcount+1;
          if p<>nil
          then if p^.tag=gotonode
                    then gotocount:=gotocount+1;
     end;
     { count the procedure calls in a tree }
     function callsin(p:pilcgnode):integer;
     begin
          callcount:=0;
          visit(p,callfinder);
          callsin:=callcount;
     end;
     { count the procedure calls in a tree }
     function forsin(p:pilcgnode):integer;
     begin
          forcount:=0;
          visit(p,forfinder);
          forsin:=forcount;
     end;
     function innerloop(p:pilcgnode):boolean    ;
     begin
          gotocount:=0;
          if (forsin(p) = 1)
             and
             (callsin(p) = 0)
          then innerloop:=gotocount=0
          else innerloop:=false
     end;
     { count the assignments calls in a tree }
     function assignsin(p:pilcgnode):integer;
     begin
          assignmentcount:=0;
          visit(p,assignfinder);
          assignsin:=assignmentcount;
     end;
     var currentindexvar:pilcgnode;
         offsetsaresimple:boolean;
     { This checks if the index of an array is
       a deref of the curren index var }
     procedure simpleindexcheck(var p:pilcgnode);
     begin
          if p<> nil
          then
            if p^.tag=arraysubscript
            then begin
                 if p^.offset^.tag <> deref
                 then  offsetsaresimple:=false
                 else
                 if not binarymatch(p^.offset^.arg,currentindexvar)
                 then offsetsaresimple:=false
            end
     end;
     { returns true if all offsets to arrays in loop
       are indexeded by I }
     function allOffsetsInLareI(L,I:pilcgnode):boolean;
     begin
         offsetsaresimple:=true;
         currentindexvar:=I;
         visit(L,simpleindexcheck);
         allOffsetsInLareI:=offsetsaresimple;
     end;
     var nonarrayassignmentcount:integer;
     procedure countnonarrayassignments(var p:pilcgnode);
     begin
          if p<>nil
             then if p^.tag=assignop
                  then
                       if decast(p^.dest)^.tag<> arraysubscript
                       then nonarrayassignmentcount:=
                              nonarrayassignmentcount+1;
     end;
     var isolatedindexcount:integer;
     function checkisolatedindices(var p:pilcgnode):boolean;
     { this is a prenode visitor so it returns true if
       the node is to be further searched }
     begin
          if binarymatch(p,currentindexvar)
          then isolatedindexcount:=isolatedindexcount+1;
          if p=nil
          then checkisolatedindices:=false
          else
              case p^.tag of
              memref,
              arraysubscript:checkisolatedindices:=false;
              else checkisolatedindices:=true;
              end;
     end;
     { check if we have any occurences of the index var that are
       not part of array subscripts }
     function IndexOccursInNonArrayExpression(indexvar,oldbody:pilcgnode):boolean;
     begin
          currentindexvar:=indexvar;
          isolatedindexcount:=0;
          previsit(oldbody,checkisolatedindices);
          IndexOccursInNonArrayExpression:= isolatedindexcount>0;
     end;
     { call with loop pointing at a for loop
       return true if safe to vectorise loop
     }
     function vectorisable(loop:pilcgnode):boolean;
         function anyNonArrayAssignments:boolean;
         begin
           nonarrayassignmentcount:=0;
           visit(loop,countnonarrayassignments);
           anyNonArrayAssignments:= nonArrayAssignmentCount>0
         end;
     begin
          if loop=nil
          then vectorisable:=false
          else
          if loop^.tag<> forloop
          then vectorisable:=false
          else
          if assignsin(loop)>1  { this is a conservative rule }
          then vectorisable:=false
          else
          if callsin(loop)>0
          then vectorisable:=false
          else
          if forsin(loop)>1
          then vectorisable:=false
          else
          if loop^.incr^.tag<>intlit
          then vectorisable:=false
          else
          if loop^.incr^.intlitarg<>1
          then vectorisable:=false
          else
          if anyNonArrayAssignments
          then vectorisable:=false
          else
          if IndexOccursInNonArrayExpression(loop^.indexvar,loop^.loopaction)
          then vectorisable:=false
          else
          if getparallelism(loop)<2
          then vectorisable:=false
          else
          vectorisable:= allOffsetsInLAreI(loop^.loopaction,loop^.indexvar)
     end;
     function scalarreplicator(scalar:pilcgnode;replicate:integer):pilcgnode;
     begin
          scalarreplicator:=
              new_typecast(vectorof(getformat(scalar),replicate),
                 new_dyad(scalar,ilcprep,new_intlit(replicate,fint)));
     end;
     var replicationfactor:integer;
     function expressionVectorisor(var p:pilcgnode):boolean;
     { this is a pre visitor so it should return false
       if no further rewriting is to be done on the node
       }
     var t:pilcgnode;
     begin
          if p=nil
          then expressionVectorisor:=false
          else
          case p^.tag of
          arraysubscript: if binarymatch(p^.offset,new_deref(currentindexvar))
                          then begin
                              { replace with replicated array }
                              t:=new_arraySubscript(
                                  p^.base,
                                  new_deref(currentindexvar),
                                  vectorof( getbaseformat(p^.elementformat),replicationfactor));
                              expressionvectorisor:=false;
                              p:=t;
                         end else
                         begin
                              p:=scalarReplicator(p,replicationfactor);
                              expressionvectorisor:=false;
                         end;
          format:      begin
                              p:=new_format(vectorof(p^.formatarg,replicationfactor));
                              expressionvectorisor:=false;
                       end;
          intlit,
          reallit,
          memref:      begin
                            p:=scalarReplicator(p,replicationfactor);
                            expressionVectorisor:=false;
                       end;
          else expressionVectorisor:=true;
          end
     end;
     { takes a loop and returns an unrolled loop }
     function unroll(loop:pilcgnode):pilcgnode;
     var start,stop,increment,timesround:intint;
         i,j,k:integer;
         step:pilcgnode;
     label 99;
         function replicate(n:integer):pilcgnode;
         begin
              if n<=1
              then replicate:=loop^.  loopaction
              else replicate:= new_seq(replicate(n-1),
                                new_seq( step,
                                         loop^.loopaction)
                                )
         end;
     begin
          if loop=nil
          then unroll:=nil
          else
          if loop^.tag<>forloop
          then unroll:=loop
          else
          if (loop^.start^.tag=intlit)
             and
             (loop^.stop^.tag=intlit)
             and
             (loop^.incr^.tag=intlit)
             and
             (loop^.incr^.intlitarg>0)
          then
          begin
               start:=loop^.start^.intlitarg;
               stop:=loop^.stop^.intlitarg;
               increment:=loop^.incr^.intlitarg;
               timesround:= (stop-start+1) div increment;
               k:=5;


               for i:=k downto 1 do
                    if ( timesround mod i )=0
                    then begin
                         j:=i;
                         goto 99;
                         end      ;

               99:

               step:=new_assign( loop^.indexvar,
                                 new_dyad(
                                   new_deref(loop^.indexvar),
                                   ilcpplus,
                                   loop^.incr
                                 )
                                );
               if j=timesround
               then unroll:= new_seq(
                               new_assign(loop^.indexvar,loop^.start),
                               replicate(j))
               else unroll:=new_for(
                                  loop^.indexvar,
                                  loop^.start,
                                  loop^.stop,
                                  loop^.incr,
                                  replicate(j))
          end


     end;
     procedure vectoriseloop(newstep:integer;

                             oldloop:pilcgnode;
                             var quotientloop: pilcgnode;
                             var remainderloop: pilcgnode);
     { newstep specifies the vectorisation step
       this generates two new loops for the oldloop
       suppose the old loop was of the form
        for i:= 1 to 11 step 1 do x[i]:=x[i]+y[i];
       suppose newstep = 4
       we will get a paif of newloops of form
        for i:= 1 to 5 step 4 do x[i..i+3]:=x[i..i+3]+y[i..i+3]
        for i:= 9 to 11 step 1 do x[i]:=x[i]+y[i];
     }
     var oldstart,oldfinish,oldstep:pilcgnode;
         indexvar:pilcgnode;

         looprange,
         loopremainder,
         secondloopfinish,
         rangeinfirstloop,
         one,
         timesroundfirstloop,
         oldbody,
         newbody,
         firstnewstop,secondnewstart,firstnewstep:pilcgnode;
         firstloopbody,secondloopbody:pilcgnode;
         needreplicatediterator:boolean;
     begin
         if newstep<2
         then begin
              quotientloop:=nil;
              remainderloop:=oldloop;
              end
         else begin
         { loop of the form
           FOR indexvar:=oldstart TO oldfinish STEP oldstep DO oldbody }
         oldbody:=oldloop^.loopaction;
         secondloopbody:=oldbody;
         oldstart:=oldloop^.start;
         oldstep:=oldloop^.incr;
         indexvar:=oldloop^.indexvar;
         oldfinish:=oldloop^.stop;
         secondloopfinish:=oldfinish;
         one:=new_intlit(1,getformat(oldstart));
         firstnewstep:=new_intlit(newstep,getformat(oldstart));
                     { oldfinish - oldstart + 1 }
         looprange:=new_dyad(
                      new_dyad(oldfinish,ilcpminus,oldstart),
                      ilcpplus,
                      one
                      );
                         { looprange mod newstep }
         loopremainder:= new_dyad(looprange,
                                  ilcpremainder,
                                  firstnewstep);
         rangeinfirstloop:=new_dyad(looprange,ilcpminus,loopremainder);
         timesroundfirstloop:=new_dyad(looprange,ilcpdivide,firstnewstep);
         firstnewstop:=new_dyad( oldstart,
                                 ilcpplus,
                                 new_dyad( rangeinfirstloop,
                                           ilcpminus,
                                           one));
         secondnewstart:=new_dyad( new_dyad(one,ilcpplus,oldfinish),
                                  ilcpminus,
                                  loopremainder);
         currentindexvar:=indexvar;
         replicationfactor:=newstep;
         newbody:=clone(oldbody);
         previsit(newbody, expressionVectorisor);
         quotientloop:=new_for( indexvar,
                                oldstart,
                                firstnewstop,
                                firstnewstep,
                                newbody);
         remainderloop:=new_for( indexvar,
                                 secondnewstart,
                                 oldfinish,
                                 oldstep,
                                 oldbody);
         end;
     end;
     { create a vector type descriptor }
     function vectorof(basetype, length:integer):integer;
     begin
          vectorof:=basetype +fvector+ (length*fvecmult);
     end;
     function formatderef(f:integer):integer;
     begin
          formatderef:= f and (not fref)
     end;
     {-----------------------------------------------------------}
     { register allocation                                       }
     {-----------------------------------------------------------}


     function reserved(r:integer):boolean;
     (*! true if register r is reserved *)
     begin
          reserved:= registers[r].permanentlyreserved
                     or
                     (registers[r].basecode * reservations <>[])
     end;
     procedure reserve(r:integer);
     (*! add register r to the reservation set *)
     begin
          if verbose then writeln('reserve ',registers[r].printsas);
          reservations := reservations + registers[r].basecode;
     end;
     procedure unreserve(r:integer);
     (*! remove register r from the reservation set *)
     begin
          if verbose then writeln('unreserve ',registers[r].printsas);
          reservations:=reservations - registers[r].basecode;
     end     ;
     { looks for a free reg of the given type and returns -1 if
       it does not find it otherwise returns the register number}
     function findfreereg(format:integer):integer;
     var i,j,k:integer; label 99;
     begin
           j:=-1;
           for i:=0 to lastreg do begin
              if (((not fref) and registers[i].format )= (( not fref ) and format)  )
                 and
                 not reserved(i)
              then begin j:= i ; goto 99 end
           end     ;
           99: findfreereg:=j;
     end;


     {-----------------------------------------------------------}
     { Constructors - functions used to build the tree           }
     {-----------------------------------------------------------}
     function new_procedure(body:pilcgnode;compilerinfo:pointer):pilcgnode;
     var p:pilcgnode;
     begin
  	new(p);
  	p^.tag:=procedurenode;
  	p^.procedurebody:=body;
  	p^.languagespecificinfo:=compilerinfo;
  	new_procedure:=p;
	proclist:=new_seq(p,proclist);
     end;
     function new_deref(loc:pilcgnode):pilcgnode;
     var p:pilcgnode;
     begin
          new(p);
          p^.tag:=deref;
          p^.arg:=loc;
          new_deref:=p;
     end;
     function new_extlabel(s:string):pilcgnode;
     var p:pilcgnode;
     begin
    if registers[fp].printsas=s then
    begin new_extlabel:= new_register(fp)
    end
    else begin
            new(p);
            p^.tag:=extlabel;
            p^.opname:=s;
            new_extlabel:=p;
          end;

     end;
     function new_monad(op:string;right :pilcgnode):pilcgnode;
     var p:pilcgnode;
     begin
              new(p);
              p^.tag:=monad;
              p^.arg:=right;
              new(p^.fn);
            p^.fn^.tag:=monop;
            p^.fn^.opname:=op;
             new_monad:=p;
     end;
     function new_dyad(left:pilcgnode;op:string;right:pilcgnode):pilcgnode;
      var p:pilcgnode;
          flag:integer;
          l,r:intint;
          b:boolean;
          function consensus:integer;
          begin
                consensus:=left^.litformat

          end  ;
          function canreduce:boolean;
          begin
            canreduce:= constfoldingon
                        and
                        (left^.litformat=right^.litformat)
          end ;
	label 99;
     begin

          
	if (left= nil) or (right = nil )
	then goto 99;
          IF
             (LEFT^.TAG=INTLIT)
             AND
             (RIGHT^.TAG=INTLIT)
             AND
             CANREDUCE
             AND(
                 (op=ilcplt)
                   or
                   (op=ilcpgt)
                   or
                   (op=ilcpgeq)
                   or
                   (op=ilcpleq)
                   or
                   (ilcpeq=op)
                   )
          THEN begin   { boolean evaluations }
               l:=left^.intlitarg; r:=right^.intlitarg;
               b:= (op=ilcplt) and  (l<r)
                   or
                   (op=ilcpgt) and (l>r)
                   or
                   (op=ilcpgeq) and (l>=r)
                   or
                   (op=ilcpleq) and (l<=r)
                   or
                   (ilcpeq=op) and (l=r);
               if b then p:= new_intlit(-1,fint8)
               else p:= new_intlit(0,fint)
          end
          else
          IF (OP=ILCPPLUS)
             AND
             (LEFT^.TAG=INTLIT)
             AND
             (RIGHT^.TAG=INTLIT)
             AND
             CANREDUCE
          THEN P:= NEW_INTLIT(LEFT^.INTLITARG+RIGHT^.INTLITARG,CONSENSUS)
          ELSE IF (OP=ILCPAND)
             AND
             (LEFT^.TAG=INTLIT)
             AND
             (RIGHT^.TAG=INTLIT)
             AND
             CANREDUCE
          THEN P:= NEW_INTLIT(LEFT^.INTLITARG and RIGHT^.INTLITARG,CONSENSUS)
          ELSE IF (OP=ILCPOR)
             AND
             (LEFT^.TAG=INTLIT)
             AND
             (RIGHT^.TAG=INTLIT)
             AND
             CANREDUCE
          THEN P:= NEW_INTLIT(LEFT^.INTLITARG or RIGHT^.INTLITARG,CONSENSUS)
          ELSE IF (OP=ILCPTIMES)

             AND
             (RIGHT^.TAG=INTLIT)
             AND
             (RIGHT^.INTLITARG=1)

          THEN P:= LEFT
           ELSE IF (OP=ILCPTIMES)

             AND
             (LEFT^.TAG=INTLIT)
             AND
             (LEFT^.INTLITARG=1)

          THEN P:= RIGHT
           ELSE IF (OP=ILCPPLUS)

             AND
             (RIGHT^.TAG=INTLIT)
             AND
             (RIGHT^.INTLITARG=0)

          THEN P:= LEFT
           ELSE IF (OP=ILCPPLUS)

             AND
             (LEFT^.TAG=INTLIT)
             AND
             (LEFT^.INTLITARG=0)

          THEN P:= RIGHT

          ELSE IF (OP=ILCPTIMES)

             AND
             (LEFT^.TAG=INTLIT)
             AND
             (LEFT^.INTLITARG=1)

          THEN P:= RIGHT
          ELSE IF (OP=ILCPDIVIDE)
             AND
             (LEFT^.TAG=INTLIT)
             AND
             (RIGHT^.TAG=INTLIT)
             AND
             CANREDUCE
          THEN P:= NEW_INTLIT(LEFT^.INTLITARG div RIGHT^.INTLITARG,CONSENSUS)
          ELSE IF (OP=ILCPREMAINDER)
             AND
             (LEFT^.TAG=INTLIT)
             AND
             (RIGHT^.TAG=INTLIT)
             AND
             CANREDUCE
          THEN P:= NEW_INTLIT(LEFT^.INTLITARG mod RIGHT^.INTLITARG,CONSENSUS)
          ELSE IF (OP=ILCPMINUS)
             AND
             (LEFT^.TAG=INTLIT)
             AND
             (RIGHT^.TAG=INTLIT)
             AND
             CANREDUCE
          THEN P:= NEW_INTLIT(LEFT^.INTLITARG-RIGHT^.INTLITARG,CONSENSUS)
          ELSE IF (OP=ILCPPLUS)
             AND
             (LEFT^.TAG=REALLIT)
             AND
             (RIGHT^.TAG=REALLIT)
             AND
             CANREDUCE
          THEN P:= NEW_REALLIT(LEFT^.REALLITARG+RIGHT^.REALLITARG,CONSENSUS)
          ELSE IF (OP=ILCPTIMES)
             AND
             (LEFT^.TAG=REALLIT)
             AND
             (RIGHT^.TAG=REALLIT)
             AND
             CANREDUCE
          THEN P:= NEW_REALLIT(LEFT^.REALLITARG*RIGHT^.REALLITARG,CONSENSUS)
          ELSE IF (OP=ILCPPLUS)
             AND
             (LEFT^.TAG=DYAD)
             AND
             (LEFT^.FN^.OPNAME=ILCPPLUS)
             AND
             (RIGHT^.TAG=INTLIT)

          THEN p:= new_dyad(LEFT^.ARG,ILCPPLUS,
                            new_dyad(RIGHT, ILCPPLUS,LEFT^.ARG2))
    ELSE BEGIN
	99:
            new(p);
            p^.tag:=dyad;
                  if ((OP=ILCPTIMES)OR(OP=ILCPPLUS)or (op=ILCPAND) or (op=ILCPOR))
                     AND
                     (LEFT^.TAG=INTLIT)
                  then begin { for commutative ops put the literal second }
                             { this will match many instructions better }
                            p^.arg2:=left;
                      p^.arg:=right;
                       end
                  else begin
                      p^.arg:=left;
                      p^.arg2:=right;
                       end;
            new(p^.fn);
            p^.fn^.tag:=dyadicop;
            p^.fn^.opname:=op;
          END;

          new_dyad:=p;
     end;
     function new_for( indexvar,
                          start,
                          stop,
                          incr,
                          loopaction:pilcgnode):pilcgnode;
     var p:pilcgnode;
     begin
         if (start^.tag = intlit)
            and
            (stop^.tag = intlit)
            and
            (incr^.tag = intlit)
            and
            (incr^.intlitarg>0)
            and
            (stop^.intlitarg<start^.intlitarg)
          then new_for:=nil
          else if (start^.tag = intlit)
            and
            (stop^.tag = intlit)
            and
            (incr^.tag = intlit)
            and
            (incr^.intlitarg>0)
            and
            (1=(((stop^.intlitarg -start^.intlitarg)+1) div incr^.intlitarg))
          then new_for:= new_seq( new_assign(indexvar,start),
                                  loopaction)


          else
          begin
          new(p);
          p^.simple:=false;
          p^.tag:=forloop;
          p^.indexvar:=indexvar;
          p^.start:=start;
          p^.stop:=stop;
          p^.incr:=incr;
          p^.loopaction:=loopaction;
          new_for:=p;
          end
     end;

     function new_format(form:integer):pilcgnode;
     var p:pilcgnode;
     begin
          new(p);
          p^.tag:=format;
          p^.formatarg:=form;
          new_format:=p;
     end;
     function new_if(condition,thenpart,elsepart:pilcgnode):pilcgnode;
      var p:pilcgnode;
     begin
          if condition^.tag<> intlit
          then begin

          new(p);
          p^.simple:=false;
          p^.tag:=ifnode;
          p^.condition:=condition;
          p^.action:=thenpart;
          p^.alternative:=elsepart;
          new_if:=p;
          end
          else
          begin
               if condition^.intlitarg<>0
               then new_if:=thenpart
               else new_if:=elsepart
          end
     end;
     function new_goto(dest:pilcgnode):pilcgnode;
      var p:pilcgnode;
     begin
          new(p);
          p^.tag:= gotonode;
          p^.dest:=dest;

          new_goto:=p;
     end;
     function new_label:pilcgnode;
      var p:pilcgnode;
     begin
          new(p);
          p^.tag:=labelnode;
          p^.index:=labcount;
          labcount:=labcount+1;

          new_label:=p;
     end;

     function new_location(v:pilcgnode):pilcgnode;
     var p:pilcgnode;
     begin
          new(p);
          p^.tag:=location;
          p^.locvalue:=v;
          new_location:=p;
     end;
     function new_memref(dest:pilcgnode;form:integer):pilcgnode;
     var p:pilcgnode;
     begin
          new(p);
          p^.tag:=memref;
          p^.arg:=dest;
          p^.arg2:=new_format(form or fref);
          new_memref:=p;
     end;
     function new_arraysubscript(baseaddr,index:pilcgnode;form:integer):pilcgnode;
     var p:pilcgnode;
     begin
          new(p);
          p^.tag:=arraysubscript;
          p^. base:= baseaddr;
          p^.offset:=index;
          p^.elementformat:=(form or fref);
          new_arraysubscript:=p;
     end;

     function new_assign(dest,src:pilcgnode):pilcgnode;
     var p:pilcgnode;
     begin
          new(p);
          p^.tag:=assignop;
          p^.src:=src;
          p^.dest:=dest;
          new_assign:=p;
     end;
     function new_reallit(i:intreal;rformat:integer):pilcgnode;
     var p:pilcgnode;
     begin
          new(p);
          p^.tag:=reallit;
          p^.litformat:=rformat;
          p^.reallitarg:=i;
          new_reallit:=p;
     end;

     function new_intlit(i:extended;intformat:integer):pilcgnode;
     var p:pilcgnode;
     begin
          new(p);
          p^.tag:=intlit;
          p^.litformat:=intformat;
          p^.intlitarg:=round(i);
          new_intlit:=p;
     end;
     function new_failure(i:pilcgnode):pilcgnode;
     var p:pilcgnode;
     begin
          new(p);
          p^.tag:=failure;
          p^.arg:=i;

          new_failure:=p;
     end;
     function new_register(regindex:integer):pilcgnode;
     var p:pilcgnode;
     begin
          new(p);
          p^.tag:=reg;
          p^.index:=regindex;
          new_register:=p;
     end;
     function new_seq(hd,tl:pilcgnode):pilcgnode;
     var p:pilcgnode;
     begin
          new(p);
          p^.tag:=sequence;
          p^.current:=hd;
          p^.next:=tl;
          new_seq:=p;
     end;

     function new_typecast(format:integer; exp:pilcgnode):pilcgnode;
     var p:pilcgnode;
     begin
          new(p);
          p^.tag:=typecast;
          p^.arg:=new_format(format);
          p^.arg2:=exp;
          new_typecast:=p;
     end;
     function typeofop(f:pilcgnode;arg1,arg2:integer):integer;
     var s:string;
     begin
          s:=f^.opname;
          if (s=ilcplt) or
             (s=ilcpgt) or
             (s=ilcpgeq) or
             (s=ilcpleq) or
             (s=ilcpeq) or
             (s=ilcpneq)
          then typeofop:=fbool
          else if (arg1)<>(arg2)

          then begin
             if (arg1 and freal) <>(arg2 and freal)
             then begin
                  if (arg1 and freal)=freal
                  then typeofop:=arg1
                  else typeofop:=arg2
             end
             else
             if arg1>arg2
             then typeofop:=arg1
             else typeofop:= arg2
          end
          else
           typeofop:=arg2
     end;
     function typeoffunc(f:pilcgnode;argumenttype:integer):integer;
     var s:string;
     begin
           s:=f^.opname;
           if (s= 'ROUND' ) or (s= 'TRUNC')
           then typeoffunc:=fint
           else if (s = 'FLOAT')
           then typeoffunc:=fieee64
           else typeoffunc:= argumenttype
     end;

     function simplify(n:pilcgnode):pilcgnode;
     var l1,l2,n1:pilcgnode;
         init,increment,test:pilcgnode;
     begin
          if verbose
          then printtree(n,output);
          if n<>nil then with n^ do
          case n^.tag of
          forloop:begin
                       l1:=new_label;
                       l2:=new_label;
                       init:=new_assign(indexvar,start);
                       increment:=new_assign(
                                     indexvar,
                                     new_dyad(indexvar,ilcpplus,incr));

                       test:=new_if(
                                    new_dyad(incr,ilcpgt,new_intlit(0,fint)),
                                    new_if(
                                           new_dyad(
                                                    new_deref(indexvar),
                                                    ilcpleq,
                                                    stop),
                                           new_goto(l1),
                                           nil),
                                    new_if(new_dyad(
                                                    new_deref(indexvar),
                                                    ilcpgeq,
                                                    stop),
                                           new_goto(l1),
                                           nil));
                       n:=new_seq(new_seq(init,new_goto(l2)),
                                         new_seq(new_seq(l1,
                                                         new_seq( loopaction ,
                                                                   increment)
                                                         ),
                                                 new_seq(l2,test)
                                                 )
                                         );
                       if verbose
                       then printtree(n,output);
                        simplify:=n;
                  end;
          ifnode:if not simple
                 then begin
                      l1:=new_label;l2:=new_label;
                      n1:= new_if(condition,new_goto(l1),nil);
                      n1^.simple:=true;
                      n1:=new_seq(n1,
                          new_seq(alternative,
                           new_seq(new_goto(l2),
                            new_seq(l1,
                             new_seq(action,l2)
                            )
                           )
                          )
                      );
                      n1^.simple:=true;
                     { printtree(n1,debugfile);  }
                      simplify:=n1;

                 end
                 else simplify:=n;
          else begin
                     { this is a dummy implementation for now }
                     n^.simple:=true;
                     simplify:=n;
                end
          end
          else simplify:=nil

     end;
     function lengthinbytes(format:integer):integer;
     begin
        if (format and fvector) =0
        then case format and 7 of
             foctet:    lengthinbytes:=1;
             fhalfword: lengthinbytes:=2;
             fword:     lengthinbytes:=4;
             fdword:    lengthinbytes:=8;
             fqword:    lengthinbytes:=16;
             else       lengthinbytes:=0;
             end
        else lengthinbytes:= lengthinbytes(format and 7)*
                             (format div fvecmult);
     end;
     function formatincludes(general,specific:integer):boolean;
     begin
          if verbose
          then writeln('does format ',general,' include ',specific);
          if general = specific
          then formatincludes:=true
          else
           if (general and specific and fref)<>0
           then { both are ref types check if the referants are the same }
                formatincludes:=
                  formatincludes( general - fref,specific - fref)
           else
            if general <= fqword    { general is untyped }
            then formatincludes := lengthinbytes(general)=lengthinbytes(specific)
            else formatincludes := false
     end;
     function decast(n:pilcgnode):pilcgnode;
     begin
          if n=nil
          then decast:=n
          else
           if n^.tag <> typecast
           then decast:=n
            else decast:= n^.arg2
     end;
     procedure getcheckpoint(var b:rollbackbuffer; var p:checkpoint);
     begin
          p.mark:=getmark(b);
          p.reserved:=reservations;
     end;
     procedure setcheckpoint(var b:rollbackbuffer; var p:checkpoint);
     begin
          setmark(b,p.mark);
          reservations:=p.reserved;
     end;
     function label2str(l:pilcgnode):string;
     var s:string;
     begin
          str(l^.index,s);
          label2str:='l'+s;
     end;


     function match(m:pilcgnode;var b:rollbackbuffer):boolean;
     (*! This is the master matching routine in the code generator
         it matches the tree n against the instructionset until
         it gets a resolution, or if it fails returns false *)
     type
          evalcontext=(lhs,rhs); { only in rhs context can we load regs }

         function patternmatch(context:evalcontext;n:pilcgnode; p:pattern;var s :string):boolean;
         (*! This attempts to match n against p, returns result in s *)
               var
             paramresults:array[paramref] of string;
             paramsbound:array[paramref] of boolean;
             paramsources:array[paramref] of pilcgnode;
             mark:checkpoint;

             pno:integer;

           function regload(r, src:pilcgnode):boolean;
           (*! attemps to load register  r with the
               expression indicated by src.
               It will only work in rhs context *)
           var
              load:pilcgnode;
           begin
             if verbose 
             then begin
                  writeln('attempt to load ',registers[r.index].printsas,' reserved=', reserved(r.index));
             end;
             if (context=rhs)
                and
                formatincludes(formatderef(registers[r^.index].format),getformat(src))
                and
                not reserved(r^.index)
             then  begin
                     new(load);
                     load^.tag:=Assignop;
                     load^.src:=src;
                     load^.dest:=r;
                     if  (m^.tag=assignop )
                         and
                         (m^.dest^.tag=reg)
                         and
                         binarymatch(src,m^.src)
                     then  regload:=false   { we are recursing }
                     else
                     if match(load,b)
                     then begin
                            reserve(r^.index);
                            regload:=true
                          end
                     else regload:=false;
                     dispose(load);
                   end
             else regload:=false
           end;
           procedure print2str(p:pprintlist);
           (*! this evaluates the assembler output in the
               context of the parameter bindings
           *)
           begin
                if p<> nil
                then with p^ do begin
                   if literal=printchar
                   then s:=s+litval
                   else s:=s+paramresults[index];
                   print2str(next);
                end
           end;
           { match n against all aternatives in range j..k}
           function matchalt(n:pilcgnode;j,k:integer):boolean;
           var i,d:integer;  ok:boolean;
           label 1;
           begin
               ok:=false;
               for i:= j to k do begin
                   getcheckpoint(b,mark);
                   begin
                        if patternmatch(context,n,alternatives[i]^,s)
                        then begin
                             ok:=true;
                             goto 1;
                             end  ;
                   end          ;
                   setcheckpoint(b,mark);
               end;
               1:matchalt:=ok;
           end;

          function getformat(n:pilcgnode):integer;
          { inner version of getformat which can
            evaluate the format of bound parameters }
          begin
           if n=nil then getformat:=fvoid
              else
              with n^ do
              case tag of
                reallit,
                intlit: getformat:=litformat     ;
                monad:  getformat:=typeoffunc(fn,getformat(arg));
                deref:  getformat:=getformat(arg) and not fref;
                format: getformat:=formatarg;
                ref:    getformat:=getformat(arg) or fref;
                dyad:   getformat:=typeofop(fn,getformat(arg),getformat(arg2));
                constant,
                typecast:getformat:=getformat(arg);
                param   : if paramsbound[index]
                          then getformat:=getformat(paramsources[index])
                          else getformat:=fvoid;
                labelnode:getformat:=faddr;
                memref: getformat:=getformat(arg2);
                reg:    getformat:=REGISTERS[N^.INDEX].format;
            else  getformat:=fvoid;
            end;
           end;  {of getformat}

           function binarymatch(src,template:pilcgnode):boolean;
           (*! This attempts to match the source against the template
               within the context of the parameter bindings above
           *)

             function typecompatible(template,src:pilcgnode):boolean;
             var st:integer;
             begin
                  if verbose then
                  begin
                       printtree(template,output);
                       if template^.tag=param then
                       begin
                            if paramsbound[template^.index]
                            then write(':',getformat(template));
                       end;
                       write(' typecompatible to ');
                       printtree(src,output);
                       writeln;
                  end;
                 st:=getformat(src);
                 case template^.tag of
                 ref:
                     if (st and fref) =0
                     then typecompatible := false
                     else typecompatible := typecompatible(template^.arg,new_deref(src));
                 param:
                       if paramsbound[template^.index]
                       then typecompatible:=formatincludes(getformat(template),st)
                       else
                        typecompatible:= binarymatch(src,template) ;

                 else typecompatible:=formatincludes(getformat(template),st)
                 end

             end;
           var tempnode:pilcgnode; i:integer; ok:boolean;
               saved:evalcontext;
               parampat:pattern;z:integer;
           label 101;
           begin
                if src=template then binarymatch:=true
                else if src=nil
                then binarymatch := template=nil
                else
                 if template=nil

                 then binarymatch:=false
                 else
                  if (src^.tag = typecast) and (src^.tag<>template^.tag)
                  then binarymatch:=binarymatch(decast(src),template)
                  else  begin
                    if verbose then begin
                        for z:=0 to recursiondepth do write(' ');
                        printtree(template,output);
                        write(' binary match to ');
                        printtree(src,output);
                        writeln;
                    end;
                  case template^.tag of
                  deref:    if template^.arg=nil then binarymatch:=false
                            else
                            if decast (template^.arg)^.tag=param
                              { we have a candidate for  filling a register   }
                              then  begin
                               if src^.tag=deref
                               then begin
                                    if binarymatch(src^.arg,template^.arg)
                                    then binarymatch:=true
                                    else binarymatch:= binarymatch(src,decast(template^.arg))
                               end
                               else binarymatch:=binarymatch(src,template^.arg);
                              end
                              else  if src^.tag<>deref
                              then binarymatch:=false
                              else binarymatch:=binarymatch(src^.arg,template^.arg);
                  memref:
                              if src^.tag<> template^.tag
                              then begin

                                   binarymatch:=false
                                   end
                              else begin
                                   { when evaluateing a memref we can load
                                     registers to get the address
                                     thus we indicate we are in rhs context
                                     }
                                   saved:=context;
                                   context:=rhs;
                                   ok:=binarymatch(src^.arg,template^.arg);
                                   context:=saved;
                                   binarymatch:=ok;
                              end ;


                  failure:
                              if src^.tag<> template^.tag
                              then binarymatch:=false
                              else binarymatch:=binarymatch(src^.arg,template^.arg);

                  reallit:    if src^.tag<> reallit
                              then binarymatch:=false
                              else binarymatch:=src^.reallitarg=template^.reallitarg;

                  intlit:     if src^.tag<> intlit
                              then binarymatch:=false
                              else binarymatch:=src^.intlitarg=template^.intlitarg;

                  format:     if src^.tag<> format
                              then binarymatch:=typecompatible(template,src)
                              else binarymatch:=formatincludes(template^.formatarg,src^.formatarg);

                  typevar,
                  unboundformat:binarymatch:= true
                                              or (
                                              (src^.tag=deref) and
                                              (src^.arg^.tag=format))
                                              ;

                  ref:        if (getformat(src)and fref)<>fref
                              then binarymatch:=false
                              else begin
                                new(tempnode);
                                tempnode^.tag:=format;
                                tempnode^.formatarg:= getformat(src) and not fref;
                                binarymatch:=binarymatch(tempnode,template^.arg) ;
                                dispose(tempnode);
                              end  ;
                  location:   if src^.tag<>location
                              then binarymatch:=false
                              else
                                binarymatch:=binarymatch(src^.locvalue,template^.locvalue);
                  gotonode:   if src^.tag<>gotonode
                              then binarymatch:=false
                              else binarymatch:= binarymatch(src^.dest,template^.dest);

                  patterntag: if src^.tag<>patterntag
                              then
                                  binarymatch:=patternmatch(context,src,template^.pat^,bitbucket)
                              else
                                  binarymatch:=binarymatch(src^.pat^.meaning,template^.pat^.meaning);
                  Assignop:     if src^.tag<> Assignop
                              then binarymatch:=false
                              else begin
                                   context:=lhs;
                                   if binarymatch(src^.dest,template^.dest)
                                   then begin
                                        context:=rhs;
                                        binarymatch:=binarymatch(src^.src,template^.src);
                                   end
                                   else binarymatch:=false
                              end  ;

                  forloop:    if src^.tag<>forloop
                              then binarymatch:=false
                              else with template^ do
                                   if not binarymatch(src^.indexvar,  indexvar)
                                   then binarymatch:=false
                                   else if not binarymatch(src^.start,start)
                                   then binarymatch:=false
                                   else if not binarymatch(src^.stop,stop)
                                   then binarymatch:=false
                                   else if not binarymatch(src^.incr,incr)
                                   then binarymatch:=false
                                   else binarymatch:=binarymatch(src^.loopaction,loopaction);
                  regstack:        binarymatch:=(template^.tag=src^.tag)
                                                and
                                                (template^.stackdetails.printsas= src^.stackdetails.printsas);
                  monad:

                                   if
                                      (template^.fn^.opname=ilcppop)
                                   then begin
                                        if (src^.tag=monad) and (src^.fn.opname=ilcppop)
                                        then goto 101;
                                        { try to push the src onto the stack }
                                        { so the instruction can pop it }
                                             new(tempnode);
                                             tempnode^.tag:=dyad;
                                             new(tempnode^.fn);
                                             tempnode^.fn^.tag:=monop;
                                             tempnode^.fn^.opname:=ilcppush;
                                             tempnode^.arg:=template^.arg;
                                             tempnode^.arg2:=src;
                                             binarymatch:=match(tempnode,b);
                                             dispose(tempnode^.fn);
                                             dispose(tempnode);
                                        end
                                   else
                                   101:
                                   if src^.tag<> template^.tag
                                   then binarymatch:=false
                                   else
                                   if not binarymatch(src^.fn,template^.fn)
                                   then binarymatch:=false
                                   else if not binarymatch(src^.arg,template^.arg)
                                   then binarymatch:=false
                                   else binarymatch:=true;

                  dyad:       if src^.tag<> template^.tag
                              then
                                   binarymatch:=false

                              else

                                   if not binarymatch(src^.fn,template^.fn)
                                   then binarymatch:=false
                                   else if not binarymatch(src^.arg,template^.arg)
                                   then binarymatch:=false
                                   else
                                    binarymatch:=binarymatch(src^.arg2,template^.arg2);



                  ifnode:     if src^.tag<> ifnode
                              then binarymatch:=false
                              else
                              begin
                                   context:=rhs;
                                   if not binarymatch(src^.condition,template^.condition)
                                   then binarymatch:=false
                                   else if not binarymatch(src^.action,template^.action)
                                   then binarymatch:=false
                                   else binarymatch:=binarymatch(src^.alternative,template^.alternative);
                              end      ;

                  sequence:   if src^.tag<> sequence
                              then binarymatch:=false
                              else if not binarymatch(src^.current,template^.current)
                              then binarymatch:=false
                              else binarymatch:=binarymatch(src^.next,template^.next);

                  alternation:binarymatch:= matchalt(src,template^.first,template^.last);


                  dyadicop,
                  monop:      binarymatch:=src^.opname=template^.opname;

                  typecast:   if typecompatible(template^.arg,src)
                              then binarymatch:=binarymatch(src,template^.arg2)
                              else binarymatch:=false;

                  constant:   begin
                                   { we match the type of the source against
                                     the input and then check that the source
                                     is a literal
                                   }
                                   new(tempnode);
                                   tempnode^.tag:=format;
                                   tempnode^.formatarg:=getformat(src);
                                   ok:=binarymatch(tempnode,template^.arg);
                                   dispose(tempnode);
                                   if ok
                                   then begin
                                      tempnode:=decast(src);
                                      if (tempnode<>nil)
                                         and
                                         (template^.arg<>nil)
                                         and
                                         (template^.arg^.tag=param )
                                      then begin
                                        i:=template^.arg^.index;
                                        paramsbound[i]:=true;
                                        paramsources[i]:=src;
                                        if tempnode^.tag=intlit
                                        then begin
                                             binarymatch:=true;
                                             str(tempnode^.intlitarg,paramresults[i])
                                        end
                                        else if tempnode^.tag=reallit
                                        then begin
                                             binarymatch:=true;
                                             str(tempnode^.reallitarg,paramresults[i])
                                        end
                                        else binarymatch:=false
                                      end
                                      else binarymatch:=false
                                   end
                                   else binarymatch:=false
                              end;

                  param:      if not paramsbound[template^.index]
                              then begin    { attempt to bind the parameter }

                                parampat:=p;
                                 parampat:= parampat.params^[template^.index]^;
                                 ok:=patternmatch(context,src,p.params^[template^.index]^,paramresults[template^.index]);

                                 if ok then begin
                                    binarymatch:=true;
                                    paramsources[template^.index]:=src;
                                    paramsbound[template^.index]:=true;
                                 end
                                 else binarymatch:=false;
                              end
                              else  { already bound must be identical }
                                 binarymatch:=binarymatch(src, paramsources[template^.index]);

                  reg:        if src^.tag =reg
                              then binarymatch:=src^.index=template^.index
                              else binarymatch:=regload(template,src);

                  labelnode  :if src^.tag = labelnode
                              then begin
                                   s:=label2str(src);
                                   binarymatch:=true;
                              end
                              else
                              if src^.tag = extlabel
                              then begin
                                   s:=src^.opname;
                                   binarymatch:=true;
                              end
                              else binarymatch:=false;

                  else        begin { default unhandled case }
                                    if verbose
                                    then writeln('failure in binary match template tag=',ord(template^.tag));
                                    binarymatch:=false;
                              end
                  end
                  end
           end;

         var z:integer; printed:boolean;
         begin    { patternmatch }
            for pno:=0 to maxparam do paramsbound[pno]:=false;
            getcheckpoint(b,mark);   { make this atomic }
            s:='';
            recursiondepth:=recursiondepth+1;
             if verbose
                   then begin
                        for z:=0 to recursiondepth do write(' ');
                        printtree(p.meaning,output);
                        write(' to ');
                        printtree(N,output);
                        writeln;
                   end;
            if (recursiondepth<recmax)
               and
               binarymatch(n,p.meaning)
            then begin
                 print2Str(p.matchedassembler);
                 patternmatch:=true;
                 if verbose
                 then begin
                   printed:=false;
                   for z:= 0 to maxparam do printed:=printed or paramsbound[z];


                   for z:=0 to recursiondepth do write(' ');
                   for z:= 0 to maxparam do if paramsbound[z] then
                     write('param [',z,']=',paramresults[z]);


                   writeln('->',s);
                 end   ;
            end
            else begin
                 setcheckpoint(b,mark);
                 patternmatch:=false;
            end;
            recursiondepth:=recursiondepth-1;
         end;    {pattern match}
         function instructionmatch(n:pilcgnode):boolean ;
         (*! this attempts to match n against each instruction in turn
             in the instructionset *)
         var i:integer;ok:boolean;s2:string; mark:checkpoint;
             oldreservations:reservationcode;
         label 1;
         begin
              ok:=false;
              { an instruction that is generated should not in itself
                affect the reservation status of the registers
                so save and restore the reservation status
              }
              oldreservations:=reservations;
              if verbose
              then begin
                   printtree(n,output);
                   writeln;
              end;
              for i:=0 to lastinstruction do
              begin
                   if verbose
                   then writeln(' try instr ',i);
                   getcheckpoint(b,mark);
                   if patternmatch(lhs,n,instructionsetorder[i]^,s2)
                   then begin
                      ok:=true;
                      appendstr(b,s2+'\n');
                      goto 1;
                   end  ;
                   setcheckpoint(b,mark);
              end;
              1:instructionmatch:=ok;
              reservations:=oldreservations;
         end;  {instruction match}
     var t1:boolean;
         mark:checkpoint;
         r1:integer;
         n1,r,quotient,remainder:pilcgnode;
     begin
          if verbose
          then
          begin
               write(output, 'match');
               printtree(m,output);
          end;
          if m=nil then match:=true
          else
          with m^ do begin
            t1:=false;
            getcheckpoint(b,mark);  { make this an atomic transaction }
            case tag of
            procedurenode:
                          begin
                               procedureentrycode(m,b);
                               t1:=match(m^.procedurebody,b);
                               procedureexitcode(m,b);
                          end;
                sequence:{ for a sequence match all terms in sequence }
                              if match(current,b)
                              then t1:=match(next,b)
                              else t1:=false;

                forloop:      if instructionmatch(m)
                              then t1:=true
                              else begin
                                   r1:=findfreereg(getformat(m^.indexvar)) ;
                                   if innerloop(m)
                                      and
                                      (r1>=0 )
                                   then begin
                                        reserve(r1);
                                        t1:=false;
                                        r:=new_register(r1);
                                        n1:=substituteAwithBinC(m^.indexvar,r,m);
                                        if vectorisable (n1)
                                        then begin
                                             vectoriseloop( getparallelism(n1),
                                                        n1,
                                                        quotient,
                                                        remainder);
                                             if match(simplify(unroll(quotient)),b)
                                             then t1:=
                                                 match(simplify(remainder),b)
                                             else t1:=false;
                                        end;
                                        if verbose
                                        then printtree(n1,output);
                                        if not t1
                                        then
                                         if not m^.simple
                                         then t1:= match(simplify(n1),b)
                                          else t1:=false;
                                        dispose(r);
                                        unreserve(r1);
                                   end ;
                                   if not t1
                                   then
                                     if not m^.simple
                                     then t1:= match(simplify(m),b)
                                     else t1:=false;
                              end ;

                ifnode:{ for a control statement attempt to match
                         it directly against the instructionset which
                         may work for some instructions, otherwise
                         attempt to simplify the control statement
                        }
                              if instructionmatch(m)
                              then t1:=true
                              else begin
                                  replacesubscripts(m^ .condition);
                                   if not m^.simple
                                   then t1:= match(simplify(m),b)
                                   else t1:=false;
                              end;

                reallit,
                intlit,
                monad,
                dyad,
    		failure,
    		Assignop,
    		gotonode,
                extlabel,
                location,
                labelnode: { for a statement attempt to match against the
                            entire instructionset }
                            begin
                            replacesubscripts(m);
			    if (tag=dyad) and (m^.fn^.opname=ilcpcall)
			    then t1:=procedurecallcode(m,b)
			    else
                            t1:= instructionmatch(m);
                            end  ;
                deref,
                format,
                unboundformat,        { this will match any format }
                ref,
                patterntag,
    		typevar,
                memref,
                dyadicop,
                alternation,
                monop,

                typecast,
                constant,
                param,
                reg: t1:=false; { not allowed at the top level }
            else begin
                   if verbose
                   then writeln('could not match node of type ',ord(tag));
                   t1:=false;
                 end
            end;
            if not t1 then setcheckpoint(b,mark);
            match:=t1;
          end;

     end;

     function binarymatch(src,template:pilcgnode):boolean;
           (*! This attempts to match the source against the template
               this is an unparameterised version that
               does not generate any code as it does so
           *)

             function typecompatible(template,src:pilcgnode):boolean;
             var st:integer;
             begin
                 st:=getformat(src);
                 case template^.tag of
                 ref:
                     if (st and fref) =0
                     then typecompatible := false
                     else typecompatible := typecompatible(template^.arg,new_deref(src));
                 param: typecompatible:=false;

                 else typecompatible:=formatincludes(getformat(template),st)
                 end

             end;
           var tempnode:pilcgnode; i:integer; ok:boolean;


           begin
                if src=template then binarymatch:=true
                else if src=nil
                then binarymatch := template=nil
                else
                 if template=nil

                 then binarymatch:=false
                 else
                  if (src^.tag = typecast) and (src^.tag<>template^.tag)
                  then binarymatch:=binarymatch(decast(src),template)
                  else case template^.tag of
                  deref:      if decast (template^.arg)^.tag=param
                              { we have a candidate for  filling a register   }
                              then  begin
                               if src^.tag=deref
                               then if binarymatch(src^.arg,template^.arg)
                               then binarymatch:=true
                               else if binarymatch(src,decast(template^.arg))
                               then binarymatch:=true
                               else if src^.tag<>deref
                               then binarymatch:=false
                               else binarymatch:=binarymatch(src^.arg,template^.arg);
                              end
                              else  if src^.tag<>deref
                              then binarymatch:=false
                              else binarymatch:=binarymatch(src^.arg,template^.arg);
                  memref,
                  failure:
                              if src^.tag<> template^.tag
                              then binarymatch:=false
                              else if template^.tag= memref
                              then begin
                                   { when evaluateing a memref we can load
                                     registers to get the address
                                     thus we indicate we are in rhs context
                                     }


                                   ok:=binarymatch(src^.arg,template^.arg);


                                   binarymatch:=ok;
                              end
                              else binarymatch:=binarymatch(src^.arg,template^.arg);

                  reallit:    if src^.tag<> reallit
                              then binarymatch:=false
                              else binarymatch:=src^.reallitarg=template^.reallitarg;

                  intlit:     if src^.tag<> intlit
                              then binarymatch:=false
                              else binarymatch:=src^.intlitarg=template^.intlitarg;

                  format:     if src^.tag<> format
                              then binarymatch:=typecompatible(template,src)
                              else binarymatch:=formatincludes(template^.formatarg,src^.formatarg);

                  typevar,
                  unboundformat:binarymatch:= true
                                              or (
                                              (src^.tag=deref) and
                                              (src^.arg^.tag=format))
                                              ;

                  ref:        if (getformat(src)and fref)<>fref
                              then binarymatch:=false
                              else begin
                                new(tempnode);
                                tempnode^.tag:=format;
                                tempnode^.formatarg:= getformat(src) and not fref;
                                binarymatch:=binarymatch(tempnode,template^.arg) ;
                                dispose(tempnode);
                              end  ;
                  location:   if src^.tag<>location
                              then binarymatch:=false
                              else
                                binarymatch:=binarymatch(src^.locvalue,template^.locvalue);
      gotonode:   if src^.tag<>gotonode
                              then binarymatch:=false
                              else binarymatch:= binarymatch(src^.dest,template^.dest);

                  patterntag: if src^.tag<>patterntag
                              then
                                  binarymatch:=false
                              else
                                  binarymatch:=binarymatch(src^.pat^.meaning,template^.pat^.meaning);
      Assignop:     if src^.tag<> Assignop
                              then binarymatch:=false
                              else begin

                                   if binarymatch(src^.dest,template^.dest)
                                   then begin

                                        binarymatch:=binarymatch(src^.src,template^.src);
                                   end
                                   else binarymatch:=false
                              end  ;

                  forloop:    if src^.tag<>forloop
                              then binarymatch:=false
                              else with template^ do
                                   if not binarymatch(src^.indexvar,  indexvar)
                                   then binarymatch:=false
                                   else if not binarymatch(src^.start,start)
                                   then binarymatch:=false
                                   else if not binarymatch(src^.stop,stop)
                                   then binarymatch:=false
                                   else if not binarymatch(src^.incr,incr)
                                   then binarymatch:=false
                                   else binarymatch:=binarymatch(src^.loopaction,loopaction);
                  regstack:        binarymatch:=(template^.tag=src^.tag)
                                                and
                                                (template^.stackdetails.printsas= src^.stackdetails.printsas);
                  monad:


                                   if src^.tag<> template^.tag
                                   then binarymatch:=false
                                   else
                                   if not binarymatch(src^.fn,template^.fn)
                                   then binarymatch:=false
                                   else if not binarymatch(src^.arg,template^.arg)
                                   then binarymatch:=false
                                   else binarymatch:=true;

                  dyad:       if src^.tag<> template^.tag
                              then binarymatch:=false
                              else

                                   if not binarymatch(src^.fn,template^.fn)
                                   then binarymatch:=false
                                   else if not binarymatch(src^.arg,template^.arg)
                                   then binarymatch:=false
                                   else
                                    binarymatch:=binarymatch(src^.arg2,template^.arg2);



                  ifnode:     if src^.tag<> ifnode
                              then binarymatch:=false
                              else
                                   if not binarymatch(src^.condition,template^.condition)
                                   then binarymatch:=false
                                   else if not binarymatch(src^.action,template^.action)
                                   then binarymatch:=false
                                   else binarymatch:=binarymatch(src^.alternative,template^.alternative);

                  sequence:   if src^.tag<> sequence
                              then binarymatch:=false
                              else if not binarymatch(src^.current,template^.current)
                              then binarymatch:=false
                              else binarymatch:=binarymatch(src^.next,template^.next);


                  alternation:binarymatch:= (src^.tag=alternation )

                                            and
                                            (template^.first=src^.first);


                  dyadicop,
                  monop:      binarymatch:=src^.opname=template^.opname;

                  typecast:   if typecompatible(template^.arg,src)
                              then binarymatch:=binarymatch(src,template^.arg2)
                              else binarymatch:=false;

                  constant:   begin
                                   { we match the type of the source against
                                     the input and then check that the source
                                     is a literal
                                   }
                                   new(tempnode);
                                   tempnode^.tag:=format;
                                   tempnode^.formatarg:=getformat(src);
                                   ok:=binarymatch(tempnode,template^.arg);
                                   dispose(tempnode);
                                   binarymatch:=ok
                              end;

                  param:      binarymatch:=false;
                  reg:        if src^.tag =reg
                              then binarymatch:=src^.index=template^.index
                              else binarymatch:=false;
                  arraysubscript:
                             binarymatch:=binarymatch(src^.base,template^.base)
                                          and
                                          binarymatch(src^.offset,template^.offset);
                  labelnode  :if (src^.tag = labelnode)or(src^.tag = extlabel)
                              then begin

                                   binarymatch:=true;
                              end
                              else binarymatch:=false;

                  else        begin { default unhandled case }
                                    if verbose
                                    then writeln('failure in binary match template tag=',ord(template^.tag));
                                    binarymatch:=false;
                              end
                  end
           end;

           var substarg,subsrep:pilcgnode;
      procedure subs(var p:pilcgnode);
             begin
                  if binarymatch(substarg,p)
                  then p:=subsrep;
             end;
      Function substituteAwithBinC(A,B:pilcgnode;C:pilcgnode):pilcgnode;
           var x:pilcgnode;
           begin
                substarg:=A;subsrep:=B;
                x:=c;
                modify(x,subs);
                substituteAwithBinC:=x;
           end;
     {  masks out all vector information from a type }
     function getbaseformat(f:integer):integer;
     begin
      getbaseformat:= (f and 255) and (not fvector);
     end;
      { get the format code for an expression }
     function getformat(n:pilcgnode):integer;
     begin
      if n=nil then getformat:=fvoid
          else
          with n^ do
            case tag of
                reallit,
                intlit: getformat:=litformat     ;
                monad:  getformat:=typeoffunc(fn,getformat(arg));

                deref:  getformat:=getformat(arg) and not fref;

                format: getformat:=formatarg;
                ref:    getformat:=getformat(arg) or fref;
                dyad:   getformat:=typeofop(fn,getformat(arg),getformat(arg2));
                constant,
                typecast:getformat:=getformat(arg);
                arraysubscript:getformat:= elementformat;
                memref: getformat:=getformat(arg2);
                reg:    with registers[index] do getformat:=format;
            else  getformat:=fvoid;
            end;
     end;

     procedure printassmspec(p:pprintlist;var f:text);

           (*! this writes out the
               assembler spec of an instruction

           *)
           begin
                if p<> nil
                then begin
                   case p^.literal of
                    printchar: write(f,p^.litval)      ;
                    printparam: write(f,'#',p^.index:0)  ;
                    else write(f,' illegal node ');
                   end;
                   printassmspec(p^.next,f);
                end
           end;

     procedure printtree(n:Pilcgnode; var f:text);
     begin
      if n= nil then   write(f,'NIL')
      else
       with n^ do
        case tag of
    procedurenode: begin write(f,'proc ');printtree(procedurebody,f);end;
                param:   write(f,'#',index:0);
                alternation: write(f,'[',first,'..',last,']');
                monop,
                dyadicop:write(f,opname);
                reallit: write (f, reallitarg,':',litformat);
                intlit:  write (f, intlitarg,':',litformat);
                monad:   begin
                           printtree(fn,f);
                           write(f,'(');
                           printtree(arg,f);
                           write(f,')');
                         end;

                deref:   begin

                            write(f,'^(');
                            printtree( arg,f);
                            write(f,')');
                         end;
                memref: begin
                         write(f,'mem(');
                         printtree(arg,f);
                         write(f,'):');
                        { printtree(arg2,f);      }
                        end;
                format: write(f,'format(',formatarg,')');
                ref:    begin
                             write(f,'ref ');
                             printtree(arg,f) ;
                        end;
                gotonode: begin
                               write(f,'goto ');
                               printtree(dest,f);
                          end;
                labelnode:    write(f,'l',index:0);
                extlabel: begin write(f,opname ); end;
                arraysubscript: begin

                                     printtree(base,f);
                                     write(f,'[');
                                     printtree(offset,f);
                                     write(f,']');
                                end;

                dyad:   begin
       printtree(fn,  f);
                         write(f,'(':0);
                         printtree(arg,f);
                         write(f, ' ':0);

                         write(f,',');
                         printtree(arg2,f);
                         write(f,')');
                        end;
                constant: begin
                           write(f,'const ');
                           printtree(arg,f);
                          end;
                regstack: write(f,stackdetails.printsas);
                location: begin
                               write(f,'loc ');
                               printtree(locvalue,f);
                          end;
                typecast: begin
                           write(f,'(');
                           printtree(arg,f);
                           write(f,')');
                           printtree(arg2,f);
                          end;
                patterntag: begin
                                 write(f,'pat ');
                                 printtree(pat^.meaning,f);
                            end;
                reg:    with registers[index] do
                           write(f,printsas,':',getformat(n));
                assignop:begin
                          printtree(dest,f);
                          write(f,' := ');
                          printtree(src,f);
                         end     ;
                sequence:begin
                              writeln(f,'seq(');
                              printtree( current,f);
                              writeln(f,',');
                              printtree(next,f);
                              writeln(f,')');

                         end;
                forloop:begin
                              write(f,'for ');
                              printtree(indexvar,f);
                              write(f,':=');
                              printtree(start,f);
                              write(f,' to ');
                              printtree(stop,f);
                              write(f,' step ');
                              printtree(incr,f);
                              writeln(f,' do');
                              printtree(loopaction,f);
                              writeln(f,' od');
                          end;
                ifnode:begin
                            write(f,'if ');
                            printtree(condition,f);
                            writeln(f);
                            write(f,'then ');
                            printtree(action,f);
                            writeln(f);
                            write(f,'else ');
                            printtree(alternative,f);
                            writeln(f);
                            write(f,'fi');
                       end;
            else write(f, 'tag ',ord(tag));
            end;
     end;

     function codegen(n:pilcgnode; var assemblerfile:text):boolean;
     var b:rollbackbuffer;
     begin
          recursiondepth:=0;
          initbuf(b, rollbacksize);
          if match(n,b) then begin
             writerollback(b,assemblerfile);
             codegen:=true;
          end else codegen:=false;
          freebuf(b);
     end;


     function string2printlist(s:String ):pprintlist;
     var s2:string; p:pprintlist;i:integer;
     begin
  if length(s)=0 then string2printlist:=nil
        else begin
    new(p);
                p^.literal:=printchar;
    p^.litval:=s[1];
    s2:='';
    for i:=2 to length(s) do s2:=s2+s[i];
                p^.next:=string2printlist(s2);
    string2printlist:=p;
        end
     end;
     procedure pappends(var l:pprintlist; s:string);
       procedure recurse(var l:pprintlist);
       begin
            if l=nil
            then l:=string2printlist(s)
            else recurse(l^.next);
       end;
     begin
          recurse(l);
     end;
     procedure pappendp(var l:pprintlist; i:integer);
       procedure recurse(var l:pprintlist);
       begin
            if l=nil
            then begin
               new(l);
               l^.next:=nil;
               l^.literal:=printparam;
               l^.index:=i;
            end
            else recurse(l^.next);
       end;
     begin
          recurse(l);
     end;

function typeparam:ppattern;
     var myrec:ppattern;
     begin
  new(myrec);
  with myrec^ do begin
    paramcount :=0;
    matchedassembler:=nil;
    new(meaning);
    meaning^.tag:=typevar;
  end;
  typeparam:=myrec;
     end;

                                                   {
     function lookupreg(l:pregister;var s:string):pilcgnode;
     var myrec:pilcgnode;
     begin
  if l=nil then lookupreg=nil
        else if reglist^.name =s then
        begin
    new(myrec);
    myrec^.tag:=reg;
    myrec^.index:=l^.index;
    lookupreg:=myrec
        end
        else lookupreg:= lookupreg(l^.next,s)  ;

     end;                                           }


  function buildparamref(i:integer):pilcgnode;
  var myrec:pilcgnode;
  begin
    new(myrec);
    myrec^.tag:=param;
    myrec^.index:=i;
    buildparamref:=myrec;
  end;
  function findproc( name:string):pilcgnode;
  var p:pilcgnode;
  label 99;
  begin
	p:=proclist;
	
	while p<> nil do
	begin
		if p^.current^.startlab^.opname=name
		then begin
			findproc:=p^.current;
			goto 99;
		end;
		p:=p^.next;	
	end;
	findproc:=nil;
	99:
  end; 
  function dummycall(p:pilcgnode;var b:rollbackbuffer):boolean;
        var theproc:pilcgnode;
	begin
		writeln('dummy call ');
	     appendstr(b,'\n');
	     theproc:=findproc(p^.arg^.opname);
	     if theproc<> nil then
             begin
	      	appendstr(b,'call '+theproc^.startlab^.opname+'\n');
	     	dummycall:=true;
	     end
	     else dummycall:=false;
        end;
  function dummyentry(p:pilcgnode;var b:rollbackbuffer):boolean;
        begin
	     appendstr(b,'\n');
	     if p^.startlab^.tag= extlabel
	     then appendstr(b,p^.startlab^.opname+':');
             appendstr(b,'enter 0,0\n');
	     dummyentry:=true;
        end;
  function dummyleave(p:pilcgnode;var b:rollbackbuffer):boolean;
        begin
            appendstr(b,'leave\nret \n');
	    dummyleave:=true;	
        end;
  function new_op(s:string;t:nodeclass):pilcgnode;
  var p:pilcgnode;
     begin
          new(p);
          p^.tag:=t;

          p^.opname:=s;
          new_op:=p;
     end;

begin
  procedureentrycode:=dummyentry;
  procedureexitcode:=dummyleave;
  procedurecallcode:=dummycall;
  new(patlabel);
  patlabel_:=patlabel; { this version of the name is auto generated at times
                         as a synonym }
  with patlabel^ do begin
    new(meaning);
    meaning^.tag:=labelnode;
    paramcount:=0;
    matchedassembler:=nil;
    new(params);
  end;
  new(pattype_);
  with pattype_^ do begin
    new(meaning);
    meaning^.tag:=alternation;
    meaning^.first:=0;
    meaning^.last:=0;
    paramcount:=0;
    matchedassembler:=nil;
    new(params);
  end;
  labcount:=1;

  verbose:=false;
  {$ifdef debug}
   verbose:=true;
  {$endif}
     plus_:=new_op(ilcpplus,dyad);
   minus_ :=new_op(ilcpminus,dyad);
  exponentiate_:=new_op(ilcpexponentiate,dyad);
   times_ :=new_op(ilcptimes,dyad);
   divide_ :=new_op(ilcpdivide,dyad);
  replicate_:=new_op(ilcpreplicate,dyad);
   lt_:=new_op(ilcplt,dyad);
   gt_:=new_op(ilcpgt,dyad);
   call_:=new_op(ilcpcall,dyad);
  le_:=new_op(ilcpleq,dyad);
  ge_:=new_op(ilcpgeq,dyad);
  equals_:=new_op(ilcpeq,dyad);
  ne_:=new_op(ilcpneq,dyad);
  min_:=new_op(ilcpmin,dyad);
  max_:=new_op(ilcpmax,dyad);
  push_:=new_op(ilcppush,dyad);
  subscript_:=new_op(ilcpsubscript,dyad);
  satplus_:=new_op(ilcpsatplus,dyad);
  satmult_:=new_op(ilcpsatmult,dyad);
  satminus_:=new_op(ilcpsatminus,dyad);
  shl_:=new_op(ilcpshl,dyad);
  shr_:=new_op(ilcpshr,dyad);
        remainder_:=new_op(ilcpremainder,dyad);
        or_:=new_op(ilcpor,dyad);
        and_:=new_op(ilcpand,dyad);
        xor_:=new_op(ilcpxor,dyad);
        not_:=new_op(ilcpnot,monad);
  full_:=new_op(ilcpfull,monad);
  empty_:=new_op(ilcpempty,monad);
  pop_:=new_op(ilcppop,monad);
  sin_:=new_op(ilcpsin,monad);
  trunc_:=new_op(ilcptrunc,monad);
  round_:=new_op(ilcpround,monad);
  float_:=new_op(ilcpfloat,monad);
  extend_:=new_op(ilcpextend,monad);
  cos_:=new_op(ilcpcos,monad);
  tan_:=new_op(ilcptan,monad);
  abs_:=new_op(ilcpabs,monad);
  sqrt_:=new_op(ilcpsqrt,monad);
  ln_:=new_op(ilcpln,monad);
  proclist:=nil;
  procprefix:='_';
end.
