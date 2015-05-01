let file = "test.mpl"
let _ =
  let lexbuf = Lexing.from_channel (open_in file) in
    let result = Parser.program Lexer.token lexbuf in
    	let string_result = Ast.string_of_program result in
      	print_string ("----OUT----\n"^string_result); print_newline(); flush stdout
;;
