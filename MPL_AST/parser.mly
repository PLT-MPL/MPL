%{ 
	open Ast
%}

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
%type <Ast.program> program

%%

constant:
	| INT_CON				{ IntCon $1 }
	| DOUB_CON				{ DoubleCon $1 }
	| BOOL_CON				{ BoolCon $1 }
	| STR_CON				{ StrCon $1 } 


primary_expr:
	| ID							{ Id $1 }
	| constant						{ $1 }
	| LPA expr RPA					{ Paren_Expr $2 }
	| primary_expr LPA arg_expr_list RPA 	{ Func_Call($1 , Some($3)) }
	| primary_expr LPA  RPA 		{ Func_Call($1, None) }
	| primary_expr LBRK expr RBRK 	{ Array($1,$3)}
	| primary_expr DOT ID 			{ Dot_Expr($1,$3) }
	| primary_expr ADD2				{ Self_Add ($1) }
	| primary_expr SUB2				{ Self_Sub ($1)}

unary_expr:
	| primary_expr			{ $1 }
	| ADD2 unary_expr		{ Self_Add2 ($2) }
	| SUB2 unary_expr		{ Self_Sub2 ($2) }
	| SUB unary_expr		{ Uminus($2) }
	| NOT unary_expr		{ Not_Unary($2) }


mul_expr:
	| unary_expr				{ $1 }
	| mul_expr MUL unary_expr	{ Multi($1,$3) }
	
add_expr:
	| mul_expr				{ $1 }
	| add_expr ADD mul_expr { Add_Bin($1,$3) }
	| add_expr SUB mul_expr { Sub($1,$3) }


cmpr_expr:
	| add_expr					{ $1 }
	| cmpr_expr LT add_expr		{ Less($1,$3) }
	| cmpr_expr GT add_expr		{ Greater($1,$3) }
	| cmpr_expr LEQ add_expr	{ Less_Equal($1,$3) }
	| cmpr_expr GEQ add_expr	{ Greater_Equal($1,$3) }

eql_expr:
	| cmpr_expr					{ $1 }
	| eql_expr EQ cmpr_expr		{ Equal($1,$3) }
	| eql_expr NEQ cmpr_expr	{ Non_Equal($1,$3) }

and_expr:
	| eql_expr				{ $1 }
	| and_expr AND eql_expr	{ And($1,$3) }

or_expr:
	| and_expr				{ $1 }
	| or_expr OR and_expr	{ Or($1,$3) }

ass_op:
	| ASS 					{ ASS }
	| AASS 					{ AASS }
	| SASS 					{ SASS }
	| MASS 					{ MASS }

expr:
	| or_expr						{ $1 }
	| unary_expr ass_op expr 	{ Expr($1,$2,$3) }
	

arg_expr_list:
	{ [] }
	| expr 						{ [$1] }
	| arg_expr_list COM expr 	{ $3 :: $1 }

statement:
	SEMI					{ Stmt (None) }
	| expr SEMI				{ Stmt (Some($1))}
	| LBRE RBRE				{ Bre_Stmt(None) }
	| LBRE statement_list RBRE		{ Bre_Stmt(Some(List.rev $2)) }
	| DATATYPE declarator_list SEMI { Dec($1,$2)}
	| IF LPA expr RPA statement 					{If($3,$5)}
	| IF LPA expr RPA statement ELSE statement  {If_else($3,$5,$7)}
	| WHILE LPA expr RPA statement 				{While($3,$5) }
	| FOR LPA statement statement expr RPA statement {For_complete($3,$4,$5,$7)}
	| FOR LPA statement statement RPA statement  {For_part($3,$4,$6)}
	| CONTINUE SEMI 				{ CONTINUE }
	| BREAK SEMI 				{ BREAK }
	| RETURN SEMI 				{ RETURN }
	| RETURN expr SEMI 	{ Return($2) }

statement_list:
	| {[]}
	| statement 					{ [$1] }
	| statement_list statement 	{ $2 :: $1 }

val_declarator:
	ID 								{ VId $1 }
	| val_declarator LBRK or_expr RBRK	{ Array_Dec($1,Some($3)) }
	| val_declarator LBRK RBRK	{  Array_Dec($1,None) }

init:
	| expr 						{ Expr_Init $1 }
	| DATATYPE LPA RPA 				{ Init($1, None)}
	| DATATYPE LPA arg_expr_list RPA { Init($1, Some($3)) }
	| LBRE initializer_list RBRE 	{ Func_Init($2) }

initializer_list:
	init 							{ [$1] }
	| initializer_list COM init 	{ $3 :: $1}

declarator_list:
	| val_declarator							{ Val_Decl $1 }
	| val_declarator ASS init				{ Assignment($1, $3) }
	| declarator_list COM val_declarator	{ Dec_list($1,$3) }
	| declarator_list COM val_declarator ASS init	{ Assign_list($1,$3,$5) }

param:
	DATATYPE val_declarator 				{ Param($1,$2) }

para_list:
	{ [] }
	| param									{ [$1] }
	| para_list COM param { $3 :: $1 }


type_list:
	| DATATYPE					{ [$1] }
	| type_list COM DATATYPE	{ $3 :: $1 }


func_declarator:
	| ID LPA para_list RPA	{ Func_dec_p($1,Some($3))}
	| ID LPA type_list RPA	{ Func_dec_t($1,$3)}
	| ID LPA RPA	{ Func_dec_p($1,None ) }



function_definition:
	DATATYPE func_declarator LBRE statement_list RBRE 	{ Func_Def($1,$2,List.rev $4 )}


program:
   	{ [], [] }
 	| program statement {($2 :: fst $1), snd $1 }
 	| program function_definition { fst $1, ($2 :: snd $1) }


