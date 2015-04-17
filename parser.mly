%{ %}

%token SEMI LPA RPA LBRK RBRK LBRE RBRE EOF
%token COM ASS ADD SUB MUL DIV
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

primary_expression:
	ID						{ $1 }
	| constant				{ $1 }
	| LPA expression RPA	{ "(" ^ $2 ^ ")" }

constant:
	INT_CON					{ "INT" }
	| DOUB_CON				{ "DOUBLE" }
	| BOOL_CON				{ "BOOLEAN" }
	| STR_CON				{ $1 }

expression:
	| primary_expression	{ $1 }
	| expression LPA argument_expression_list RPA 	{ $1 ^ "(" ^ $3 ^ ")" }
	| expression LPA  RPA 	{ $1 ^ "(  )" }

argument_expression_list:
	expression 				{ $1 }
	| argument_expression_list COM expression 	{ $1 ^ "," ^ $3 }

declaration:
	DATATYPE init_declaration_list SEMI 		{ $1 ^ " " ^ $2 ^ ";" }

init_declaration_list:
	declarator				{ $1 }
	| init_declaration_list COM declarator		{ $1 ^ "," ^ $3 }

declarator:
	ID 						{ $1 }
	| ID LPA RPA			{ $1 ^ "( void )"}

program:
	| external_declaration	{ $1 }
	| program external_declaration	{ $1 ^ "\n\n" ^ $2 }

statement:
	compound_statement		{ $1 }
	| expresion_statement 	{ $1 }

expresion_statement:
	SEMI					{ ";" }
	| expression SEMI		{ $1 ^ ";" }

compound_statement:
	LBRE RBRE				{ "{\n}" }
	| LBRE block_item_list RBRE		{ "{\n" ^ $2 ^ "\n}" }

block_item_list:
	block_item 				{ $1 }
	| block_item_list block_item { $1 ^ "\n" ^ $2 }

block_item:
	declaration 			{ $1 }
	| statement 			{ $1 }

external_declaration:
	function_definition		{ $1 }
	| declaration 			{ $1 }

function_definition:
	DATATYPE declarator compound_statement	{ $1 ^ " " ^ $2 ^ $3 ^"\n"}
