let file = "test.mpl"
let _ =
  let lexbuf = Lexing.from_channel (open_in file) in
    let result = Parser.program Lexer.token lexbuf in
    	let checked = Checker.check_program result in
    	()
    	(* let string_result = Ast.string_of_program result in
      		print_string ("----OUT----\n"^string_result^(string_of_int checked)); print_newline(); flush stdout *)
;;