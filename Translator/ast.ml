type ass_op =
	| ASS 
	| AASS
	| SASS
	| MASS

type expr = 
	| Id of string
	| IntCon of int
	| DoubleCon of float  
	| BoolCon of bool
	| StrCon of string
	| InsCon of string
	| PitCon of string
	| Dot_Expr of expr * string
	| Self_Add of expr
	| Self_Sub of expr
	| Self_Add2 of expr
	| Self_Sub2 of expr
	| Uminus of expr
	| Not_Unary of expr
	| Multi of expr * expr
	| Add_Bin of expr * expr
	| Sub of expr * expr
	| Less of expr * expr
	| Greater of expr * expr
	| Less_Equal of expr * expr
	| Greater_Equal of expr * expr
	| Equal of expr * expr
	| Non_Equal of expr * expr
	| And of expr * expr
	| Or of expr * expr
	| Expr of expr * ass_op * expr
	| Paren_Expr of expr
	| Array of expr * expr
	| Func_Call of expr * expr list option

type val_declarator = 
	| VId of string
	| Array_Dec of val_declarator * expr option

type init = 
	| Expr_Init of expr
	| Init of string * expr list option
	| Func_Init of init list 

type declarator_list = 
	| Val_Decl of val_declarator
	| Assignment of val_declarator * init
	| Dec_list of declarator_list * val_declarator
	| Assign_list of declarator_list * val_declarator * init

type statement = 
	| Stmt of expr option
	| Bre_Stmt of statement list option
	| Dec of string * declarator_list 
	| If of expr * statement
	| If_else of expr * statement * statement
	| While of expr * statement
	| For_complete of statement * statement * expr * statement
	| For_part of statement * statement * statement 
	| CONTINUE
	| BREAK
	| RETURN 
	| Return of expr 

type param = 
	Param of string * val_declarator

type func_declarator = 
	| Func_dec_p of string * param list option

type function_definition = 
	Func_Def of string * func_declarator * statement list

type program = statement list * function_definition list	

let rec string_of_ass_op  = function
	| ASS ->  "="
	| AASS -> "+=" 
	| SASS -> "-="
	| MASS -> "*="

let rec string_of_expr = function
	| Id(s) -> s
	| IntCon(c) -> string_of_int c
	| DoubleCon(d) -> string_of_float d
	| BoolCon(b) -> string_of_bool b
	| StrCon(s) -> s
	| Dot_Expr(e,s) -> string_of_expr e ^ "." ^ s
	| Self_Add(e) -> string_of_expr e ^ "++"
	| Self_Sub(e) -> string_of_expr e ^ "--"

	| Self_Add2(e) -> "++" ^ string_of_expr e
	| Self_Sub2(e) -> "--" ^ string_of_expr e
	| Uminus(e) -> "-" ^ string_of_expr e
	| Not_Unary(e) -> "!" ^ string_of_expr e

	| Multi(e1,e2) -> "(" ^ string_of_expr e1 ^ ")" ^ "*" ^ "(" ^ string_of_expr e2 ^ ")"

	| Add_Bin(e1,e2) -> string_of_expr e1 ^ "+" ^ string_of_expr e2
	| Sub(e1,e2) -> string_of_expr e1 ^ "-" ^ string_of_expr e2

	| Less(e1,e2) -> string_of_expr e1 ^ "<" ^ string_of_expr e2
	| Greater(e1,e2) -> string_of_expr e1 ^ ">" ^ string_of_expr e2
	| Less_Equal(e1,e2) -> string_of_expr e1 ^ "<=" ^ string_of_expr e2
	| Greater_Equal(e1,e2) -> string_of_expr e1 ^ ">=" ^ string_of_expr e2

	| Equal(e1,e2) -> string_of_expr e1 ^ "==" ^ string_of_expr e2
	| Non_Equal(e1,e2) -> string_of_expr e1 ^ "!=" ^ string_of_expr e2

	| And(e1,e2) -> string_of_expr e1 ^ "&&" ^ string_of_expr e2

	| Or(e1,e2) -> string_of_expr e1 ^ "||" ^ string_of_expr e2

	| Expr(e1,e2,e3) -> string_of_expr e1 ^ " " ^ string_of_ass_op e2 ^ " " ^ string_of_expr e3
	| Paren_Expr(e1) -> string_of_expr e1
	| Array(e1,e2) -> string_of_expr e1 ^ "[" ^ string_of_expr e2 ^ "]"
	| Func_Call(e1,Some(a)) -> string_of_expr e1 ^ "(" ^ String.concat ", "(List.map string_of_expr a) ^ ")"
	| Func_Call(e1,None) -> string_of_expr e1 ^ "(" ^ ")"

let rec string_of_val_declarator = function
	| VId(s) -> s
	| Array_Dec(d,Some(e)) -> string_of_val_declarator d ^ "[" ^ string_of_expr e ^ "]"
	| Array_Dec(d,None) -> string_of_val_declarator d ^ "[" ^ "]"

let rec string_of_init = function
	| Expr_Init(e) -> string_of_expr e
	| Init(s,None)  -> s ^ "(" ^ ")"
	| Init(s, Some(e)) -> s ^ "(" ^ String.concat ", " (List.map string_of_expr e) ^ ")"
	| Func_Init(e)  -> "{" ^ String.concat "," (List.map string_of_init e) ^ "}"
