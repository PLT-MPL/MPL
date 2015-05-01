%{ %}

%token SEMI LPA RPA LBRK RBRK LBRE RBRE EOF DOT
%token COM ASS AASS SASS MASS ADD SUB MUL DIV ADD2 SUB2
%token NOT OR AND EQ NEQ LT GT LEQ GEQ
%token IF ELSE WHILE FOR
%token RETURN BREAK CONTINUE

%token <string> STR_CON
%token <string> DATATYPE
%token <bool> BOOL_CON
%token <int> INT_CON
%token <float> DOUB_CON
%token <string> INS_CON
%token <string> PIT_CON
%token <string> ID

%start program
%type <string> program

%%

constant:
	INT_CON					{ "INT" }
	| DOUB_CON				{ "DOUBLE" }
	| BOOL_CON				{ "BOOLEAN" }
	| STR_CON				{ $1 }

primary_expr:
	ID								{ $1 }
	| constant						{ $1 }
	| LPA expr RPA					{ "(" ^ $2 ^ ")" }
	| primary_expr LPA arg_expr_list RPA 	{ $1 ^ "(" ^ $3 ^ ")" }
	| primary_expr LPA  RPA 		{ $1 ^ "(  )" }
	| primary_expr LBRK expr RBRK 	{ $1 ^ "[ " ^ $3 ^ " ]" }
	| primary_expr DOT ID 			{ $1 ^ "." ^ $3 }
	| primary_expr ADD2				{ $1 ^ "++" }
	| primary_expr SUB2				{ $1 ^ "--" }

arg_expr_list:
	expr 						{ $1 }
	| arg_expr_list COM expr 	{ $1 ^ "," ^ $3 }

unary_expr:
	primary_expr			{ $1 }
	| ADD2 unary_expr		{ "++" ^ $2 }
	| SUB2 unary_expr		{ "--" ^ $2 }
	| SUB unary_expr		{ "-" ^ $2 }
	| NOT unary_expr		{ "!" ^ $2 }

mul_expr:
	unary_expr				{ $1 }
	| mul_expr MUL unary_expr	{ "(" ^ $1 ^ ") MUL (" ^ $3 ^ ")" }

add_expr:
	mul_expr				{ $1 }
	| add_expr ADD mul_expr { $1 ^ " ADD " ^ $3 }
	| add_expr SUB mul_expr { $1 ^ " SUB " ^ $3 }

cmpr_expr:
	add_expr					{ $1 }
	| cmpr_expr LT add_expr		{ $1 ^ " LT " ^ $3 }
	| cmpr_expr GT add_expr		{ $1 ^ " GT " ^ $3 }
	| cmpr_expr LEQ add_expr	{ $1 ^ " LEQ " ^ $3 }
	| cmpr_expr GEQ add_expr	{ $1 ^ " GEQ " ^ $3 }

eql_expr:
	cmpr_expr					{ $1 }
	| eql_expr EQ cmpr_expr		{ $1 ^ " EQ " ^ $3 }
	| eql_expr NEQ cmpr_expr	{ $1 ^ " NEQ " ^ $3 }

and_expr:
	eql_expr				{ $1 }
	| and_expr AND eql_expr	{ $1 ^ " and " ^ $3 }

or_expr:
	and_expr				{ $1 }
	| or_expr OR and_expr	{ $1 ^ " or " ^ $3 }

expr:
	or_expr						{ $1 }
	| unary_expr ass_op expr 	{ $1 ^ $2 ^ $3 }

ass_op:
	ASS 					{ " = " }
	| AASS 					{ " += " }
	| SASS 					{ " -= " }
	| MASS 					{ " *= " }

program:
	function_definition		{ $1 }
	| declaration 			{ $1 }
	| program function_definition	{ $1 ^ "\n\n" ^ $2 }

statement:
	SEMI					{ ";" }
	| expr SEMI				{ $1 ^ ";" }
	| LBRE RBRE				{ "{\n}" }
	| LBRE statement_list RBRE		{ "{\n" ^ $2 ^ "\n}" }
	| declaration			{ $1 }
	| other_statement		{ $1 }
	| jump_statement 		{ $1 }

declaration:
	DATATYPE declarator_list SEMI { $1 ^ " " ^ $2 ^ ";" }

init:
	or_expr 						{ $1 }
	| DATATYPE LPA RPA 				{ $1 ^ "(   )" }
	| DATATYPE LPA arg_expr_list RPA { $1 ^ "(" ^ $3 ^ ")" }
	| LBRE initializer_list RBRE 	{ "{" ^ $2 ^ "}" }

initializer_list:
	init 							{ $1 }
	| initializer_list COM init 	{ $1 ^ "," ^ $3 }

declarator_list:
	declarator							{ $1 }
	| declarator ASS init				{ $1 ^ "=" ^ $3 }
	| declarator_list COM declarator	{ $1 ^ "," ^ $3 }
	| declarator_list COM declarator ASS init	{ $1 ^ "," ^ $3 ^ "=" ^ $5 }

other_statement:
	IF LPA expr RPA statement 					{ "IF " ^ $3 ^ " THEN \n\t" ^ $5 }
	| IF LPA expr RPA statement ELSE statement  { "IF " ^ $3 ^ " THEN\n\t" ^ $5 ^ "\nELSE\n\t" ^ $7 }
	| WHILE LPA expr RPA statement 				{ "WHILE " ^ $3 ^ " THEN \n\t" ^ $5 }
	| FOR LPA statement statement expr RPA statement { "FOR " ^ $3 ^ " | " ^ $4 ^ " | " ^ $5 ^ "THEN\n\t" ^ $7 }
	| FOR LPA statement statement RPA statement { "FOR " ^ $3 ^ " | " ^ $4 ^ "THEN\n\t" ^ $6 }

jump_statement:
	CONTINUE SEMI 				{ "CONTINUE;" }
	| BREAK SEMI 				{ "BREAK;" }
	| RETURN SEMI 				{ "RETURN;" }
	| RETURN expr SEMI 	{ "RETURN " ^ $2 ^ ";" }

statement_list:
	statement 					{ $1 }
	| statement_list statement 	{ $1 ^ "\n" ^ $2 }

function_definition:
	DATATYPE declarator LBRE statement_list RBRE 	{ $1 ^ " " ^ $2 ^ " {\n" ^ $4 ^"\n}\n"}

declarator:
	ID 								{ $1 }
	| declarator LBRK or_expr RBRK	{ $1 ^ "[ " ^ $3 ^ " ]" }
	| declarator LBRK RBRK			{ $1 ^ "[ ]" }
	| declarator LPA para_list RPA	{ $1 ^ "( " ^ $3 ^ " )" }
	| declarator LPA type_list RPA	{ $1 ^ "( " ^ $3 ^ " )" }
	| declarator LPA arg_expr_list RPA	{ $1 ^ "( " ^ $3 ^ " )" }
	| declarator LPA RPA			{ $1 ^ "( )" }

para_list:
	DATATYPE declarator 				{ $1 ^ " " ^ $2 }
	| para_list COM DATATYPE declarator { $1 ^ ", " ^ $3 ^ " " ^ $4 }

type_list:
	DATATYPE					{ $1 }
	| type_list COM DATATYPE	{ $1 ^ ", " ^ $3 }
