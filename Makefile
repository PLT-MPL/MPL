all:
	ocamllex lexer.mll;
	ocamlyacc parser.mly; 
	ocamlc -c parser.mli;
	ocamlc -c ast.ml;
	ocamlc -c lexer.ml; 
	ocamlc -c parser.ml;
	ocamlc -c main.ml;
	ocamlc -o test ast.cmo parser.cmo lexer.cmo main.cmo;

clean:
	rm -rf *.cmo
	rm -rf *.cmi
	rm -rf *.mli
