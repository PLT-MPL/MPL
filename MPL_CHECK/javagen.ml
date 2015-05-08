open Printf
open Checker
open Ast

let java_scope = ref 0
let gen_inc_scope (u:unit) =
	java_scope := !java_scope + 1;
	!java_scope

let rec string_of_expr env expr =
	match expr with
	| Id(s) -> s
	| IntCon(c) -> string_of_int c
	| DoubleCon(d) -> string_of_float d
	| BoolCon(b) -> string_of_bool b
	| StrCon(s) -> s
	| InsCon(s) | PitCon(s) -> "C." ^ s
	| Dot_Expr(e,s) -> string_of_expr env e ^ "." ^ s
	| Self_Add(e) -> string_of_expr env e ^ "++"
	| Self_Sub(e) -> string_of_expr env e ^ "--"
	| Self_Add2(e) -> "++" ^ string_of_expr env e
	| Self_Sub2(e) -> "--" ^ string_of_expr env e
	| Uminus(e) -> "-" ^ string_of_expr env e
	| Not_Unary(e) -> "!" ^ string_of_expr env e

	| Multi(e1,e2) -> (
		let typeE1 = check_expr env e1 in
		let typeE2 = check_expr env e2 in
		match (typeE1,typeE2) with
		| ("Melody","Melody") -> "PublicFunction.multipleMelody("^ string_of_expr env e1 ^ "," ^ string_of_expr env e2^")"
		| ("Music","Music") -> "PublicFunction.multipleMusic("^ string_of_expr env e1 ^ "," ^ string_of_expr env e2^")"
		| ("Melody","int") | ("int","Melody") -> "PublicFunction.multipleInt"^ string_of_expr env e1 ^ "," ^ string_of_expr env e2^")"
		| _ -> "(" ^ string_of_expr env e1 ^ ")" ^ "*" ^ "(" ^ string_of_expr env e2 ^ ")"
	)

	| Add_Bin(e1,e2) -> (
		let typeE1 = check_expr env e1 in
		let typeE2 = check_expr env e2 in
		match (typeE1,typeE2) with
		| ("Melody","Melody") -> "PublicFunction.addMelody(" ^ string_of_expr env e1 ^ "," ^ string_of_expr env e2^")"
		| ("Music","Music") ->	"PublicFunction.addMusic(" ^ string_of_expr env e1 ^ "," ^ string_of_expr env e2^")" 
		| ("Note","Note") -> "PublicFunction.addNote("^ string_of_expr env e1 ^ "," ^ string_of_expr env e2^")"
		| ("Note","int") | ("int","Note") -> "PublicFunction.plus(" ^ string_of_expr env e1 ^ "," ^ string_of_expr env e2^")" 
		| ("Melody","Note") | ("Note", "Meldoy") -> "PublicFunction.addNote(" ^ string_of_expr env e1 ^ "," ^ string_of_expr env e2^")"
		| _ -> string_of_expr env e1 ^ "+" ^ string_of_expr env e2
	)
	
	
	| Sub(e1,e2) -> (
		let typeE1 = check_expr env e1 in
		let typeE2 = check_expr env e2 in
		match (typeE1,typeE2) with
		| ("Note","int") -> "PublicFunction.minus" ^ string_of_expr env e1 ^ "," ^ string_of_expr env e2^")"
		| _ -> string_of_expr env e1 ^ "-" ^ string_of_expr env e2
	)
	

	| Less(e1,e2) -> string_of_expr env e1 ^ "<" ^ string_of_expr env e2
	| Greater(e1,e2) -> string_of_expr env e1 ^ ">" ^ string_of_expr env e2
	| Less_Equal(e1,e2) -> string_of_expr env e1 ^ "<=" ^ string_of_expr env e2
	| Greater_Equal(e1,e2) -> string_of_expr env e1 ^ ">=" ^ string_of_expr env e2

	| Equal(e1,e2) -> string_of_expr env e1 ^ "==" ^ string_of_expr env e2
	| Non_Equal(e1,e2) -> string_of_expr env e1 ^ "!=" ^ string_of_expr env e2

	| And(e1,e2) -> string_of_expr env e1 ^ "&&" ^ string_of_expr env e2

	| Or(e1,e2) -> string_of_expr env e1 ^ "||" ^ string_of_expr env e2

	| Expr(e1,e2,e3) -> (
		match e2 with 
			| AASS -> 
				let typeE1 = check_expr env e1 in
				let typeE3 = check_expr env e3 in
				(match (typeE1, typeE3) with
					("Melody", "Melody") -> string_of_expr env e1 ^ "." ^ "addMelody(" ^ string_of_expr env e3 ^ ")"
					| ("Music", "Music") -> string_of_expr env e1 ^ "." ^ "addMusic(" ^ string_of_expr env e3 ^ ")"
					| ("Note", "Note") -> string_of_expr env e1 ^ "." ^ "addNote(" ^ string_of_expr env e3 ^ ")"
					| ("Note", "int") -> string_of_expr env e1 ^ "." ^ "plus(" ^ string_of_expr env e3 ^ ")"
					| ("Melody", "Note") -> string_of_expr env e1 ^ "." ^ "addNote(" ^ string_of_expr env e3 ^ ")"
					| _ -> string_of_expr env e1 ^ " += " ^ string_of_expr env e3
				)

			| SASS ->
				let typeE1 = check_expr env e1 in
				let typeE3 = check_expr env e3 in
				if(typeE1 = "Note" && typeE3 = "int") then 
					string_of_expr env e1 ^ "." ^ "minus(" ^ string_of_expr env e3 ^ ")"
				else  string_of_expr env e1 ^ " -= " ^ string_of_expr env e3

			| MASS ->
				let typeE1 = check_expr env e1 in
				let typeE3 = check_expr env e3 in
				(match (typeE1, typeE3) with
					("Melody", "Melody") -> string_of_expr env e1 ^ "." ^ "multipleMelody(" ^ string_of_expr env e3 ^ ")"
					| ("Music", "Music") -> string_of_expr env e1 ^ "." ^ "multipleMusic(" ^ string_of_expr env e3 ^ ")"
					| ("Melody", "int") -> string_of_expr env e1 ^ "." ^ "multipleInt(" ^ string_of_expr env e3 ^ ")"
					| _ -> string_of_expr env e1 ^ " *= " ^ string_of_expr env e3
				)
			| ASS -> string_of_expr env e1 ^ " = " ^ string_of_expr env e3

	)
	| Paren_Expr(e1) -> string_of_expr env e1
	| Array(e1,e2) -> string_of_expr env e1 ^ "[" ^ string_of_expr env e2 ^ "]"(* a[4] *)
	| Func_Call(e1,Some(a)) -> 
		let stringE = string_of_expr env e1 in
		(match stringE with
			| "print" -> "PublicFunction.print(" ^ String.concat ", " (List.rev_map (string_of_expr env) a) ^ ")"
			| "read" -> "PublicFunction.read(" ^ String.concat ", " (List.rev_map (string_of_expr env) a) ^ ")"
			| "write" -> "PublicFunction.write(" ^ String.concat ", " (List.rev_map (string_of_expr env) a) ^ ")"
			| "setNoteDefault" -> "PublicFunction.setNoteDefault(" ^ String.concat ", " (List.rev_map (string_of_expr env) a) ^ ")"
			| "changeToMillisecond" -> "PublicFunction.changeToMillisecond("^ String.concat ", " (List.rev_map (string_of_expr env) a) ^ ")"
			| "printTime" -> "PublicFunction.printTime("^ String.concat ", " (List.rev_map (string_of_expr env) a) ^ ")"
			| "sizeOf" -> "PublicFunction.sizeOf"^ String.concat ", " (List.rev_map (string_of_expr env) a) ^ ")"
			| _ -> string_of_expr env e1 ^ "(" ^ String.concat ", "(List.rev_map (string_of_expr env) a) ^ ")" (* linkdown(ip,port)*)
		)
		
	| Func_Call(e1,None) -> string_of_expr env e1 ^ "(" ^ ")" (*linkdown()*)



let rec string_of_val_declarator env decl = 
	match decl with
	| VId(s) -> s (**)
	| Array_Dec(d,Some(e)) -> string_of_val_declarator env d ^ "[" ^ string_of_expr env e ^ "]" (* a[4] *)
	| Array_Dec(d,None) -> string_of_val_declarator env d ^ "[" ^ "]" (* a[] *)

let rec string_of_init env i =
	match i with
	| Expr_Init(e) -> string_of_expr env e
	| Init(s,None)  -> (
		match s with 
		| "Note" -> "new Note()"
		| "Melody" -> "new Melody()"
		| "Music" -> "new Music()"
		| "Track" -> "new Track()"
		| _ -> s
	)
	| Init(s, Some(e)) -> (
		match s with
		| "Note" -> "new Note(" ^ String.concat ", " (List.rev_map (string_of_expr env) e) ^ ")"
		| "Meldoy" -> "new Melody(" ^ String.concat ", " (List.rev_map (string_of_expr env) e) ^ ")"
		| "Music" -> "new Musci(" ^ String.concat ", " (List.rev_map (string_of_expr env) e) ^ ")"
		| "Track" -> "new Track(" ^ String.concat ", " (List.rev_map (string_of_expr env) e) ^ ")"
		| _ -> s
	)
	| Func_Init(e)  -> (
		let typeE = type_of_init env (List.hd e) in
		match typeE with
		| "Track" -> "new ArrayList<Track>(Arrays.asList("^ String.concat "," (List.rev_map (string_of_init env) e)^"))"
		| "Note" -> "new ArrayList<Note>(Arrays.asList("^ String.concat "," (List.rev_map (string_of_init env) e)^"))"
		|  _ ->"{" ^ String.concat "," (List.rev_map (string_of_init env) e) ^ "}" 
	)

let rec string_of_dec_list env decl =
	match decl with
	| Val_Decl(v) -> string_of_val_declarator env v
	| Assignment(v,i) -> string_of_val_declarator env v ^ "=" ^ string_of_init env i
	| Dec_list(d,v) -> string_of_dec_list env d ^ ", " ^ string_of_val_declarator env v
	| Assign_list(d,v,i) -> string_of_dec_list env d ^ ", " ^ string_of_val_declarator env v ^ "= " ^ string_of_init env i



let rec string_of_stmt env stmt =
	match stmt with
	| Stmt(None) -> ";"
	| Stmt(Some(e)) -> string_of_expr env e ^ ";\n"
	| Bre_Stmt(None) -> "{\n}"
	| Bre_Stmt(Some(stmts)) -> 
		let new_scope = gen_inc_scope() in
		let env = (fst env, new_scope :: (snd env))	in
		"{\n  " ^ String.concat "\n" (List.rev_map (string_of_stmt env) stmts) ^ "\n}"
	| Dec(datatype,d) -> (
		let typed = type_of_dec_list env d in
		match typed with 
		| "array_Track"-> "List<Track>" ^ string_of_dec_list env d 
		| "array_Note" -> "List<Note>" ^ string_of_dec_list env d 
		| _ -> datatype ^ " " ^ string_of_dec_list env d ^ ";" 

	)
	| If(e,stmt) -> "if " ^ "(" ^ string_of_expr env e ^ ")" ^ string_of_stmt env stmt
	| If_else(e,stmt1,stmt2) -> 
		let strE = string_of_expr env e in
		let strIF = string_of_stmt env stmt1 in
		let strEL = string_of_stmt env stmt2 in
		"if" ^ "(" ^ strE ^ ")" ^ strIF ^ "else" ^ strEL
	| While(e,stmt) -> "while" ^ "(" ^ string_of_expr env e ^ ")" ^ string_of_stmt env stmt
	| For_complete(stmt1,stmt2,e,stmt3) -> "for" ^ "(" ^ string_of_stmt env stmt1 ^ string_of_stmt env stmt2 ^ string_of_expr env e ^ ")\n" ^ string_of_stmt env stmt3
	| For_part(stmt1,stmt2,stmt3) -> "for" ^ "(" ^ string_of_stmt env stmt1 ^ string_of_stmt env stmt2 ^ ")" ^ string_of_stmt env stmt3
	| CONTINUE -> "continue;"
	| BREAK -> "break;"
	| RETURN -> "return;"
	| Return(e) -> "return " ^ string_of_expr env e ^ ";"


let rec string_of_param env para =
	match para with
		Param(s,v) ->  s ^ " " ^ string_of_val_declarator env v


let rec string_of_func_declarator env funcDec =
	match funcDec with
		Func_dec_p(s,Some(pl)) -> s ^ "(" ^ String.concat "," (List.rev_map (string_of_param env) pl) ^ ")"
		| Func_dec_p(s,None) -> s ^ "(" ^ " " ^ ")"

let rec string_of_func_def env funcDef =
	let new_scope = gen_inc_scope() in
	let env = (fst env, new_scope :: (snd env))	in
	(match funcDef with
		Func_Def(s, d, stmts) -> 
			"public static " ^ s ^ " " ^ string_of_func_declarator env d ^ "{\n" ^ String.concat "\n" (List.map (string_of_stmt env) stmts) ^ "\n}\n")


let string_of_program env (stmts, funcs) =
  String.concat "\n" (List.rev_map (string_of_stmt env) stmts) ^ "\n" ^
  String.concat "\n" (List.map (string_of_func_def env) (List.rev funcs)) ^ "\n" 

let  writeToFile fileName progString = 
  let file = open_out ( fileName ^ ".java") in
    let content = fprintf file "%s"  progString in
		"Write finished!"

let gen_program fileName table prog = 
	let env = (table, [0]) in
	let programString = string_of_program env (fst prog, snd prog) in 
	let out = sprintf
  		"import java.io.File;\n
		import java.io.IOException;\n
		import java.util.ArrayList;\n
		import java.util.Arrays;\n
		import java.util.Iterator;\n
		import java.util.List;\n
		import definition.*;\n
		import function.PublicFunction;\n
		import com.leff.midi.*;\n
		import com.leff.midi.event.MidiEvent;\n
		import com.leff.midi.event.NoteOff;\n
		import com.leff.midi.event.NoteOn;\n
		import com.leff.midi.event.ProgramChange;\n
		import com.leff.midi.event.meta.Tempo;\n
		import com.leff.midi.event.meta.TimeSignature;\n\n
		public class %s\n{\n%s\n}" fileName programString in
	writeToFile fileName out 