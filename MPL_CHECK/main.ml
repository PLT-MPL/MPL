let file = "test.mpl"
let _ =
  let lexbuf = Lexing.from_channel (open_in file) in
    let result = Parser.program Lexer.token lexbuf in
    	let table = Checker.check_program result in
    	Javagen.gen_program "test" table result
    	(* let string_result = Ast.string_of_program result in
      		print_string ("----OUT----\n"^string_result^(string_of_int checked)); print_newline(); flush stdout *)
;;