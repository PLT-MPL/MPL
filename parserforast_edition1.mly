%{ 
	open Ast
%}

%token SEMI LPA RPA LBRK RBRK LBRE RBRE EOF
%token COM ASS ADD SUB MUL DIV
%token NOT OR AND EQ NEQ LT GT LEQ GEQ
%token IF ELSE WHILE FOR
%token RETURN BREAK CONTINUE
%token INT STRING BOOLEAN DOUBLE VOID NOTE MELODY TRACK MUSIC

%token <string> STR_CON
%token <string> DATATYPE
%token <bool> BOOL_CON
%token <int> INT_CON
%token <float> DOUB_CON
%token <string> INS_CON
%token <string> PIT_CON
%token <string> ID

%start program
%type <Ast.program> program

%%

primary_expression:
	ID						{ Id $1 }
	| constant				{ $1 }
	| LPA expression RPA	{ Paren_Expr $2 }

constant:
	INT_CON					{ IntCon $1 }
	| DOUB_CON				{ DoubleCon $1 }
	| BOOL_CON				{ BoolCon $1 }
	| STR_CON				{ StrCon $1 }

expression:
	| primary_expression	{ $1 }
	| expression LPA argument_expression_list RPA 	{ Func($1, Some($3))}
	| expression LPA  RPA 	{ Func($1, None)}

argument_expression_list:
	| expression 				{ Uni_Arg($1)}
	| argument_expression_list COM expression 	{ Multi_Arg($1, $3) }

primary_declaration:
	| INT ID 	{ {vtype = Int; vname = $2}}
	| STRING ID 	{ {vtype = String; vname = $2}}
	| BOOLEAN ID 	{ {vtype = Boolean; vname = $2}}
	| DOUBLE ID 	{ {vtype = Float; vname = $2}}
	| VOID ID 	{ {vtype = Void; vname = $2}}
	| NOTE ID 	{ {vtype = Note; vname = $2}}
	| MELODY ID 	{ {vtype = Melody; vname = $2}}
	| TRACK ID 	{ {vtype = Track; vname = $2}}
	| MUSIC ID 	{ {vtype = Music; vname = $2}}

init_declaration_list:
	| init_declaration_list COM ID		{ MID($1, $3) }
	| primary_declaration				{ UID($1) }

statement:
	SEMI					{ Expr (None) }
	| expression SEMI		{ Expr (Some($1)) }
	| LBRE RBRE				{ Bre_Expr (None) }
	| LBRE statement_list RBRE		{ Bre_Expr(Some($2)) }
	| init_declaration_list SEMI 		{ Decl_Stmt($1)}

statement_list:
	statement 				{ $1 }
	| statement_list statement { Multi_Stmt($1, $2) }


function_definition:
	DATATYPE ID LPA RPA LBRE statement RBRE	{ Func_Def($1, $2, $6)}

/*program:
	{[], []}
	| program statement {($2 :: fst $1), snd $1}
	| program function_definition {fst $1, ($2 :: snd $1)}
*/

/*external_declaration:
	| function_definition	{ Ext_Func $1 }
	| statement 			{ Ext_Stmt $1 }*/


program:
   { [], [] }
 | program statement {($2 :: fst $1), snd $1 }
 | program function_definition { fst $1, ($2 :: snd $1) }
/*program:
	| external_declaration	{ Pro_Ext($1) }
	| program external_declaration	{ Pro_Multi($1, $2)}*/
	
