%{ %}


%token SEM LPR RPR
%token PRINT
%token <string> STRING

%start program
%type <string> program

%%

program:
	/* nothing */			{ "" }
	| statement 			{ $1 }

statement:
	expression SEM			{ $1 ^ ";" }

expression:
	func LPR expression RPR	{ $1 ^ "(" ^ $3 ^ ")" }
	| string 				{ $1 }

func:
	PRINT					{ "System.out.print" }

string:
	STRING 					{ $1 }
