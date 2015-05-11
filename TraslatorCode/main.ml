open Printf
    
(*  let () =
   for i = 0 to Array.length Sys.argv - 1 do
     printf "[%i] %s\n" i Sys.argv.(i)
   done;; *)


let file = Sys.argv.(1)
let _ =
  let lexbuf = Lexing.from_channel (open_in file) in
    let result = Parser.program Lexer.token lexbuf in
    	let table = Checker.check_program result in
    	Javagen.gen_program Sys.argv.(2) table result
    	(* let string_result = Ast.string_of_program result in
      		print_string ("----OUT----\n"^string_result^(string_of_int checked)); print_newline(); flush stdout *)
;;