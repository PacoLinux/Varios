/* ilcggram.y yacc parser for ilcg */

%token
/*ABS*/ ABS_   
/*address*/ address_   
/*alias*/ alias_   
/*AND*/ AND_   
/*APPLY*/ call_   
calleepopsargs_
/*assembles*/ assembles_   
/*const*/ const_   
/*COS*/ COS_   
/*div*/ divide_   
/*do*/ do_   
/*doubleword*/ doubleword_   
/*EMPTY*/ EMPTY   
exported_
/*EXTEND*/ extend_   
/*fail*/ interrupt_   
/*flag*/ flag_   
/*FLOAT*/ FLOAT_   
/*for*/ for_   
/*FULL*/ FULL_   
/*function*/ function_   
/*goto*/ goto_   
/*halfword*/ halfword_   
/*ieee32*/ ieee32_   
/*ieee64*/ ieee64_   
/*if*/ if_
imported_   
/*instruction*/ instruction_   
/*instructionset*/ instructionset_   
/*int16*/ int16_   
/*int32*/ int32_   
/*int64*/ int64_   
/*int8*/ int8_   
/*label*/ label_
level_
lefttoright_   
/*LN*/ LN_   
/*location*/ loc_   
/*MAX*/ MAX_   
/*means*/ means_   
/*MIN*/ MIN_   
/*MOD*/ remainder_   
/*NOT*/ NOT_   
null_
/*octet*/ octet_   
/*operation*/ operation_   
/*OR*/ OR_   
/*pattern*/ pattern_   
/*pop*/ POP_   
/*precondition*/ precondition_   
/*procedure*/ instruction   
/*PUSH*/ PUSH_   
/*quadword*/ quadword_   
/*ref*/ ref_   
/*reg*/ register_   
/*rep*/ replicate_   
/*reserved*/ reserved_   
/*returns*/ returns   
/*ROUND*/ ROUND_   
seq_
/*sideeffect*/ sideeffect_   
/*SIN*/ SIN_   
/*SQRT*/ SQRT_   
/*stack*/ stack_   
/*step*/ step_   
/*SUBSCRIPT*/ SUBSCRIPT_   
/*tan*/ TAN_   
/*to*/ to_   
/*TRUNCATE*/ TRUNC_   
/*uint16*/ uint16_   
/*uint32*/ uint32_   
/*uint64*/ uint64_   
/*uint8*/ uint8_   
/*vector*/ vector_   
/*void*/ void_   
/*word*/ word_   
/*XOR*/ XOR_   
floating_constant
colon_
semicolon_
comma_
plus_
minus_
times_
satplus_
satminus_
map_
equals_
ne_
ge_
lt_
gt_
exponentiate_
store_
deref_
vbar_
sket_
sbra_
end_
typetoken_
mem_
string_
intlit_
identifier
le_
satmult_
shr_
shl_
dot_
bra_
ket_
program_
var_
begin_
end_
%start rununit
%%
 compilation_unit : mdesc|rununit;
 rununit:program_ snode  {$$:=($2);tree:=int2ilcg($$); 
				};
 
 execstatement: seq_ bra_ line snode comma_ snode ket_ 
			{$$:=ILCG2INT(NEW_SEQ(INT2ILCG($4),INT2ILCG($6)));
		(*	write(list,'(snode=');printtree(int2ilcg($4),list);
			write(list,'execstatement=');printtree(int2ilcg($6),list);
			writeln(list,')');*)
			}
	
	|                seq_ bra_ line sbra_ var_ value semicolon_ snode comma_ execstatement ket_
			{$$:=ILCG2INT(NEW_SEQ(INT2ILCG($8),INT2ILCG($10)));
			
                        };
line: optionalsign intlit_ colon_ { };
pblock :begin_ snode  end_ 	{	$$:=ILCG2INT(NEW_PROCEDURE(INT2ILCG($2),NIL));}
	;
proc1:  proc2 {$$:=$1; int2ilcg($$)^.exported:=false;}
	|exported_ proc2 {$$:=$2; int2ilcg($$)^.exported:=true;}
        ;
proc2   : proc3 {$$:=$1; int2ilcg($$)^.imported:=false;}
	|imported_ proc3 {$$:=$2; int2ilcg($$)^.imported:=true;}
        ;
proc3   : proc4 {$$:=$1; int2ilcg($$)^.lefttoright:=false;}
	|lefttoright_ proc4 {$$:=$2; int2ilcg($$)^.lefttoright:=true;}
        ;
proc4	: level_ number cartlist colon_ type pblock 
	{
		$$:=$6;
		int2ilcg($$)^.level:=int2ilcg($2)^.intlitarg;
		int2ilcg($$)^.paramtype:=int2ilcg($3);
		int2ilcg($$)^.returntype:=$5;
	}
	;
vlist	: {$$:= ilcg2int(nil);}
	| value 
	| value comma_ vlist {$$:=ilcg2int(new_seq(int2ilcg($1),int2ilcg($3)));}
	;
snode:  assign 
	| procname sbra_ vlist sket_ { $$:=ilcg2int(new_dyad(int2ilcg($1),ilcpcall,int2ilcg($3)));
					printtree(int2ilcg($$),output);
				}
	|null_	{$$:=ILCG2INT(NIL);} 
	|execstatement  
	|goto_ value	{$$:=ILCG2INT(NEW_GOTO(INT2ILCG($2)));}
	|fail_ value	{$$:=ILCG2INT(NEW_FAILURE(INT2ILCG($2)));}
	|lab
	|if_ bra_ value ket_ snode	{$$:=ILCG2INT(NEW_IF(INT2ILCG($3),INT2ILCG($5),(NIL)));}
	|if_ bra_ value ket_ snode else_ snode	{$$:=ILCG2INT(NEW_IF(INT2ILCG($3),INT2ILCG($5),INT2ILCG($7)));}
	|for_ refval store_ value to_ value step_ value do_ snode	{$$:=ILCG2INT(NEW_FOR(
									INT2ILCG($2),
									INT2ILCG($4),
									INT2ILCG($6),
									INT2ILCG($8),
									INT2ILCG($10)
									));}
	|location_ value    	{$$:=ILCG2INT(NEW_LOCATION(INT2ILCG($2)));}
	|instruction procname procname proc1{
			$$:=$4; 
			int2ilcg($$)^.startlab:=int2ilcg($2);
			int2ilcg($$)^.extname:=int2ilcg($3);
		(*	printtree(int2ilcg($$),list);*)
				}
	; 
 procname: identifier {$$:= ilcg2int(new_extlabel(theid));}
 lab : label_ identifier	{$$:=ILCG2INT(NEW_EXTLABEL(YYTEXT));};
 mdesc : statementlist instructionlist;
 instructionlist :instructionset sbra alternatives sket;
 
 format :octet_      	{$$:=((FOCTET));}
	|halfword_   	{$$:=((FHALFWORD));}
	|word_       	{$$:=((FWORD));}
	|doubleword_ 	{$$:=((FDOUBLEWORD));}
	|quadword_   	{$$:=((FQUADWORD));}
	|void_		{$$:= fvoid;}
	;
 
 
 reference :   ref_ type 	{$$:=FREF+$2;};
 array :  typeprim vector_ bra_ number ket_ 
          	{$$:=VECTOROF($1,II2I(INT2ILCG($4)^.INTLITARG));};
 aggregate: stack_ bra_ number ket_ 
	|array 
	|;
 predeclaredtype :    format
	|tformat ;
 typeprim:	typeid
	|predeclaredtype;
cartesians :  cartesian cartesians {$$:= ilcg2int(new_seq(new_format($1),int2ilcg($2)));}
	|        {$$:=ilcg2int(nil);};
type: 	predeclaredtype
	|	typeid
	|       array 
	|	reference
	|	
	bra_ type map_ type ket_;
 cartesian :  comma type {$$:=$2;};
 cartlist: sbra_ sket_ {$$:=ilcg2int(nil);}
	|	sbra_ type cartesians sket_ { $$:=ilcg2int(new_seq(new_format($2),int2ilcg($3)));}
	;
 tformat :  signed
	|unsigned
	|ieee32
	|ieee64;
 signed : int32_  	{$$:=((FINT32));} 
	|int8_  	{$$:=((FINT8));}
	|int16_ 	{$$:=((FINT16));}
	|int64_ 	{$$:=((FINT64));}
	;
 unsigned : uint32_ 	{$$:=((FUINT32));} 
	|uint8_   	{$$:=((FUINT8));}
	|uint16_  	{$$:=(FUINT16);}
	|uint64_  	{$$:=((FUINT64));}
	;
   
 
 value : 
 	rhs
	|	loc
	|	void_
	|	cartval
	|	dyadic bra_ value comma_ value ket_ 	{				 
					$$:=ILCG2INT(NEW_DYAD(
						INT2ILCG($3),
						INT2ILCG($1)^.OPNAME,
						INT2ILCG($5)
						));
						 
					}
	|monadic bra_ value ket_	{$$:=ILCG2INT(NEW_MONAD(
						INT2ILCG($1)^.OPNAME,
						INT2ILCG($3)
						));
					};
 cartval:sbra_ value carttails sket_;
 carttail : comma_ value;
 carttails: cartail cartails
	|;
condition: dyadic bra_ condition comma_ condition ket_	{$$:=ILCG2INT(NEW_DYAD(
						INT2ILCG($3),
						INT2ILCG($1)^.OPNAME,
						INT2ILCG($5)
						));}
	|	monadic bra_ condition ket_ 	{$$:=ILCG2INT(NEW_MONAD(
						INT2ILCG($1)^.OPNAME,
						INT2ILCG($3)
						));}
	|	identifier	{
					$$:=ilcg2int(new_extlabel(theid));
				 
					}
	|	number;
 rhs:	number
	|	bra_ type ket_ value	{$$:=ilcg2int(new_typecast($2,int2ilcg($4)));}
	|	const identifier 
	|	deref_  bra_  refval ket_	{$$:=ilcg2int(new_deref(int2ilcg($3)));};
 
 refval : loc 
	|	bra_ type ket_ loc	{$$:=ilcg2int(new_typecast($2,int2ilcg($4)));};
 loc : 	identifier			{
					$$:=ilcg2int(new_extlabel(theid));
				
					}
	|	mem_ bra_ value ket_ 	{$$:=ilcg2int(new_memref(int2ilcg($3),fvoid));};
 
predeclaredregister : fp_;
 number :   optionalsign reallit	{ $$:=ilcg2int(new_reallit(thenum*$1,fieee64));
					
					}
	|optionalsign intlit_	        { $$:=ilcg2int(new_intlit(thenum*$1,fint32));
					
					};
 optionalsign : {$$:=1;}
	|plus_	{$$:=1;}
	|minus_	{$$:=-1;};
 reallit: floating_constant;
dyadic  :  plus_ 	{$$:=ilcg2int(ilcp.plus_);}
	|	minus_ 	{$$:=ilcg2int(ilcp.minus_);}
	|	identifier{$$:=ilcg2int(new_op(yytext,dyad));}
	|	exponentiate_	{$$:=ilcg2int(ilcp.exponentiate_);}
	|	times_ 	{$$:=ilcg2int(ilcp.times_);}
	|	divide_ 	{$$:=ilcg2int(ilcp.divide_);}
	|	replicate_	{$$:=ilcg2int(ilcp.replicate_);}
	|	lt_	{$$:=ilcg2int(ilcp.lt_);}
	|	gt_	{$$:=ilcg2int(ilcp.gt_);}
	|	call_	{$$:=ilcg2int(ilcp.call_);}
	|	le_	{$$:=ilcg2int(ilcp.le_);}
	|	ge_	{$$:=ilcg2int(ilcp.ge_);}
	|	equals_	{$$:=ilcg2int(ilcp.equals_);}
	|	ne_	{$$:=ilcg2int(ilcp.ne_);}
	|	min_	{$$:=ilcg2int(ilcp.min_);}
	|	max_	{$$:=ilcg2int(ilcp.max_);}
	|	push_	{$$:=ilcg2int(ilcp.push_);}
	|	subscript_	{$$:=ilcg2int(ilcp.subscript_);}
	|	satplus_	{$$:=ilcg2int(ilcp.satplus_);}
	|	satmult_	{$$:=ilcg2int(ilcp.satmult_);}
	|	satminus_	{$$:=ilcg2int(ilcp.satminus_);}
	|	shl_	{$$:=ilcg2int(ilcp.shl_);}
	|	shr_	{$$:=ilcg2int(ilcp.shr_);}
	|remainder_	{$$:=ilcg2int(ilcp.remainder_);}
	|or_	{$$:=ilcg2int(ilcp.or_);}
	|and_	{$$:=ilcg2int(ilcp.and_);}
	|xor_	{$$:=ilcg2int(ilcp.xor_);};
monadic:not_		{$$:=ilcg2int(ilcp.not_);}
	|	full_		{$$:=ilcg2int(ilcp.full_);}
	|empty_		{$$:=ilcg2int(ilcp.empty_);}
	|pop_		{$$:=ilcg2int(ilcp.pop_);}
	|sin_		{$$:=ilcg2int(ilcp.sin_);}
	|trunc_		{$$:=ilcg2int(ilcp.trunc_);}
	|round_		{$$:=ilcg2int(ilcp.round_);}
	|float_		{$$:=ilcg2int(ilcp.float_);}
	|extend_		{$$:=ilcg2int(ilcp.extend_);}
	|cos_		{$$:=ilcg2int(ilcp.cos_);}
	|tan_		{$$:=ilcg2int(ilcp.tan_);}
	|abs_		{$$:=ilcg2int(ilcp.abs_);}
	|sqrt_ 		{$$:=ilcg2int(ilcp.sqrt_);}
	|ln_	{$$:=ilcg2int(ilcp.ln_);};
registerdecl: reservation register_ aggregate type identifier assembles_ sbra_ string sket_  ;
reservation : reserved
	|; 
aliasdecl :
	alias_ register_ aggregate type
          identifier equals_ identifier bra_ intlit colon intlit ket_
          assembles_ sbra_ string_ sket_;
	
opdecl : operation_ identifier means_ operator assembles_ sbra_ string_ sket_;
operator : 	plus_
	|		minus_
	|		times_
	|		lt_
	|		gt_
	|		min_
	|		max_
	|		shl_
	|		shr_
	|		le_
	|		ge_
	|		equals_
	|		ne_
	|		divide_
	|	remainder_
	|		or_
	|		and_
	|		xor_;
 
assign :  refval store_ value 	{$$:=ILCG2INT(NEW_ASSIGN(INT2ILCG($1),INT2ILCG($3)));
		 	} ;
meaning : value
	|	assign
	|	goto_ value
	|	fail_ value
	|	if_ bra_ value ket_ meaning
	|	for_ refval store_ value to_ value step_ value do_ meaning
	|	location_ value;
patterndecl : pattern_ identifier paramlist means_ sbra_ meaning sket_ assemblesto sideeffects precond
               
	|pattern_ identifier means_ sbra_ alternatives sket_;
paramtails : paramtail paramtails
	|;
paramlist : bra_ param paramtails ket_
	|bra_ ket_;
param : typeid identifier
	|typetoken_ identifier
	|label_ identifier;
typeid : identifier;
paramtail : comma_ param;
malt: alts malt
	|;
alternatives : type malt; 
alts : vbar type;
precond : precondition sbra_ condition sket_
	|;
asideeffect:   sideeffect  returnval;
sideeffects : asideeffects;
asideffects : asideffect asideffects
	|;
assemblesto:assembles sbra assemblypattern sket;
assemblertokens : assemblertoken assemblertokens
	|;
assemblypattern : assemblertokens;
assemblertoken : string_ 
	|identifier;
returnval : returns_ identifier;
statement :  	aliasdecl
	|	registerdecl 
	|	address patterndecl
	|	 	procedure patterndecl
	|		opdecl
	|		flag_ identifier equals_ intlit
	|		typetoken_ predeclaredtype     equals identifier
	|		patterndecl;
statementlist : statement semicolon_ statements;
statements :  statement  semicolon statements
	|;

