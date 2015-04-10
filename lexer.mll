{ open Parser}

let Pitch_cons = (['A'-'G']('#' | 'b')?['0'-'9'])
let Integer_cons = ['0'-'9']+
let Double_cons = ['0'-'9']+['.']['0' - '9']+ | ['0'-'9']+['.'] | ['.']['0' - '9']+
let String_cons = '\"' ([^'\"']* as lxm) '\"'
let Instrument_cons = 'PIANO'| 'VIOLIN' 


rule token = parse
[' ' '\t' '\r' '\n']{token lexbuf}
| "/*"              {comment lexbuf}
| "//"				{comment_newline lexbuf}
| '('       		{ LPA }          
| ')'       		{ RPA }
| '['       		{ LBRK }          
| ']'       		{ RBRK }
| '{'       		{ LBRE }          
| '}'       		{ RBRE }
| ';'       		{ SEMI }
| ','				{ COM }
| '=' 				{ ASS }
| '+'       		{ PLUS }
| '-'       		{ MINUS }
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



| "int" 			{ DATATYPE("Integer") }
| "string"   		{ DATATYPE("String") }
| "boolean" 		{ DATATYPE("Boolean") }
| "double"  		{ DATATYPE("Double") }
| "void" 			{ DATATYPE("Void") }
| "Note"  			{ DATATYPE("Note") }
| "Melody" 			{ DATATYPE("Melody") }
| "Track" 			{ DATATYPE("Track") }
| "Music" 			{ DATATYPE("Music") }

| "ture"|"false" as lxm { BOOL_CON(bool_of_string lxm)}
| "return" 			{RETURN}
| "if"     			{IF}
| "else"   			{ELSE}
| "for"    			{FOR}
| "while"  			{WHILE}
| "break" 			{BREAK}
| "continue" 		{CONTINUE}


| Integer_cons    	as lxm { INT_CON(int_of_string lxm) }
| Double_cons	  	as lxm { DOUB_CON(double_of_string) lxm}
| Picth_cons	  	as lxm { PIT_CON(Note_of_string) lxm}
| Instrument_cons 	as lxm { INS_CON(Track_of_string) lxm}
| eof			  	{EOF}
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
"*/" {token lexbuf}
| _  {comment lexbuf}

and comment_newline = parse
'\n' {token lexbuf}
| _  {comment_newline lexbuf}






