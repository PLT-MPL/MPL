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
	| LPA expression RPA	{ "(" ^ $1 ^ ")" }

constant:
	INT_CON					{ int_to_string $1 }
	| DOUB_CON				{ float_to_string $1 }
	| BOOL_CON				{ bool_to_string $1 }
	| STR_CON				{ $1 }

postfix_expression
	primary_expression		{ $1 }
	| postfix_expression LPA argument_expression_list RPA { $1 ^ "(" ^ $3 ^ ")" }

argument_expression_list
	expression 				{ $1 }
	| argument_expression_list COM expression 	{ $1 ^ "," ^ $3 }

program:
	/* nothing */			{ "" }
	| statement program EOF	{ $1 ^ "\n" ^ $2 }

statement:
	SEMI
	| expression SEMI			{ $1 ^ ";" }

expression:
	func LPA expression RPA	{ $1 ^ "(" ^ $3 ^ ")" }
	| string 				{ $1 }

func:
	ID						{ $1 }

string:
	STR_CON 				{ $1 }

