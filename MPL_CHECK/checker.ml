open Ast
open Table

exception Not_Found of string
exception Type_Not_Match of string
exception Need_Init of string

let current_scope = ref 0
let inc_scope (u:unit) =
	current_scope := !current_scope + 1;
	!current_scope

let rec call_list func env lst =
	match lst with
		[] -> fst env
		| h :: t -> 
			let new_table = func env h in
			let env = (new_table, snd env) in
				call_list func env t

let rec check_expr env expr =
	match expr with
		Id(s) -> 	
			let table = fst env in
			let scopes = snd env in
			let i = ref 0 in
			let scope = ref (List.hd scopes) in
			if (Hashtbl.mem table s) then 
				let typeFunc = Hashtbl.find table s in
				String.sub typeFunc 5 ((String.length typeFunc) - 5)
			else begin 
				while not (Hashtbl.mem table ((string_of_int (!scope)) ^ "_" ^ s)) do
					i := !i + 1;
					if !i >= List.length scopes then
						raise (Not_Found ("Could not find varialble " ^ s ^ "."));
					scope := List.nth scopes !i
				done;
				Hashtbl.find table ((string_of_int !scope) ^ "_" ^ s)
			end
		| IntCon(c) -> "int"
		| DoubleCon(d) -> "double"
		| BoolCon(b) -> "Boolean"
		| StrCon(s) -> "String"

		| Dot_Expr(e,s) -> 
			let typeID = check_expr env e in
			let table = fst env in
			if ((not (typeID = "Note")) && (not (typeID = "Music")) && (not (typeID = "Melody")) && (not (typeID = "Track"))) then
				raise (Type_Not_Match ("The type of \"" ^ string_of_expr e ^ "\" was expected of type Note, Melody, Track, or Music."));
			if not (Hashtbl.mem table (typeID ^ "_" ^ s)) then
				raise (Not_Found ("Could not find the function \"" ^ string_of_expr e ^ "." ^ s ^ "\"."));
			let typeFunc = Hashtbl.find table (typeID ^ "_" ^ s) in
			String.sub typeFunc (String.length typeID + 1) ((String.length typeFunc) - 1 - String.length typeID)

		| Self_Add(e) | Self_Sub(e) | Self_Sub2(e) | Self_Add2(e) -> 
			let typeID = check_expr env e in
			if not (typeID = "int") then
				raise (Type_Not_Match ("The type of \"" ^ string_of_expr e ^ "\" was expected of type int."));
			typeID

		| Not_Unary(e) -> 
			let typeID = check_expr env e in
			if not (typeID = "Boolean") then
				raise (Type_Not_Match ("The type of \"" ^ string_of_expr e ^ "\" was expected of type boolean."));
			typeID

		| Uminus(e) -> 
			let typeID = check_expr env e in
			if (not (typeID = "int")) && (not (typeID = "double")) then
				raise (Type_Not_Match ("The type of \"" ^ string_of_expr e ^ "\" was expected of type int or double."));
			typeID

		| Multi(e1,e2) -> 
			let typeE1 = check_expr env e1 in
			let typeE2 = check_expr env e2 in
			if (((typeE1 = "int") && (typeE2 = "int")) || ((typeE1 = "double") && (typeE2 = "double")) ||
				((typeE1 = "Melody") && (typeE2 = "Melody")) || ((typeE1 = "Music") && (typeE2 = "Music"))) then typeE1
			else if (((typeE1 = "Melody") && (typeE2 = "int")) ||  ((typeE1 = "int") && (typeE2 = "Melody"))) then "Melody"
			else raise (Type_Not_Match ("The type of \"" ^ string_of_expr e1 ^ "\" does not match the type of \"" ^ string_of_expr e2 ^ "\" to do this calculation."));
			
		| Add_Bin(e1,e2) ->
			let typeE1 = check_expr env e1 in
			let typeE2 = check_expr env e2 in
			if (((typeE1 = "int") && (typeE2 = "int")) || ((typeE1 = "double") && (typeE2 = "double")) ||
				((typeE1 = "Melody") && (typeE2 = "Melody")) || ((typeE1 = "Music") && (typeE2 = "Music"))) then typeE1
			else if (((typeE1 = "Note") && (typeE2 = "Note")) || ((typeE1 = "Melody") && (typeE2 = "Note")) || 
				((typeE1 = "Melody") && (typeE2 = "Note"))) then "Melody"
			else if ((typeE1 = "Note") && (typeE2 = "int")) then "Note"
			else raise (Type_Not_Match ("The type of \"" ^ string_of_expr e1 ^ "\" does not match the type of \"" ^ string_of_expr e2 ^ "\" to do this calculation."));
		
		| Sub(e1,e2) -> 
			let typeE1 = check_expr env e1 in
			let typeE2 = check_expr env e2 in
			if (((typeE1 = "int") && (typeE2 = "int")) || ((typeE1 = "double") && (typeE2 = "double")) || 
				((typeE1 = "Note") && (typeE2 = "int")) || ((typeE1 = "Melody") && (typeE2 = "Note"))) then typeE1
			else raise (Type_Not_Match ("The type of \"" ^ string_of_expr e1 ^ "\" does not match the type of \"" ^ string_of_expr e2 ^ "\" to do this calculation."));


		| Less(e1,e2) | Greater(e1,e2) | Less_Equal(e1,e2) | Greater_Equal(e1,e2) -> 
			let typeE1 = check_expr env e1 in
			let typeE2 = check_expr env e2 in
			if (not (typeE1 = "int")) && (not (typeE1 = "double")) then
					raise (Type_Not_Match ("The type of \"" ^ string_of_expr e1 ^ "\" was expected of type int or double."));
			if (not (typeE2 = "int")) && (not (typeE2 = "double")) then
					raise (Type_Not_Match ("The type of \"" ^ string_of_expr e2 ^ "\" was expected of type int or double."));
			if not (typeE1 = typeE2) then
				raise (Type_Not_Match ("The type of \"" ^ string_of_expr e1 ^ "\" does not match the type of \"" ^ string_of_expr e2 ^ "\"."));
			"Boolean"

		| Equal(e1,e2) | Non_Equal(e1,e2) -> 
			let typeE1 = check_expr env e1 in
			let typeE2 = check_expr env e2 in
			if not (typeE1 = typeE2) then
				raise (Type_Not_Match ("The type of \"" ^ string_of_expr e1 ^ "\" does not match the type of \"" ^ string_of_expr e2 ^ "\"."));
			"Boolean"

		| And(e1,e2) | Or(e1,e2) -> 
			let typeE1 = check_expr env e1 in
			let typeE2 = check_expr env e2 in
			if not (typeE1 = "Boolean") then
					raise (Type_Not_Match ("The type of \"" ^ string_of_expr e1 ^ "\" was expected of type boolean."));
			if not (typeE2 = "Boolean") then
					raise (Type_Not_Match ("The type of \"" ^ string_of_expr e2 ^ "\" was expected of type boolean."));
			"Boolean"

		| Expr(e1,e2,e3) -> 
			(match e2 with
				ASS ->  
					let typeE1 = check_expr env e1 in
					let typeE3 = check_expr env e3 in
					if not (typeE1 = typeE3) then
						raise (Type_Not_Match ("The type of \"" ^ string_of_expr e1 ^ "\" does not match the type of \"" ^ string_of_expr e3 ^ "\"."));
					typeE1
				| AASS -> 
					let typeE1 = check_expr env e1 in
					let typeE3 = check_expr env e3 in
					if (((typeE1 = "int") && (typeE3 = "int")) || ((typeE1 = "double") && (typeE3 = "double")) ||
						((typeE1 = "Melody") && (typeE3 = "Melody")) || ((typeE1 = "Music") && (typeE3 = "Music")) ||
						((typeE1 = "Note") && (typeE3 = "int")) || ((typeE1 = "Melody") && (typeE3 = "Note"))) then typeE1
					else raise (Type_Not_Match ("The type of \"" ^ string_of_expr e1 ^ "\" does not match the type of \"" ^ string_of_expr e3 ^ "\" to do this calculation."));
				| SASS -> 
					let typeE1 = check_expr env e1 in
					let typeE3 = check_expr env e3 in
					if (((typeE1 = "int") && (typeE3 = "int")) || ((typeE1 = "double") && (typeE3 = "double")) ||
						((typeE1 = "Note") && (typeE3 = "int"))) then typeE1
					else raise (Type_Not_Match ("The type of \"" ^ string_of_expr e1 ^ "\" does not match the type of \"" ^ string_of_expr e3 ^ "\" to do this calculation."));
				| MASS -> 
					let typeE1 = check_expr env e1 in
					let typeE3 = check_expr env e3 in
					if (((typeE1 = "int") && (typeE3 = "int")) || ((typeE1 = "double") && (typeE3 = "double")) ||
						((typeE1 = "Melody") && (typeE3 = "Melody")) || ((typeE1 = "Music") && (typeE3 = "Music")) ||
						((typeE1 = "Melody") && (typeE3 = "int"))) then typeE1
					else raise (Type_Not_Match ("The type of \"" ^ string_of_expr e1 ^ "\" does not match the type of \"" ^ string_of_expr e3 ^ "\" to do this calculation."));)

		| Paren_Expr(e1) -> check_expr env e1

		| Array(e1,e2) -> 
			let typeE1 = check_expr env e1 in
			let typeE2 = check_expr env e2 in
			if not (typeE2 = "int") then
				raise (Type_Not_Match ("The type of \"" ^ string_of_expr e2 ^ "\" was expected of type int."));
			if not ((String.sub typeE1 0 5) = "array") then
				raise (Type_Not_Match ("The type of \"" ^ string_of_expr e1 ^ "\" was expected of type array."));
			String.sub typeE1 6 ((String.length typeE1)-6)

		| Func_Call(e1,Some(a)) -> 
			let typeE1 = check_expr env e1 in
			let typeA = String.concat "_"(List.rev_map (check_expr env) a) in
			let l = String.length typeA in
			if (((String.length typeE1) <= l) || (not ((String.sub typeE1 0 l) = typeA))) then
				raise (Type_Not_Match ("Could not find the function \"" ^ string_of_expr e1 ^ "\" of type Function(" ^ typeA ^ ")."));
			String.sub typeE1 (l+1) ((String.length typeE1)-l-1)

		| Func_Call(e1,None) -> 
			let typeE1 = check_expr env e1 in
			if not ((String.sub typeE1 0 4) = "void") then
				raise (Type_Not_Match ("Could not find the function \"" ^ string_of_expr e1 ^ "\" of type Function(void)."));
			String.sub typeE1 5 ((String.length typeE1)-5)

let rec add_val arr datatype env v =
	match v with
		VId(vid) ->
			let table = fst env in
			let scope = List.hd (snd env) in
			if Hashtbl.mem table ((string_of_int scope) ^ "_" ^ vid) then
				raise (Failure ("Varialble " ^ vid ^ " has alreadly been declared."));
			let typeID = ref "" in
				for i = 1 to arr do
					typeID := !typeID ^ "array" ^ "_"
				done;
				typeID := !typeID ^ datatype;
				Hashtbl.add table ((string_of_int scope) ^ "_" ^ vid) !typeID;
				table

		| Array_Dec(vd, Some(e)) ->
			let typeE = check_expr env e in
			if not (typeE = "int") then
				raise (Type_Not_Match ("The type of \"" ^ string_of_expr e ^ "\" was expected of type int."));
			add_val (arr + 1) datatype env vd 
		| Array_Dec(vd, None) ->
			add_val (arr + 1) datatype env vd

let rec find_name = function 
	VId(vid) -> vid
	| Array_Dec(vd, e) -> find_name vd

let type_of_para env d =
	match d with
		Param(t, v) -> 
			let table = add_val 0 t env v in
			let name = find_name v in
			let scope = List.hd (snd env) in
				Hashtbl.find table ((string_of_int scope) ^ "_" ^ name)


let rec add_func datatype env f =
	match f with
		Func_dec_p(s, None) ->
			let table = fst env in
			if Hashtbl.mem table s then
				raise (Failure ("Function " ^ s ^ " has alreadly been declared."));
			let typeID = "void_void_" ^ datatype in
				Hashtbl.add table s typeID;
				table
		| Func_dec_p(s,Some(pl)) ->
			let table = fst env in
			if Hashtbl.mem table s then
				raise (Failure ("Function " ^ s ^ " has alreadly been declared."));
			let typeID = "void_" ^ String.concat "_" (List.rev_map (type_of_para env) pl) ^ "_" ^  datatype in
				Hashtbl.add table s typeID;
				table

let rec check_init datatype env i =
	match i with
		Expr_Init(e) -> check_expr env e
		| Init(s, None) -> 
			if ((not (s = "Note")) && (not (s = "Music")) && (not (s = "Melody")) && (not (s = "Track"))) then
				raise (Type_Not_Match ("The type was expected of type Note, Melody, Track, or Music."));
			s
		| Init(s, Some(e)) -> 
			let table = fst env in
			if ((not (s = "Note")) && (not (s = "Music")) && (not (s = "Melody")) && (not (s = "Track"))) then
				raise (Type_Not_Match ("The type was expected of type Note, Melody, Track, or Music."));
			let e_list = List.rev_map (check_expr env) e in
			let l = List.length e_list in
			let h = List.hd e_list in
			if ((l = 1) && (h = s)) then s
			else begin
				let typeFunc = Hashtbl.find table s in
				let typeA = String.concat "_" e_list in

				if (((String.length typeA) <= (String.length typeFunc)) &&
					 ((String.sub typeFunc 0 (String.length typeA)) = typeA)) then s
				else raise (Type_Not_Match ("The arguments do not match."));
			end
		| Func_Init(e) -> 
			let eql a = (datatype = a) in
			if not (List.for_all eql (List.map (check_init datatype env) e)) then
				raise (Type_Not_Match ("The expressions in the list are expected of type " ^ datatype ^ "."));
			"array_" ^ datatype

let rec check_dec_list datatype env lst  =
	match lst with
		Val_Decl(v) -> add_val 0 datatype env v
		| Assignment(v,i) -> 
			let table = add_val 0 datatype env v in
			let scope = List.hd (snd env) in
			let typeV = Hashtbl.find table ((string_of_int scope) ^ "_" ^ (find_name v)) in
			let typeI = check_init datatype env i in
			if not (typeI = typeV) then
				raise (Type_Not_Match ("The type of \"" ^ string_of_init i ^ "\" was expected of type " ^ datatype ^ "."));
			table
			
		| Dec_list(d,v) -> 
			if ( (datatype = "Note") || (datatype = "Music") || (datatype = "Melody") || (datatype = "Track")) then
				raise (Need_Init ("The variable " ^ string_of_val_declarator v ^ " need to be initialized when declaring."));
			let env = (check_dec_list datatype env d, snd env) in
				add_val 0 datatype env v
		| Assign_list(d,v,i) ->
			let env = (check_dec_list datatype env d, snd env) in
			let typeI = check_init datatype env i in
			if not (typeI = datatype) then
				raise (Type_Not_Match ("The type of \"" ^ string_of_init i ^ "\" was expected of type " ^ datatype ^ "."));
			add_val 0 datatype env v

let rec check_stmt env stmt =
	match stmt with
		Stmt(None) -> fst env
		| Stmt(Some(e)) -> 
			let typeID = check_expr env e in
				fst env
		| Dec(datatype,d) -> check_dec_list datatype env d
		| Bre_Stmt(None) -> fst env
		| Bre_Stmt(Some(stmts)) -> 
			let new_scope = inc_scope() in
			let env = (fst env, new_scope :: (snd env))	in
				call_list check_stmt env stmts

		| If(e,stmt) -> 
			let typeID = check_expr env e in
			if not (typeID = "Boolean") then
				raise (Type_Not_Match ("The type of \"" ^ string_of_expr e ^ "\" was expected of type boolean."));
			check_stmt env stmt
		| If_else(e,stmt1,stmt2) -> 
			let typeID = check_expr env e in
			if not (typeID = "Boolean") then
				raise (Type_Not_Match ("The type of \"" ^ string_of_expr e ^ "\" was expected of type boolean."));
			let table = check_stmt env stmt1 in
			let env = (table, snd env) in
				check_stmt env stmt2

		| While(e,stmt) -> 
			let typeID = check_expr env e in
			if not (typeID = "Boolean") then
				raise (Type_Not_Match ("The type of \"" ^ string_of_expr e ^ "\" was expected of type boolean."));
			let table = fst env in
			let previous_loop = Hashtbl.find table "current_loop" in
			Hashtbl.replace table "current_loop" "true";
			let env = (table, snd env) in
			let table = check_stmt env stmt in
			Hashtbl.replace table "current_loop" previous_loop;
			table

		| For_complete(stmt1,stmt2,e,stmt3) -> 
			let table = check_stmt env stmt1 in
			let env = (table, snd env) in
			let table = check_stmt env stmt2 in
			let env = (table, snd env) in
			let typeID = check_expr env e in
			let previous_loop = Hashtbl.find table "current_loop" in
			Hashtbl.replace table "current_loop" "true";
			let env = (table, snd env) in
			let table = check_stmt env stmt3 in
			Hashtbl.replace table "current_loop" previous_loop;
			table

		| For_part(stmt1,stmt2,stmt3) -> 
			let table = check_stmt env stmt1 in
			let env = (table, snd env) in
			let table = check_stmt env stmt2 in
			let previous_loop = Hashtbl.find table "current_loop" in
			Hashtbl.replace table "current_loop" "true";
			let env = (table, snd env) in
			let table = check_stmt env stmt3 in
			Hashtbl.replace table "current_loop" previous_loop;
			table

		| CONTINUE -> 
			let table = fst env in
			let loop = Hashtbl.find table "current_loop" in
			if not (loop = "true") then
				raise (Type_Not_Match ("There is no loop to match the \"continue\"."));
			table
		| BREAK ->
			let table = fst env in
			let loop = Hashtbl.find table "current_loop" in
			if not (loop = "true") then
				raise (Type_Not_Match ("There is no loop to match the \"break\"."));
			table

		| RETURN ->
			let table = fst env in
			let typeID = Hashtbl.find table "current_function_type" in
			if not (typeID = "void") then
				raise (Type_Not_Match ("The type of return value is expected of type " ^ typeID ^ "."));
			table
		| Return(e) ->
			let typeE = check_expr env e in
			let table = fst env in
			let typeID = Hashtbl.find table "current_function_type" in
			if not (typeID = typeE) then
				raise (Type_Not_Match ("The type of return value is expected of type " ^ typeID ^ "."));
			table

let check_func_def env func =
	match func with
	Func_Def(s, d, stmts) -> 
		let new_scope = inc_scope() in
		let env = (fst env, new_scope :: (snd env))	in
		let table = add_func s env d in
		Hashtbl.replace table "current_function_type" s;
		let env = (table, snd env)	in
			call_list check_stmt env stmts

let print key value =
	print_string (key ^ " " ^ value ^ "\n")

let check_program (stmts, funcs) =
	let table = base_table in
	let env = (table, [0]) in
	let table = call_list check_stmt env stmts in
	let table = call_list check_func_def env (List.rev funcs) in
		print_string "--------------------- TABLE -----------------------\n";
		Hashtbl.iter print table;
		print_string "--------------------- TABLE -----------------------\n";
		inc_scope()
