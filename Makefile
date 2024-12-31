# Makefile for package_log_viewer

# Variables
OCAMLFIND=ocamlfind
OCAMLOPT=$(OCAMLFIND) ocamlopt
PACKAGES=str,unix,lablgtk3,threads
TARGET=plv
SOURCES=plv.ml
INSTALL_DIR=/usr/local/bin

# Rules
all: $(TARGET)

$(TARGET): $(SOURCES)
	$(OCAMLOPT) -thread -g -o $(TARGET) -linkpkg -package $(PACKAGES) $(SOURCES)

install: $(TARGET)
	install -d $(INSTALL_DIR)
	install -m 755 $(TARGET) $(INSTALL_DIR)

clean:
	rm -f $(TARGET) *.cmx *.cmi *.o

.PHONY: all clean install

