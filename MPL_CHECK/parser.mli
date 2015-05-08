type token =
  | SEMI
  | LPA
  | RPA
  | LBRK
  | RBRK
  | LBRE
  | RBRE
  | EOF
  | DOT
  | COM
  | ASS
  | AASS
  | SASS
  | MASS
  | ADD
  | SUB
  | MUL
  | DIV
  | ADD2
  | SUB2
  | NOT
  | OR
  | AND
  | EQ
  | NEQ
  | LT
  | GT
  | LEQ
  | GEQ
  | IF
  | ELSE
  | WHILE
  | FOR
  | RETURN
  | BREAK
  | CONTINUE
  | STR_CON of (string)
  | DATATYPE of (string)
  | BOOL_CON of (bool)
  | INT_CON of (int)
  | DOUB_CON of (float)
  | INS_CON of (string)
  | PIT_CON of (string)
  | ID of (string)

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
