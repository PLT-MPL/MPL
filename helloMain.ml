let _ =
  let lexbuf = Lexing.from_channel stdin in
    let result = HelloParser.program HelloLexer.token lexbuf in
      print_string ("----OUT----\n"^result); print_newline(); flush stdout
;;
