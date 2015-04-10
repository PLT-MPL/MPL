{ open Parser}

let pitch = (['A'-'G']('#' | 'b')?['0'-'9'])
let Integer_cons = ['0'-'9']+
let Double_cons = ['0'-'9']+['.']['0' - '9']+ | ['0'-'9']+['.'] | ['.']['0' - '9']+
let 
let String_cons = 
let Character_cons = 
let Instrument_cons = ( 'PIANO'| 'VIOLIN' )


rule token = parse
[' ' '\t' '\r' '\n']    			{token lexbuf}
| "/*"                     			{comment lexbuf}
| "//"								{comment_newline lexbuf}
| '('       { LPA }          
| ')'       { RPA }
| '{'       { LBRE }          
| '}'       { RBRE }
| ';'       { SEMI }
| ':'		{ COL }
| ','		{ COM }
| '['       { LBRK }          
| ']'       { RBRK }
| '=' 		{ ASS }
| '+'       { PLUS }
| '-'       { MINUS }
| '*'       { MUL }           
| '/'       { DIV }
| '%'	    { PER }	
| '!'       { NOT }
| "||"	    { OR }
| "&&"	    { AND }
| "=="      { EQ }				
| "!="      { NEQ } 
| '<'       { LT }
| '>'       { GT }
| "<="      { LEQ }             
| ">="      { GEQ }
| '|'		{ PIPE }


| "Integer" {DATATYPE("Integer")}
| "Character" {DATATYPE("Character")}
| "String"   {DATATYPE("String")}
|
