CAMLOPT = ocamlfind ocamlopt -package oUnit -linkpkg

SRCDIR = src
OBJDIR = obj
TSTDIR = test

$(OBJDIR)/main.cmx: $(SRCDIR)/main.ml prepare
	$(CAMLOPT) -c -o $(OBJDIR)/main $(SRCDIR)/main.ml

$(OBJDIR)/test: $(TSTDIR)/test.ml $(OBJDIR)/main.cmx
	$(CAMLOPT) -I $(OBJDIR)/ -o $(OBJDIR)/test $(OBJDIR)/main.cmx $(TSTDIR)/test.ml
clean:
	-@rm -rf $(OBJDIR)

prepare:
	-@mkdir -p $(OBJDIR)
