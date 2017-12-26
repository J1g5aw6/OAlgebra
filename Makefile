CAMLOPT = ocamlfind ocamlopt -package oUnit -linkpkg
CAMLC = ocamlc

SRCDIR = src
OBJDIR = obj
TSTDIR = test
INTDIR = interfaces

$(OBJDIR)/main.cmx: $(SRCDIR)/main.ml prepare
	$(CAMLOPT) -c -o $(OBJDIR)/main $(SRCDIR)/main.ml

$(OBJDIR)/test: $(TSTDIR)/test.ml $(OBJDIR)/main.cmx
	$(CAMLOPT) -I $(OBJDIR)/ -o $(OBJDIR)/test $(OBJDIR)/main.cmx $(TSTDIR)/test.ml

clean:
	-@rm -rf $(OBJDIR)
	-@rm -rf $(INTDIR)

prepare:
	-@mkdir -p $(OBJDIR)

prepare-i:
	-@mkdir -p $(INTDIR)

$(INTDIR)/main.mli: $(SRCDIR)/main.ml prepare-i
	$(CAMLC) -i $(SRCDIR)/main.ml > $(INTDIR)/main.mli
