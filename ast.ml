type expression =
	| Id of string
	| IntCon of int
	| DoubleCon of double 
	| BoolCon of boolean
	| StrCon of string
	| Paren_Expr of expression
	| Func of expression * argument_expression_list option


type argument_expression_list =
	| Uni_Arg of expression
	| Multi_Arg of argument_expression_list * expression

type declaration =
	Multi_Id of declaration * string

type stmt_list =
	Stmt_List of stmt_list * stmt

type stmt =
	| Expr of expression
	| Decl of string * expression

type func_def = 
	Func_Def of string * string * stmt



let string_of_dataType = function
	  Int -> "int"
	| String -> "string"
	| Boolean -> "bool"
	| Void -> "void"
	| Note -> "note"
	| Melody -> "melody"
	| Track -> "track"
	| Music -> "music"
	
let rec string_of_expr = function
	Id(s) -> s
	|IntCon(c) -> string_of_int c
	|DoubleCon(d) -> string_of_double d
	|BoolCon(b) -> string_of_boolean b
	|StrCon(s) -> s
	|Paren_Expr(e1) -> string_of_expr e1
	|Func(e1,None) -> string_of_expr e1 ^ "()"
	|Func(e1,Some(arg)) string_of_expr e1 ^ "(" ^ string_of_arg arg ^ ")"

let rec string_of_arg  = function
    | Uni_Arg(e1) -> string_of_expr e1
    | Multi_Arg(arg,e1) -> string_of_arg arg ^ "," ^ string_of_expr e1

let rec string_of_declist = function
	| Id(s) -> s
	| Multi_Id(dec_list,s) -> string_of_dec dec_list ^ "," ^ s

let rec string_of_stmt = function
	| Expr(e1) -> string_of_expr e1
	| Decl(datatype,declist) string_of_dataTpe datatype ^ " " ^ string_of_declist declist ^ ";"

let string_of_stmtlist = 
	Stmt_List(stmt_list, stmt ) -> string_of_stmtlist stmt_list ^ string_of_stmt stmt

let string_of_func_def  = 
	Func_Def(s1,s2,stmt) -> string s1 ^ " " ^ string s2 " " ^ string_of_stmt stmt