all:
	ocamllex lexer.mll;
	ocamlyacc parser.mly; 
	ocamlc -c ast.ml;
	ocamlc -c table.ml
	ocamlc -c checker.ml;
	ocamlc -c javagen.ml;
	ocamlc -c parser.mli;
	ocamlc -c lexer.ml; 
	ocamlc -c parser.ml;
	ocamlc -c main.ml;
	ocamlc -o ../script/MPL ast.cmo table.cmo checker.cmo javagen.cmo parser.cmo lexer.cmo main.cmo;

clean:
	rm -rf *.cmo
	rm -rf *.cmi
	rm -rf *.mli
	rm lexer.ml
	rm parser.ml