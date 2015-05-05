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

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"
 
	open Ast
# 53 "parser.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPA *);
  259 (* RPA *);
  260 (* LBRK *);
  261 (* RBRK *);
  262 (* LBRE *);
  263 (* RBRE *);
    0 (* EOF *);
  264 (* DOT *);
  265 (* COM *);
  266 (* ASS *);
  267 (* AASS *);
  268 (* SASS *);
  269 (* MASS *);
  270 (* ADD *);
  271 (* SUB *);
  272 (* MUL *);
  273 (* DIV *);
  274 (* ADD2 *);
  275 (* SUB2 *);
  276 (* NOT *);
  277 (* OR *);
  278 (* AND *);
  279 (* EQ *);
  280 (* NEQ *);
  281 (* LT *);
  282 (* GT *);
  283 (* LEQ *);
  284 (* GEQ *);
  285 (* IF *);
  286 (* ELSE *);
  287 (* WHILE *);
  288 (* FOR *);
  289 (* RETURN *);
  290 (* BREAK *);
  291 (* CONTINUE *);
    0|]

let yytransl_block = [|
  292 (* STR_CON *);
  293 (* DATATYPE *);
  294 (* BOOL_CON *);
  295 (* INT_CON *);
  296 (* DOUB_CON *);
  297 (* INS_CON *);
  298 (* PIT_CON *);
  299 (* ID *);
    0|]

let yylhs = "\255\255\
\002\000\002\000\002\000\002\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\006\000\006\000\006\000\
\006\000\006\000\007\000\007\000\008\000\008\000\008\000\009\000\
\009\000\009\000\009\000\009\000\010\000\010\000\010\000\011\000\
\011\000\012\000\012\000\013\000\013\000\013\000\013\000\004\000\
\004\000\005\000\005\000\005\000\014\000\014\000\014\000\014\000\
\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
\014\000\014\000\015\000\015\000\015\000\017\000\017\000\017\000\
\018\000\018\000\018\000\018\000\019\000\019\000\016\000\016\000\
\016\000\016\000\020\000\021\000\021\000\021\000\022\000\022\000\
\023\000\023\000\023\000\024\000\001\000\001\000\001\000\000\000"

let yylen = "\002\000\
\001\000\001\000\001\000\001\000\001\000\001\000\003\000\004\000\
\003\000\004\000\003\000\002\000\002\000\001\000\002\000\002\000\
\002\000\002\000\001\000\003\000\001\000\003\000\003\000\001\000\
\003\000\003\000\003\000\003\000\001\000\003\000\003\000\001\000\
\003\000\001\000\003\000\001\000\001\000\001\000\001\000\001\000\
\003\000\000\000\001\000\003\000\001\000\002\000\002\000\003\000\
\003\000\005\000\007\000\005\000\007\000\006\000\002\000\002\000\
\002\000\003\000\000\000\001\000\002\000\001\000\004\000\003\000\
\001\000\003\000\004\000\003\000\001\000\003\000\001\000\003\000\
\003\000\005\000\002\000\000\000\001\000\003\000\001\000\003\000\
\004\000\004\000\003\000\005\000\000\000\002\000\002\000\002\000"

let yydefred = "\000\000\
\085\000\000\000\000\000\045\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\004\000\000\000\003\000\001\000\002\000\005\000\006\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\086\000\087\000\000\000\047\000\000\000\060\000\000\000\017\000\
\015\000\016\000\018\000\000\000\000\000\000\000\057\000\000\000\
\056\000\055\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\012\000\013\000\046\000\036\000\037\000\038\000\039\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\007\000\062\000\048\000\061\000\
\000\000\000\000\000\000\058\000\000\000\049\000\000\000\000\000\
\000\000\000\000\009\000\043\000\000\000\000\000\011\000\041\000\
\020\000\019\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\083\000\
\000\000\077\000\000\000\000\000\000\000\064\000\000\000\000\000\
\000\000\065\000\072\000\000\000\008\000\000\000\010\000\000\000\
\052\000\000\000\000\000\000\000\081\000\000\000\082\000\000\000\
\000\000\063\000\069\000\000\000\000\000\084\000\044\000\000\000\
\054\000\000\000\000\000\078\000\080\000\074\000\068\000\000\000\
\066\000\000\000\051\000\053\000\070\000\067\000"

let yydgoto = "\002\000\
\003\000\023\000\024\000\025\000\093\000\026\000\027\000\028\000\
\029\000\030\000\031\000\032\000\065\000\038\000\039\000\052\000\
\053\000\123\000\140\000\114\000\115\000\116\000\054\000\034\000"

let yysindex = "\011\000\
\000\000\000\000\041\000\000\000\138\000\133\255\138\000\138\000\
\138\000\138\000\020\255\041\255\044\255\016\255\047\255\057\255\
\000\000\040\255\000\000\000\000\000\000\000\000\000\000\123\255\
\085\255\185\255\072\255\089\255\196\255\158\255\069\255\079\255\
\000\000\000\000\102\255\000\000\073\255\000\000\173\255\000\000\
\000\000\000\000\000\000\138\000\138\000\081\000\000\000\118\255\
\000\000\000\000\126\255\007\255\043\255\124\255\059\255\138\000\
\090\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\138\000\138\000\138\000\138\000\138\000\138\000\138\000\138\000\
\138\000\138\000\138\000\138\000\000\000\000\000\000\000\000\000\
\134\255\143\255\081\000\000\000\000\255\000\000\073\255\087\000\
\074\255\081\000\000\000\000\000\078\255\144\255\000\000\000\000\
\000\000\000\000\072\255\072\255\089\255\089\255\089\255\089\255\
\196\255\196\255\158\255\069\255\081\000\081\000\126\000\000\000\
\073\255\000\000\087\255\098\255\140\255\000\000\008\255\074\255\
\156\255\000\000\000\000\213\255\000\000\138\000\000\000\157\255\
\000\000\081\000\153\255\190\255\000\000\162\255\000\000\163\255\
\074\255\000\000\000\000\014\255\132\000\000\000\000\000\081\000\
\000\000\081\000\073\255\000\000\000\000\000\000\000\000\074\255\
\000\000\151\255\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\201\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\179\000\
\000\000\207\000\235\000\063\001\045\000\175\001\023\255\154\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\010\255\000\000\024\255\000\000\194\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\208\255\000\000\000\000\000\000\
\000\000\211\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\007\001\035\001\072\001\100\001\109\001\137\001\
\146\001\170\001\180\001\117\255\000\000\000\000\000\000\000\000\
\174\255\000\000\000\000\000\000\048\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\
\000\000\000\000\000\000\175\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\194\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\251\255\084\000\253\255\118\000\165\000\
\116\000\151\000\153\000\139\000\000\000\255\255\140\000\000\000\
\184\255\146\255\000\000\104\000\000\000\000\000\000\000\000\000"

let yytablesize = 714
let yytable = "\035\000\
\050\000\033\000\112\000\040\000\041\000\042\000\043\000\086\000\
\048\000\139\000\062\000\001\000\138\000\062\000\117\000\087\000\
\047\000\005\000\062\000\062\000\151\000\044\000\152\000\034\000\
\071\000\034\000\150\000\034\000\076\000\034\000\007\000\034\000\
\071\000\008\000\009\000\010\000\113\000\080\000\081\000\082\000\
\132\000\157\000\045\000\034\000\083\000\046\000\088\000\049\000\
\073\000\092\000\094\000\017\000\089\000\019\000\020\000\021\000\
\073\000\050\000\022\000\096\000\005\000\091\000\097\000\098\000\
\098\000\098\000\098\000\098\000\098\000\098\000\098\000\098\000\
\098\000\007\000\132\000\005\000\008\000\009\000\010\000\120\000\
\125\000\111\000\051\000\122\000\098\000\060\000\126\000\066\000\
\007\000\133\000\075\000\008\000\009\000\010\000\017\000\134\000\
\019\000\020\000\021\000\076\000\135\000\022\000\067\000\068\000\
\077\000\131\000\136\000\128\000\129\000\017\000\121\000\019\000\
\020\000\021\000\122\000\078\000\022\000\035\000\084\000\035\000\
\143\000\035\000\080\000\035\000\055\000\035\000\056\000\085\000\
\145\000\090\000\057\000\122\000\095\000\004\000\005\000\092\000\
\109\000\035\000\006\000\036\000\058\000\059\000\155\000\088\000\
\156\000\110\000\122\000\007\000\127\000\137\000\008\000\009\000\
\010\000\158\000\040\000\146\000\040\000\141\000\040\000\126\000\
\040\000\011\000\040\000\012\000\013\000\014\000\015\000\016\000\
\017\000\037\000\019\000\020\000\021\000\004\000\005\000\022\000\
\079\000\075\000\006\000\079\000\073\000\074\000\079\000\075\000\
\099\000\100\000\144\000\007\000\105\000\106\000\008\000\009\000\
\010\000\088\000\061\000\062\000\063\000\064\000\147\000\149\000\
\088\000\011\000\042\000\012\000\013\000\014\000\015\000\016\000\
\017\000\037\000\019\000\020\000\021\000\004\000\005\000\022\000\
\076\000\059\000\006\000\142\000\069\000\070\000\071\000\072\000\
\154\000\107\000\119\000\007\000\108\000\124\000\008\000\009\000\
\010\000\101\000\102\000\103\000\104\000\148\000\000\000\000\000\
\000\000\011\000\000\000\012\000\013\000\014\000\015\000\016\000\
\017\000\037\000\019\000\020\000\021\000\000\000\000\000\022\000\
\000\000\050\000\050\000\050\000\000\000\000\000\050\000\050\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\050\000\
\000\000\000\000\050\000\050\000\050\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\050\000\000\000\050\000\
\050\000\050\000\050\000\050\000\050\000\050\000\050\000\050\000\
\050\000\004\000\005\000\050\000\000\000\029\000\006\000\029\000\
\000\000\029\000\000\000\029\000\000\000\029\000\000\000\007\000\
\000\000\000\000\008\000\009\000\010\000\000\000\000\000\000\000\
\000\000\029\000\029\000\029\000\029\000\011\000\000\000\012\000\
\013\000\014\000\015\000\016\000\017\000\018\000\019\000\020\000\
\021\000\004\000\005\000\022\000\000\000\000\000\006\000\000\000\
\005\000\000\000\000\000\118\000\000\000\000\000\000\000\007\000\
\000\000\000\000\008\000\009\000\010\000\007\000\000\000\000\000\
\008\000\009\000\010\000\000\000\000\000\011\000\000\000\012\000\
\013\000\014\000\015\000\016\000\017\000\037\000\019\000\020\000\
\021\000\000\000\017\000\022\000\019\000\020\000\021\000\005\000\
\130\000\022\000\000\000\000\000\000\000\005\000\153\000\000\000\
\000\000\000\000\000\000\005\000\007\000\000\000\000\000\008\000\
\009\000\010\000\007\000\000\000\000\000\008\000\009\000\010\000\
\007\000\000\000\000\000\008\000\009\000\010\000\000\000\000\000\
\000\000\017\000\000\000\019\000\020\000\021\000\000\000\017\000\
\022\000\019\000\020\000\021\000\000\000\017\000\022\000\019\000\
\020\000\021\000\000\000\014\000\022\000\014\000\000\000\014\000\
\000\000\014\000\000\000\014\000\014\000\014\000\014\000\014\000\
\014\000\014\000\014\000\000\000\000\000\000\000\000\000\014\000\
\014\000\014\000\014\000\014\000\014\000\014\000\014\000\019\000\
\000\000\019\000\000\000\019\000\000\000\019\000\000\000\019\000\
\000\000\000\000\000\000\000\000\019\000\019\000\019\000\000\000\
\000\000\000\000\000\000\019\000\019\000\019\000\019\000\019\000\
\019\000\019\000\019\000\021\000\000\000\021\000\000\000\021\000\
\000\000\021\000\000\000\021\000\000\000\000\000\000\000\000\000\
\021\000\021\000\000\000\000\000\000\000\000\000\000\000\021\000\
\021\000\021\000\021\000\021\000\021\000\021\000\021\000\022\000\
\000\000\022\000\000\000\022\000\000\000\022\000\000\000\022\000\
\000\000\000\000\000\000\000\000\022\000\022\000\000\000\000\000\
\000\000\000\000\000\000\022\000\022\000\022\000\022\000\022\000\
\022\000\022\000\022\000\023\000\000\000\023\000\000\000\023\000\
\000\000\023\000\000\000\023\000\000\000\000\000\000\000\000\000\
\023\000\023\000\000\000\000\000\000\000\000\000\000\000\023\000\
\023\000\023\000\023\000\023\000\023\000\023\000\023\000\024\000\
\000\000\024\000\000\000\024\000\000\000\024\000\000\000\024\000\
\025\000\000\000\025\000\000\000\025\000\000\000\025\000\000\000\
\025\000\000\000\000\000\024\000\024\000\024\000\024\000\024\000\
\024\000\024\000\024\000\000\000\025\000\025\000\025\000\025\000\
\025\000\025\000\025\000\025\000\026\000\000\000\026\000\000\000\
\026\000\000\000\026\000\000\000\026\000\027\000\000\000\027\000\
\000\000\027\000\000\000\027\000\000\000\027\000\000\000\000\000\
\026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
\000\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
\027\000\028\000\000\000\028\000\000\000\028\000\000\000\028\000\
\000\000\028\000\030\000\000\000\030\000\000\000\030\000\000\000\
\030\000\000\000\030\000\000\000\000\000\028\000\028\000\028\000\
\028\000\028\000\028\000\028\000\028\000\000\000\030\000\030\000\
\030\000\030\000\031\000\000\000\031\000\000\000\031\000\032\000\
\031\000\032\000\031\000\032\000\033\000\032\000\033\000\032\000\
\033\000\000\000\033\000\000\000\033\000\000\000\031\000\031\000\
\031\000\031\000\000\000\032\000\032\000\000\000\000\000\000\000\
\033\000\033\000"

let yycheck = "\005\000\
\000\000\003\000\003\001\007\000\008\000\009\000\010\000\001\001\
\014\000\120\000\001\001\001\000\005\001\004\001\087\000\009\001\
\001\001\002\001\009\001\010\001\007\001\002\001\009\001\001\001\
\001\001\003\001\137\000\005\001\021\001\007\001\015\001\009\001\
\009\001\018\001\019\001\020\001\037\001\039\000\044\000\045\000\
\113\000\152\000\002\001\021\001\046\000\002\001\004\001\001\001\
\001\001\055\000\056\000\036\001\010\001\038\001\039\001\040\001\
\009\001\001\001\043\001\065\000\002\001\003\001\066\000\067\000\
\068\000\069\000\070\000\071\000\072\000\073\000\074\000\075\000\
\076\000\015\001\147\000\002\001\018\001\019\001\020\001\006\001\
\003\001\083\000\043\001\089\000\088\000\001\001\009\001\016\001\
\015\001\003\001\022\001\018\001\019\001\020\001\036\001\009\001\
\038\001\039\001\040\001\021\001\003\001\043\001\014\001\015\001\
\003\001\111\000\009\001\109\000\110\000\036\001\037\001\038\001\
\039\001\040\001\120\000\043\001\043\001\001\001\001\001\003\001\
\126\000\005\001\124\000\007\001\002\001\009\001\004\001\002\001\
\130\000\006\001\008\001\137\000\043\001\001\001\002\001\141\000\
\003\001\021\001\006\001\007\001\018\001\019\001\144\000\004\001\
\146\000\003\001\152\000\015\001\005\001\010\001\018\001\019\001\
\020\001\003\001\001\001\003\001\003\001\002\001\005\001\009\001\
\007\001\029\001\009\001\031\001\032\001\033\001\034\001\035\001\
\036\001\037\001\038\001\039\001\040\001\001\001\002\001\043\001\
\003\001\003\001\006\001\007\001\023\001\024\001\009\001\009\001\
\067\000\068\000\030\001\015\001\073\000\074\000\018\001\019\001\
\020\001\004\001\010\001\011\001\012\001\013\001\037\001\037\001\
\000\000\029\001\009\001\031\001\032\001\033\001\034\001\035\001\
\036\001\037\001\038\001\039\001\040\001\001\001\002\001\043\001\
\009\001\007\001\006\001\007\001\025\001\026\001\027\001\028\001\
\141\000\075\000\088\000\015\001\076\000\090\000\018\001\019\001\
\020\001\069\000\070\000\071\000\072\000\134\000\255\255\255\255\
\255\255\029\001\255\255\031\001\032\001\033\001\034\001\035\001\
\036\001\037\001\038\001\039\001\040\001\255\255\255\255\043\001\
\255\255\001\001\002\001\003\001\255\255\255\255\006\001\007\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\015\001\
\255\255\255\255\018\001\019\001\020\001\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\029\001\255\255\031\001\
\032\001\033\001\034\001\035\001\036\001\037\001\038\001\039\001\
\040\001\001\001\002\001\043\001\255\255\001\001\006\001\003\001\
\255\255\005\001\255\255\007\001\255\255\009\001\255\255\015\001\
\255\255\255\255\018\001\019\001\020\001\255\255\255\255\255\255\
\255\255\021\001\022\001\023\001\024\001\029\001\255\255\031\001\
\032\001\033\001\034\001\035\001\036\001\037\001\038\001\039\001\
\040\001\001\001\002\001\043\001\255\255\255\255\006\001\255\255\
\002\001\255\255\255\255\005\001\255\255\255\255\255\255\015\001\
\255\255\255\255\018\001\019\001\020\001\015\001\255\255\255\255\
\018\001\019\001\020\001\255\255\255\255\029\001\255\255\031\001\
\032\001\033\001\034\001\035\001\036\001\037\001\038\001\039\001\
\040\001\255\255\036\001\043\001\038\001\039\001\040\001\002\001\
\003\001\043\001\255\255\255\255\255\255\002\001\003\001\255\255\
\255\255\255\255\255\255\002\001\015\001\255\255\255\255\018\001\
\019\001\020\001\015\001\255\255\255\255\018\001\019\001\020\001\
\015\001\255\255\255\255\018\001\019\001\020\001\255\255\255\255\
\255\255\036\001\255\255\038\001\039\001\040\001\255\255\036\001\
\043\001\038\001\039\001\040\001\255\255\036\001\043\001\038\001\
\039\001\040\001\255\255\001\001\043\001\003\001\255\255\005\001\
\255\255\007\001\255\255\009\001\010\001\011\001\012\001\013\001\
\014\001\015\001\016\001\255\255\255\255\255\255\255\255\021\001\
\022\001\023\001\024\001\025\001\026\001\027\001\028\001\001\001\
\255\255\003\001\255\255\005\001\255\255\007\001\255\255\009\001\
\255\255\255\255\255\255\255\255\014\001\015\001\016\001\255\255\
\255\255\255\255\255\255\021\001\022\001\023\001\024\001\025\001\
\026\001\027\001\028\001\001\001\255\255\003\001\255\255\005\001\
\255\255\007\001\255\255\009\001\255\255\255\255\255\255\255\255\
\014\001\015\001\255\255\255\255\255\255\255\255\255\255\021\001\
\022\001\023\001\024\001\025\001\026\001\027\001\028\001\001\001\
\255\255\003\001\255\255\005\001\255\255\007\001\255\255\009\001\
\255\255\255\255\255\255\255\255\014\001\015\001\255\255\255\255\
\255\255\255\255\255\255\021\001\022\001\023\001\024\001\025\001\
\026\001\027\001\028\001\001\001\255\255\003\001\255\255\005\001\
\255\255\007\001\255\255\009\001\255\255\255\255\255\255\255\255\
\014\001\015\001\255\255\255\255\255\255\255\255\255\255\021\001\
\022\001\023\001\024\001\025\001\026\001\027\001\028\001\001\001\
\255\255\003\001\255\255\005\001\255\255\007\001\255\255\009\001\
\001\001\255\255\003\001\255\255\005\001\255\255\007\001\255\255\
\009\001\255\255\255\255\021\001\022\001\023\001\024\001\025\001\
\026\001\027\001\028\001\255\255\021\001\022\001\023\001\024\001\
\025\001\026\001\027\001\028\001\001\001\255\255\003\001\255\255\
\005\001\255\255\007\001\255\255\009\001\001\001\255\255\003\001\
\255\255\005\001\255\255\007\001\255\255\009\001\255\255\255\255\
\021\001\022\001\023\001\024\001\025\001\026\001\027\001\028\001\
\255\255\021\001\022\001\023\001\024\001\025\001\026\001\027\001\
\028\001\001\001\255\255\003\001\255\255\005\001\255\255\007\001\
\255\255\009\001\001\001\255\255\003\001\255\255\005\001\255\255\
\007\001\255\255\009\001\255\255\255\255\021\001\022\001\023\001\
\024\001\025\001\026\001\027\001\028\001\255\255\021\001\022\001\
\023\001\024\001\001\001\255\255\003\001\255\255\005\001\001\001\
\007\001\003\001\009\001\005\001\001\001\007\001\003\001\009\001\
\005\001\255\255\007\001\255\255\009\001\255\255\021\001\022\001\
\023\001\024\001\255\255\021\001\022\001\255\255\255\255\255\255\
\021\001\022\001"

let yynames_const = "\
  SEMI\000\
  LPA\000\
  RPA\000\
  LBRK\000\
  RBRK\000\
  LBRE\000\
  RBRE\000\
  EOF\000\
  DOT\000\
  COM\000\
  ASS\000\
  AASS\000\
  SASS\000\
  MASS\000\
  ADD\000\
  SUB\000\
  MUL\000\
  DIV\000\
  ADD2\000\
  SUB2\000\
  NOT\000\
  OR\000\
  AND\000\
  EQ\000\
  NEQ\000\
  LT\000\
  GT\000\
  LEQ\000\
  GEQ\000\
  IF\000\
  ELSE\000\
  WHILE\000\
  FOR\000\
  RETURN\000\
  BREAK\000\
  CONTINUE\000\
  "

let yynames_block = "\
  STR_CON\000\
  DATATYPE\000\
  BOOL_CON\000\
  INT_CON\000\
  DOUB_CON\000\
  INS_CON\000\
  PIT_CON\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 26 "parser.mly"
              ( IntCon _1 )
# 448 "parser.ml"
               : 'constant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 27 "parser.mly"
               ( DoubleCon _1 )
# 455 "parser.ml"
               : 'constant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 28 "parser.mly"
               ( BoolCon _1 )
# 462 "parser.ml"
               : 'constant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 29 "parser.mly"
              ( StrCon _1 )
# 469 "parser.ml"
               : 'constant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 33 "parser.mly"
            ( Id _1 )
# 476 "parser.ml"
               : 'primary_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'constant) in
    Obj.repr(
# 34 "parser.mly"
                 ( _1 )
# 483 "parser.ml"
               : 'primary_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 35 "parser.mly"
                    ( Paren_Expr _2 )
# 490 "parser.ml"
               : 'primary_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'primary_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'arg_expr_list) in
    Obj.repr(
# 36 "parser.mly"
                                       ( Func_Call(_1 , Some(_3)) )
# 498 "parser.ml"
               : 'primary_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'primary_expr) in
    Obj.repr(
# 37 "parser.mly"
                           ( Func_Call(_1, None) )
# 505 "parser.ml"
               : 'primary_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'primary_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 38 "parser.mly"
                                ( Array(_1,_3))
# 513 "parser.ml"
               : 'primary_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'primary_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 39 "parser.mly"
                          ( Dot_Expr(_1,_3) )
# 521 "parser.ml"
               : 'primary_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'primary_expr) in
    Obj.repr(
# 40 "parser.mly"
                        ( Self_Add (_1) )
# 528 "parser.ml"
               : 'primary_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'primary_expr) in
    Obj.repr(
# 41 "parser.mly"
                        ( Self_Sub (_1))
# 535 "parser.ml"
               : 'primary_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'primary_expr) in
    Obj.repr(
# 44 "parser.mly"
                  ( _1 )
# 542 "parser.ml"
               : 'unary_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'unary_expr) in
    Obj.repr(
# 45 "parser.mly"
                    ( Self_Add2 (_2) )
# 549 "parser.ml"
               : 'unary_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'unary_expr) in
    Obj.repr(
# 46 "parser.mly"
                    ( Self_Sub2 (_2) )
# 556 "parser.ml"
               : 'unary_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'unary_expr) in
    Obj.repr(
# 47 "parser.mly"
                   ( Uminus(_2) )
# 563 "parser.ml"
               : 'unary_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'unary_expr) in
    Obj.repr(
# 48 "parser.mly"
                   ( Not_Unary(_2) )
# 570 "parser.ml"
               : 'unary_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'unary_expr) in
    Obj.repr(
# 52 "parser.mly"
                 ( _1 )
# 577 "parser.ml"
               : 'mul_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'mul_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'unary_expr) in
    Obj.repr(
# 53 "parser.mly"
                           ( Multi(_1,_3) )
# 585 "parser.ml"
               : 'mul_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'mul_expr) in
    Obj.repr(
# 56 "parser.mly"
               ( _1 )
# 592 "parser.ml"
               : 'add_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'add_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'mul_expr) in
    Obj.repr(
# 57 "parser.mly"
                         ( Add_Bin(_1,_3) )
# 600 "parser.ml"
               : 'add_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'add_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'mul_expr) in
    Obj.repr(
# 58 "parser.mly"
                         ( Sub(_1,_3) )
# 608 "parser.ml"
               : 'add_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'add_expr) in
    Obj.repr(
# 62 "parser.mly"
                ( _1 )
# 615 "parser.ml"
               : 'cmpr_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmpr_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'add_expr) in
    Obj.repr(
# 63 "parser.mly"
                          ( Less(_1,_3) )
# 623 "parser.ml"
               : 'cmpr_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmpr_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'add_expr) in
    Obj.repr(
# 64 "parser.mly"
                          ( Greater(_1,_3) )
# 631 "parser.ml"
               : 'cmpr_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmpr_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'add_expr) in
    Obj.repr(
# 65 "parser.mly"
                          ( Less_Equal(_1,_3) )
# 639 "parser.ml"
               : 'cmpr_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmpr_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'add_expr) in
    Obj.repr(
# 66 "parser.mly"
                          ( Greater_Equal(_1,_3) )
# 647 "parser.ml"
               : 'cmpr_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cmpr_expr) in
    Obj.repr(
# 69 "parser.mly"
                 ( _1 )
# 654 "parser.ml"
               : 'eql_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'eql_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmpr_expr) in
    Obj.repr(
# 70 "parser.mly"
                          ( Equal(_1,_3) )
# 662 "parser.ml"
               : 'eql_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'eql_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmpr_expr) in
    Obj.repr(
# 71 "parser.mly"
                          ( Non_Equal(_1,_3) )
# 670 "parser.ml"
               : 'eql_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'eql_expr) in
    Obj.repr(
# 74 "parser.mly"
               ( _1 )
# 677 "parser.ml"
               : 'and_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'and_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'eql_expr) in
    Obj.repr(
# 75 "parser.mly"
                         ( And(_1,_3) )
# 685 "parser.ml"
               : 'and_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'and_expr) in
    Obj.repr(
# 78 "parser.mly"
               ( _1 )
# 692 "parser.ml"
               : 'or_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'or_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'and_expr) in
    Obj.repr(
# 79 "parser.mly"
                       ( Or(_1,_3) )
# 700 "parser.ml"
               : 'or_expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 82 "parser.mly"
            ( ASS )
# 706 "parser.ml"
               : 'ass_op))
; (fun __caml_parser_env ->
    Obj.repr(
# 83 "parser.mly"
             ( AASS )
# 712 "parser.ml"
               : 'ass_op))
; (fun __caml_parser_env ->
    Obj.repr(
# 84 "parser.mly"
             ( SASS )
# 718 "parser.ml"
               : 'ass_op))
; (fun __caml_parser_env ->
    Obj.repr(
# 85 "parser.mly"
             ( MASS )
# 724 "parser.ml"
               : 'ass_op))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'or_expr) in
    Obj.repr(
# 88 "parser.mly"
                ( _1 )
# 731 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'unary_expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'ass_op) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 89 "parser.mly"
                           ( Expr(_1,_2,_3) )
# 740 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 93 "parser.mly"
 ( [] )
# 746 "parser.ml"
               : 'arg_expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "parser.mly"
              ( [_1] )
# 753 "parser.ml"
               : 'arg_expr_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arg_expr_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "parser.mly"
                           ( _3 :: _1 )
# 761 "parser.ml"
               : 'arg_expr_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 98 "parser.mly"
          ( Stmt (None) )
# 767 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 99 "parser.mly"
                ( Stmt (Some(_1)))
# 774 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    Obj.repr(
# 100 "parser.mly"
                ( Bre_Stmt(None) )
# 780 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'statement_list) in
    Obj.repr(
# 101 "parser.mly"
                             ( Bre_Stmt(Some(List.rev _2)) )
# 787 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'declarator_list) in
    Obj.repr(
# 102 "parser.mly"
                                 ( Dec(_1,_2))
# 795 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 103 "parser.mly"
                                  (If(_3,_5))
# 803 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'statement) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 104 "parser.mly"
                                             (If_else(_3,_5,_7))
# 812 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 105 "parser.mly"
                                    (While(_3,_5) )
# 820 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'statement) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'statement) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 106 "parser.mly"
                                                  (For_complete(_3,_4,_5,_7))
# 830 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'statement) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'statement) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 107 "parser.mly"
                                              (For_part(_3,_4,_6))
# 839 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    Obj.repr(
# 108 "parser.mly"
                     ( CONTINUE )
# 845 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    Obj.repr(
# 109 "parser.mly"
                  ( BREAK )
# 851 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    Obj.repr(
# 110 "parser.mly"
                   ( RETURN )
# 857 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 111 "parser.mly"
                     ( Return(_2) )
# 864 "parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    Obj.repr(
# 114 "parser.mly"
   ([])
# 870 "parser.ml"
               : 'statement_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 115 "parser.mly"
                  ( [_1] )
# 877 "parser.ml"
               : 'statement_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'statement_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 116 "parser.mly"
                             ( _2 :: _1 )
# 885 "parser.ml"
               : 'statement_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 119 "parser.mly"
            ( VId _1 )
# 892 "parser.ml"
               : 'val_declarator))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'val_declarator) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'or_expr) in
    Obj.repr(
# 120 "parser.mly"
                                    ( Array_Dec(_1,Some(_3)) )
# 900 "parser.ml"
               : 'val_declarator))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'val_declarator) in
    Obj.repr(
# 121 "parser.mly"
                            (  Array_Dec(_1,None) )
# 907 "parser.ml"
               : 'val_declarator))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "parser.mly"
              ( Expr_Init _1 )
# 914 "parser.ml"
               : 'init))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 125 "parser.mly"
                        ( Init(_1, None))
# 921 "parser.ml"
               : 'init))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'arg_expr_list) in
    Obj.repr(
# 126 "parser.mly"
                                  ( Init(_1, Some(_3)) )
# 929 "parser.ml"
               : 'init))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'initializer_list) in
    Obj.repr(
# 127 "parser.mly"
                               ( Func_Init(_2) )
# 936 "parser.ml"
               : 'init))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'init) in
    Obj.repr(
# 130 "parser.mly"
             ( [_1] )
# 943 "parser.ml"
               : 'initializer_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'initializer_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'init) in
    Obj.repr(
# 131 "parser.mly"
                              ( _3 :: _1)
# 951 "parser.ml"
               : 'initializer_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'val_declarator) in
    Obj.repr(
# 134 "parser.mly"
                        ( Val_Decl _1 )
# 958 "parser.ml"
               : 'declarator_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'val_declarator) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'init) in
    Obj.repr(
# 135 "parser.mly"
                              ( Assignment(_1, _3) )
# 966 "parser.ml"
               : 'declarator_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'declarator_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'val_declarator) in
    Obj.repr(
# 136 "parser.mly"
                                      ( Dec_list(_1,_3) )
# 974 "parser.ml"
               : 'declarator_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'declarator_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'val_declarator) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'init) in
    Obj.repr(
# 137 "parser.mly"
                                               ( Assign_list(_1,_3,_5) )
# 983 "parser.ml"
               : 'declarator_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'val_declarator) in
    Obj.repr(
# 140 "parser.mly"
                             ( Param(_1,_2) )
# 991 "parser.ml"
               : 'param))
; (fun __caml_parser_env ->
    Obj.repr(
# 143 "parser.mly"
 ( [] )
# 997 "parser.ml"
               : 'para_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 144 "parser.mly"
                 ( [_1] )
# 1004 "parser.ml"
               : 'para_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'para_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 145 "parser.mly"
                       ( _3 :: _1 )
# 1012 "parser.ml"
               : 'para_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 149 "parser.mly"
                ( [_1] )
# 1019 "parser.ml"
               : 'type_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'type_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 150 "parser.mly"
                          ( _3 :: _1 )
# 1027 "parser.ml"
               : 'type_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'para_list) in
    Obj.repr(
# 154 "parser.mly"
                        ( Func_dec_p(_1,Some(_3)))
# 1035 "parser.ml"
               : 'func_declarator))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'type_list) in
    Obj.repr(
# 155 "parser.mly"
                        ( Func_dec_t(_1,_3))
# 1043 "parser.ml"
               : 'func_declarator))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 156 "parser.mly"
              ( Func_dec_p(_1,None ) )
# 1050 "parser.ml"
               : 'func_declarator))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'func_declarator) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'statement_list) in
    Obj.repr(
# 161 "parser.mly"
                                                    ( Func_Def(_1,_2,List.rev _4 ))
# 1059 "parser.ml"
               : 'function_definition))
; (fun __caml_parser_env ->
    Obj.repr(
# 165 "parser.mly"
    ( [], [] )
# 1065 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 166 "parser.mly"
                      ((_2 :: fst _1), snd _1 )
# 1073 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.program) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'function_definition) in
    Obj.repr(
# 167 "parser.mly"
                                ( fst _1, (_2 :: snd _1) )
# 1081 "parser.ml"
               : Ast.program))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
