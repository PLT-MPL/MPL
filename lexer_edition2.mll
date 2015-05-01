{ open Parser}

let Pitch_cons = (['A'-'G']('#' | 'b')?['0'-'9'])
let Integer_cons = ['0'-'9']+
let Double_cons = ['0'-'9']+['.']['0' - '9']+ | ['0'-'9']+['.'] | ['.']['0' - '9']+
let String_cons = '\"' ('\\'_ | [^'\"'])* '\"'
let Identifier = ['a'-'z' 'A'-'Z'] (['_' 'a'-'z' 'A'-'Z' '0'-'9'])*
let Instrument_cons = "PIANO"| "VIOLIN"

rule token = parse
[' ' '\t' '\r' '\n']{ token lexbuf }
| "/*"              { comment lexbuf }
| "//"				{ comment_newline lexbuf }
| '('       		{ LPA }          
| ')'       		{ RPA }
| '['       		{ LBRK }          
| ']'       		{ RBRK }
| '{'       		{ LBRE }          
| '}'       		{ RBRE }
| ';'       		{ SEMI }
| ','				{ COM }
| '=' 				{ ASS }
| '+'       		{ ADD }
| '-'       		{ SUB }
| '*'       		{ MUL }           
| '/'       		{ DIV }
| '!'       		{ NOT }
| "||"	    		{ OR }
| "&&"	    		{ AND }
| "=="      		{ EQ }				
| "!="      		{ NEQ } 
| '<'       		{ LT }
| '>'       		{ GT }
| "<="      		{ LEQ }             
| ">="      		{ GEQ }

| "int" 			{ INT }
| "string"   		{ STRING }
| "boolean" 		{ BOOLEAN }
| "double"  		{ DOUBLE }
| "void" 			{ VOID }
| "Note"  			{ NOTE }
| "Melody" 			{ MELODY }
| "Track" 			{ TRACK }
| "Music" 			{ MUSIC }

| "return" 			{ RETURN }
| "if"     			{ IF }
| "else"   			{ ELSE }
| "for"    			{ FOR }
| "while"  			{ WHILE }
| "break" 			{ BREAK }
| "continue" 		{ CONTINUE }

| Identifier		as lxm { ID(lxm) }
| "ture"|"false" 	as lxm { BOOL_CON(bool_of_string lxm) }
| Integer_cons    	as lxm { INT_CON(int_of_string lxm) }
| Double_cons	  	as lxm { DOUB_CON(float_of_string lxm) }
| Pitch_cons	  	as lxm { PIT_CON(lxm) }
| Instrument_cons 	as lxm { INS_CON(lxm) }
| String_cons		as lxm { STR_CON(lxm) }
| eof			  	{ EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
"*/" {token lexbuf}
| _  {comment lexbuf}

and comment_newline = parse
'\n' {token lexbuf}
| _  {comment_newline lexbuf}






