
Package tinyb;
Helpers
  letter = ['A'..'Z'];
  digit = ['0'..'9'];
  cr = 13;
  lf = 10;
  not_cr_lf = [[32..127] - [cr + lf]];
  plus = '+';
  minus = '-';
  mult = '*';
  div = '/'; 
Tokens
  if = 'IF';
  then = 'THEN'; 
  let ='LET';
  for = 'FOR';
  to = 'TO';
  next = 'NEXT';
  end = 'END';
  read = 'READ';
  print = 'PRINT';
  println = 'PRINTLN';
  goto = 'GOTO'; 
  assign = ':=';

  condop = '<'|'>'|'='|'<='|'>=';
  arithop = plus|minus|mult|div;



  l_par = '(';
  r_par = ')';
 
ifdef(`multichar',
  `identifier = letter(letter |digit)*;
  rem='`''REM`''`not_cr_lf*;',
  `identifier = letter  | letter digit;')
  number = digit+;
  string = '"' [not_cr_lf - '"']* '"';

  new_line = cr | lf | cr lf;

  blank = ' '*;

Ignored Tokens
  blank;

Productions
  statements = 
    {list}  statement statements | 
    {empty} ;
  statement = number action;
  action = 
    {conditional}         	if [c]:condition then [n]: number new_line|
    {forloop}        		for identifier assign [fromexp]:expression to [toexp]:expression new_line |
    {read}       			read [id]:identifier new_line |
    ifdef(`multichar',
    `
    {comment}				rem new_line|',`')
    {printexp}  			print [e]:expression new_line | 
    {println}    			println new_line |
    {end}					end new_line|
    {jump}      			goto [n]:number new_line|
    {loopend}   			next [i]:identifier new_line|
    {assignment} 			let [id]:identifier assign [e]:expression new_line;

  condition =
         [left]:expression [op]:condop    [right]:expression 
     ;
  expression =
    {value} [v]:value |
    {arith}  [left]:value [op]:arithop  [right]:value ;
     
  value =
    {constant}   number |
    {identifier} identifier |
    {expression} l_par expression r_par;
