{ open Parser}

let Pitch_cons = (['A'-'G']('#' | 'b')?['0'-'9'])
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


| "int" {DATATYPE("Integer")}
| "character" {DATATYPE("Character")}
| "string"   {DATATYPE("String")}
| "boolean" {DATATYPE("Boolean")}
| "double"  {DATATYPE("Double")}
| "void" {DATATYPE("Void")}
| "Note"  {DATATYPE("Note")}
| "Melody" {DATATYPE("Melody")}
| "Track" {DATATYPE("Track")}
| "Music" {DATATYPE("Music")}

| "ture"|"false" as lxm { BOOL_CON(bool_of_string lxm)}
| "return" {RETURN}
| "if"     {IF}
| "else"   {ELSE}
| "for"    {FOR}
| "while"  {WHILE}
| "break" {BREAK}
| "continue" {CONTINUE}


| Integer_cons    as lxm { INT_CON(int_of_string lxm) }
| Character_cons  as lxm { CHAR_CON(character_of_string lxm)}
| Double_cons	  as lxm { DOUB_CON(double_of_string) lxm}
| Picth_cons	  as lxm { PIT_CON(Note_of_string) lxm}
| Instrument_cons as lxm { INS_CON(Track_of_string) lxm}
| eof			  {EOF}

and comment = parse
"*/" {token lexbuf}
| _  {comment lexbuf}

and comment_newline = parse
'\n' {token lexbuf}
| _  {comment_newline lexbuf}






