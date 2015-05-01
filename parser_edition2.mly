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

expression:
	ID						{ Id $1 }
	| constant				{ $1 }
	| LPA expression RPA	{ Paren_Expr $2 }

constant:
	INT_CON					{ IntCon $1 }
	| DOUB_CON				{ DoubleCon $1 }
	| BOOL_CON				{ BoolCon $1 }
	| STR_CON				{ StrCon $1 }

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

argument_expression_list:
	{ [] }
	| primary_declaration	{ [$1] }
	| argument_expression_list COM primary_declaration	{ $3 :: $1 }

argument_real_list:
	{ [] }
	| expression 	{ [$1] }
	| argument_real_list COM expression { $3 :: $1 }

function_call:
	ID LPA argument_real_list RPA 	{ Func_Call ($1, List.rev $3) }

init_declaration_list:
	| init_declaration_list COM ID		{ MID($1, $3) }
	| primary_declaration				{ UID($1) }

statement:
	SEMI					{ Expr (None) }
	| expression SEMI		{ Expr (Some($1)) }
	| LBRE RBRE				{ Bre_Expr (None) }
	| LBRE statement_list RBRE		{ Bre_Expr(Some(List.rev $2)) }
	| init_declaration_list SEMI 		{ Decl_Stmt($1)}
	| function_call SEMI 	{ Func_Stmt($1) }

statement_list:
	|	{ [] }
	| statement 				{ [$1] }
	| statement_list statement { $2 :: $1 }

function_declaration:
	primary_declaration LPA argument_expression_list RPA LBRE statement_list RBRE
	{
		{
			func_name = $1.vname;
			arguments = List.rev $3;
			body = List.rev $6;
			ret = $1.vtype;	
		}
	}


program:
   	{ [], [] }
 	| program statement {($2 :: fst $1), snd $1 }
 	| program function_declaration { fst $1, ($2 :: snd $1) }
