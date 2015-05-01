all:
	ocamllex lexer.mll;
	ocamlyacc parser.mly; 
	ocamlc -c lexer.ml; 
	ocamlc -c parser.mli; 
	ocamlc -c parser.ml;
	ocamlc -c main.ml;
	ocamlc -o test parser.cmo lexer.cmo main.cmo;

clean:
	rm -rf *.cmo
	rm -rf *.cmi
	rm -rf *.mli
