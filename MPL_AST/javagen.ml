open Printf
open Checker
open Ast

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

	| Multi(e1,e2) -> (
		let typeE1 = check_expr env e1 in
		let typeE2 = check_expr env e2 in
		match (typeE1,typeE2) with
		| ("Melody","Melody") -> "multipleMelody("^ string_of_expr e1 ^ "," ^ string_of_expr e2^")"
		| ("Music","Music") -> "multipleMusic("^ string_of_expr e1 ^ "," ^ string_of_expr e2^")"
		| ("Melody","int") -> "multipleInt"^ string_of_expr e1 ^ "," ^ string_of_expr e2^")"
		| ("int","Melody") -> "multipleInt"^ string_of_expr e1 ^ "," ^ string_of_expr e2^")"
		|  -> "(" ^ string_of_expr e1 ^ ")" ^ "*" ^ "(" ^ string_of_expr e2 ^ ")"
	)

	

	| Add_Bin(e1,e2) -> （ 
		let typeE1 = check_expr env e1 in
		let typeE2 = check_expr env e2 in
		match (typeE1,typeE2) with
		| ("Melody","Melody") -> "addMelody(" ^ string_of_expr e1 ^ "," ^ string_of_expr e2^")"
		| ("Music","Music") ->	"addMusic(" ^ string_of_expr e1 ^ "," ^ string_of_expr e2^")" 
		| ("Note","Note") -> "addNote("^ string_of_expr e1 ^ "," ^ string_of_expr e2^")"
		| ("Note","int") -> "plus(" ^ string_of_expr e1 ^ "," ^ string_of_expr e2^")" 
		| ("int","Note") -> "plus(" ^ string_of_expr e1 ^ "," ^ string_of_expr e2^")" 
		| ("Melody","Note") -> "addNote(" ^ string_of_expr e1 ^ "," ^ string_of_expr e2^")" 
		| ("Note", "Meldoy") -> "addNote(" ^ string_of_expr e1 ^ "," ^ string_of_expr e2^")"
		| -> string_of_expr e1 ^ "+" ^ string_of_expr e2
	)
	
	
	| Sub(e1,e2) -> (
		let typeE1 = check_expr env e1 in
		let typeE2 = check_expr env e2 in
		match (typeE1,typeE2) with
		| ("Note","int") -> "minus" ^ string_of_expr e1 ^ "," ^ string_of_expr e2^")"
		| -> string_of_expr e1 ^ "-" ^ string_of_expr e2
	)
	

	| Less(e1,e2) -> string_of_expr e1 ^ "<" ^ string_of_expr e2
	| Greater(e1,e2) -> string_of_expr e1 ^ ">" ^ string_of_expr e2
	| Less_Equal(e1,e2) -> string_of_expr e1 ^ "<=" ^ string_of_expr e2
	| Greater_Equal(e1,e2) -> string_of_expr e1 ^ ">=" ^ string_of_expr e2

	| Equal(e1,e2) -> string_of_expr e1 ^ "==" ^ string_of_expr e2
	| Non_Equal(e1,e2) -> string_of_expr e1 ^ "!=" ^ string_of_expr e2

	| And(e1,e2) -> string_of_expr e1 ^ "&&" ^ string_of_expr e2

	| Or(e1,e2) -> string_of_expr e1 ^ "||" ^ string_of_expr e2

	| Expr(e1,e2,e3) -> string_of_expr e1 ^ " " ^ string_of_ass_op e2 ^ " " ^ string_of_expr e3 (*a b c*)
	| Paren_Expr(e1) -> string_of_expr e1
	| Array(e1,e2) -> 






	string_of_expr e1 ^ "[" ^ string_of_expr e2 ^ "]"(* a[4] *)
	| Func_Call(e1,Some(a)) -> (match e1 with
		| "print" -> "PublicFunction.println(" ^ String.concat ", " (List.map string_of_expr a)^")"
		| "read" -> "PublicFunction.read(" ^ String.concat ", " (List.map string_of_expr a)^ ")"
		| "write" -> "PublicFunction.write(" ^ String.concat ", " (List.map string_of_expr a)^ ")"
		| "setNoteDefault" -> "PublicFunction.setNoteDefault(" ^ String.concat ", " (List.map string_of_expr a)^ ")"
		| "changeToMillisecond" -> "PublicFunction.changeToMillisecond("^ String.concat ", " (List.map string_of_expr a)^ ")"
		| "printTime" -> "PublicFunction.printTime("^ String.concat ", " (List.map string_of_expr a)^ ")"
		| "sizeOf" -> "PublicFunction.sizeOf"^ String.concat ", " (List.map string_of_expr a)^ ")"
		| -> string_of_expr e1 ^ "(" ^ String.concat ", "(List.map string_of_expr a) ^ ")" (* linkdown(ip,port)*)
	)
		
	| Func_Call(e1,None) -> string_of_expr e1 ^ "(" ^ ")" (*linkdown()*)



let rec string_of_val_declarator = function
	| VId(s) -> s (**)
	| Array_Dec(d,Some(e)) -> string_of_val_declarator d ^ "[" ^ string_of_expr e ^ "]" (* a[4] *)
	| Array_Dec(d,None) -> string_of_val_declarator d ^ "[" ^ "]" (* a[] *)

let rec string_of_init = function
	| Expr_Init(e) -> string_of_expr e
	| Init(s,None)  -> (
		match s with 
		| "Note" -> "new Note()"
		| "Melody" -> "new Melody()"
		| "Music" -> "new Music()"
		| "Track" -> "new Track()"
	)
	| Init(s, Some(e)) -> (
		match s with
		| "Note" -> "new Note(" ^ String.concat ", " (List.map string_of_expr e) ^ ")"
		| "Meldoy" -> "new Melody(" ^ String.concat ", " (List.map string_of_expr e) ^ ")"
		| "Music" -> "new Musci(" ^ String.concat ", " (List.map string_of_expr e) ^ ")"
		| "Track" -> "new Track(" ^ String.concat ", " (List.map string_of_expr e) ^ ")"
	)
	| Func_Init(e)  -> (
		let typeE = check_expr env e in
		match  typeE with
		| "Array_Track" -> "new ArrayList<Track>(Arrays.asList("^ String.concat "," (List.map string_of_init e)^"))"
		| "Array_Note" -> "new ArrayList<Note>(Arrays.asList("^ String.concat "," (List.map string_of_init e)^"))"
		|  ->"{" ^ String.concat "," (List.map string_of_init e) ^ "}" 
)

let rec string_of_dec_list = function
	| Val_Decl(v) -> string_of_val_declarator v
	| Assignment(v,i) -> string_of_val_declarator v ^ "=" ^ string_of_init i
	| Dec_list(d,v) -> string_of_dec_list d ^ ", " ^ string_of_val_declarator v
	| Assign_list(d,v,i) -> string_of_dec_list d ^ ", " ^ string_of_val_declarator v ^ "= " ^ string_of_init i



let rec string_of_stmt = function
	| Stmt(None) -> ";"
	| Stmt(Some(e)) -> string_of_expr e ^ ";\n"
	| Bre_Stmt(None) -> "{\n}"
	| Bre_Stmt(Some(stmts)) -> "{\n  " ^ String.concat "\n" (List.map string_of_stmt stmts) ^ "\n}"
	| Dec(datatype,d) -> (
		let typed = check_stmt env d in
		match  typed with 
		| "Array_Track"-> "List<Track>" ^ string_of_dec_list d 
		| "Array_Note" -> "List<Note>" ^ string_of_dec_list d 
		| -> datatype ^ " " ^ string_of_dec_list d ^ ";" 

	)
	| If(e,stmt) -> "if " ^ "(" ^ string_of_expr e ^ ")" ^ string_of_stmt stmt
	| If_else(e,stmt1,stmt2) -> "if" ^ "(" ^ string_of_expr e ^ ")" ^ string_of_stmt stmt1 ^ "else" ^ string_of_stmt stmt2
	| While(e,stmt) -> "while" ^ "(" ^ string_of_expr e ^ ")" ^ string_of_stmt stmt
	| For_complete(stmt1,stmt2,e,stmt3) -> "for" ^ "(" ^ string_of_stmt stmt1 ^ string_of_stmt stmt2 ^ string_of_expr e ^ ")\n" ^ string_of_stmt stmt3
	| For_part(stmt1,stmt2,stmt3) -> "for" ^ "(" ^ string_of_stmt stmt1 ^ string_of_stmt stmt2 ^ ")" ^ string_of_stmt stmt3
	| CONTINUE -> "continue;"
	| BREAK -> "break;"
	| RETURN -> "return;"
	| Return(e) -> "return " ^ string_of_expr e ^ ";"


let rec string_of_param = function
	Param(s,v) ->  s ^ " " ^ string_of_val_declarator v


let rec string_of_func_declarator = function
	| Func_dec_p(s,Some(pl)) -> s ^ "(" ^ String.concat "," (List.map string_of_param pl) ^ ")"
	| Func_dec_t(s,t) -> s ^ "(" ^ String.concat "," (List.rev t) ^ ")"
	| Func_dec_p(s,None) -> s ^ "(" ^ " " ^ ")"

let rec string_of_func_def = function
	Func_Def(s, d, stmts) -> s ^ " " ^ string_of_func_declarator d ^ "{\n" ^ String.concat "\n" (List.map string_of_stmt stmts) ^ "\n}\n"


let string_of_program (stmts, funcs) =
  String.concat "\n" (List.map string_of_stmt (List.rev stmts)) ^ "\n" ^
  String.concat "\n" (List.map string_of_func_def (List.rev funcs)) ^ "\n" 

let  writeToFile fileName progString = 
  let file = open_out ("java/" ^ fileName ^ ".java") in
    let content=fprintf file "%s"  progString in
		"Write finished!"

  let gen_program fileName prog = 
  	let programString = string_of_program (fst prog, snd prog) in 
  	let out = sprintf
  		"\npublic class %s\n{\n%s%s\n}" fileName programString "public static void main(String[] args){ main(0,\"\");){return ;}}" in
  	writeToFile fileName out 