type datatype =
	| Int
	| String
	| Boolean
	| Float
	| Void
	| Note
	| Melody
	| Track
	| Music

type v_decl = {
	vname : string;
	vtype : datatype;
}


type expression =
	| Id of string
	| IntCon of int
	| DoubleCon of float  
	| BoolCon of bool
	| StrCon of string
	| Paren_Expr of expression
	| Uni_Arg of expression
	| Multi_Arg of expression * expression
	| Func of expression * expression option

(*type argument_expression_list =
	| Uni_Arg of primary_expression
	| Multi_Arg of argument_expression_list * primary_expression

type expression_func =
	Func of primary_expression * argument_expression_list option

type expression =
	| primary_expression
	| expression_func
*)
type declaration =
	| MID of declaration * string
	| UID of v_decl

type stmt =
	| Expr of expression option
	| Bre_Expr of stmt option
	| Multi_Stmt of stmt * stmt
	| Decl_Stmt of declaration

(*
type stmt_list =
	Stmt_List of stmt_list * stmt
*)


type func_def = 
	Func_Def of string * string * stmt

type program = stmt list * func_def list

(*type external_declaration =
	| Ext_Func of func_def
	| Ext_Stmt of stmt

type program =
	| Pro_Ext of external_declaration
	| Pro_Multi of program * external_declaration*)



let string_of_dataType = function
	  Int -> "int"
	| String -> "string"
	| Boolean -> "bool"
	| Float -> "float"
	| Void -> "void"
	| Note -> "note"
	| Melody -> "melody"
	| Track -> "track"
	| Music -> "music"

let string_of_vdel v_del = 
	string_of_dataType v_del.vtype ^ " " ^ v_del.vname
	
let rec string_of_expr = function
	| Id(s)  ->  s
	| IntCon(c) -> string_of_int c
	| DoubleCon(d) -> string_of_float d
	| BoolCon(b) -> string_of_bool b
	| StrCon(s) -> s
	| Paren_Expr(e1) -> string_of_expr e1
	| Uni_Arg(e1) -> string_of_expr e1
    | Multi_Arg(arg,e1) -> string_of_expr arg ^ "," ^ string_of_expr e1
    | Func(e1,None) -> string_of_expr e1 ^ "()"
	| Func(e1,Some(arg))  -> string_of_expr e1 ^ "(" ^ string_of_expr arg ^ ")"



(*let rec string_of_arg  = function
    | Uni_Arg(e1) -> string_of_expr e1
    | Multi_Arg(arg,e1) -> string_of_arg arg ^ "," ^ string_of_expr e1

let rec string_of_func = function
	| Func(e1,None) -> string_of_expr e1 ^ "()"
	| Func(e1,Some(arg))  -> string_of_expr e1 ^ "(" ^ string_of_arg arg ^ ")"
*)
let rec string_of_declist = function
	| MID(dec_list,s) -> string_of_declist dec_list ^ "," ^ s
	| UID(vdel) -> string_of_dataType vdel.vtype ^ " " ^ vdel.vname

let rec string_of_stmt = function
	| Expr(None) -> ";"
	| Expr(Some(e1)) -> string_of_expr e1 ^ ";"
	| Bre_Expr(None) -> "{\n}"
	| Bre_Expr(Some(stmtlist)) -> "{\n" ^ string_of_stmt stmtlist ^ "}"
	| Multi_Stmt(stmt1,stmt2) -> string_of_stmt stmt1 ^ "\n" ^ string_of_stmt stmt2
	| Decl_Stmt(dec) -> string_of_declist dec ^ ";"

(*let string_of_stmtlist = function
	Stmt_List(stmt_list, stmt) -> string_of_stmtlist stmt_list^ "\n" ^ string_of_stmt stmt
*)
let string_of_func_def  = function
	Func_Def(s1,s2,stmt) -> s1 ^ " " ^ s2 ^ "()" ^ " { \n" ^ string_of_stmt stmt ^ "}\n"

let string_of_program (stmts, funcs) =
  String.concat "\n" (List.map string_of_stmt (List.rev stmts)) ^ "\n" ^
  String.concat "\n" (List.map string_of_func_def (List.rev funcs)) ^ "\n" 


(*let string_of_ext_decl = function
	| Ext_Func(fund) -> string_of_func_def fund
	| Ext_Stmt(stmt) -> string_of_stmt stmt

let string_of_program = function
	| Pro_Ext(ext) -> string_of_ext_decl ext
	| Pro_Multi(pro, ext) -> string_of_program pro ^ "\n\n" ^ string_of_ext_decl ext
*)