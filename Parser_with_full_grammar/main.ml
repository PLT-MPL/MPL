let file = "test.mpl"
let _ =
  let lexbuf = Lexing.from_channel (open_in file) in
    let result = Parser.program Lexer.token lexbuf in
      print_string ("----OUT----\n"^result); print_newline(); flush stdout
;;
