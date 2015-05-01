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

type declaration =
	| MID of declaration * string
	| UID of v_decl

type func_call = 
	Func_Call of string * expression list 

type stmt =
	| Expr of expression option
	| Bre_Expr of stmt list option
	| Decl_Stmt of declaration
	| Func_Stmt of func_call

type func_decl = {
	ret : datatype;
	func_name : string;
	arguments : v_decl list;
	body : stmt list; 
}

type program = stmt list * func_decl list



let string_of_dataType = function
	  Int -> "int"
	| String -> "String"
	| Boolean -> "Boolean"
	| Float -> "float"
	| Void -> "void"
	| Note -> "Note"
	| Melody -> "Melody"
	| Track -> "Track"
	| Music -> "Music"

let string_of_vdel v_del = 
	string_of_dataType v_del.vtype ^ " " ^ v_del.vname

let rec string_of_expr = function
	| Id(s)  ->  s
	| IntCon(c) -> string_of_int c
	| DoubleCon(d) -> string_of_float d
	| BoolCon(b) -> string_of_bool b
	| StrCon(s) -> s
	| Paren_Expr(e1) -> string_of_expr e1

let rec string_of_declist = function
	| MID(dec_list,s) -> string_of_declist dec_list ^ "," ^ s
	| UID(vdel) -> string_of_dataType vdel.vtype ^ " " ^ vdel.vname

let rec string_of_fcall = function
	Func_Call(s, args) -> s ^ "(" ^ String.concat ", " (List.map string_of_expr args) ^ ")"

let rec string_of_stmt = function
	| Expr(None) -> ";\n"
	| Expr(Some(e1)) -> string_of_expr e1 ^ ";\n"
	| Bre_Expr(None) -> "{\n}"
	| Bre_Expr(Some(stmts)) ->"{\n  " ^ String.concat "  " (List.map string_of_stmt stmts) ^ "}\n"
	| Decl_Stmt(dec) -> string_of_declist dec ^ ";\n"
	| Func_Stmt(fcall) -> string_of_fcall fcall ^ ";\n"

let string_of_fdecl fdecl =
  string_of_dataType fdecl.ret ^" " ^ fdecl.func_name ^ "(" ^ 
  String.concat ", " (List.map string_of_vdel fdecl.arguments) ^ ")\n{\n" ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^ "}\n"

 let string_of_program (stmts, funcs) =
  String.concat "\n" (List.map string_of_stmt (List.rev stmts)) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl (List.rev funcs)) ^ "\n" 
