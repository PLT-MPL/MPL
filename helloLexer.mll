{ open HelloParser }

let str = '"'['a'-'z' '0'-'9' 'A'-'Z']*'"'

rule token = parse
	[' ' '\t' '\r' '\n']    { token lexbuf }
	| "print"				{ PRINT }
	| "("					{ LPR }
	| ")"					{ RPR }
	| ";"					{ SEM }
	| str					as lxm { STRING(lxm) }
