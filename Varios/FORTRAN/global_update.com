$! global_update - globally compile a list of files and replace
$!					modules in an object library
$!
$! format:	global_update libname listfile -options
$! options:	any option allowed by UPDATE
$
$ if p1 .eqs. "" then inquire p1 "library"
$ if p1 .eqs. "" then exit
$
$ if p2 .eqs. "" then inquire p2 "listfile"
$ if p2 .eqs. "" then exit	
$
$ pound "$ write sys$output \h22#h22\n$ update ''p1' # ''p3'" 'p2' aaa.com
$ @aaa.com
$ del aaa.com;*
