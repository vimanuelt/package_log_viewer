# Compiler and flags
OCAML = ocamlfind ocamlc
OCAML_FLAGS = -thread -package lablgtk3,str -linkpkg

# Application name
APP_NAME = plv

# Source files
SRC = plv.ml

# Build targets
all: $(APP_NAME)

$(APP_NAME): $(SRC)
	$(OCAML) $(OCAML_FLAGS) -o $(APP_NAME) $(SRC)

# Run the application
run: $(APP_NAME)
	./$(APP_NAME)

# Clean up build files
clean:
	rm -f $(APP_NAME) *.cmi *.cmo

# Install the application (optional)
install: $(APP_NAME)
	@echo "Installing $(APP_NAME)..."
	@cp $(APP_NAME) /usr/local/bin/

# Uninstall the application (optional)
uninstall:
	@echo "Uninstalling $(APP_NAME)..."
	@rm -f /usr/local/bin/$(APP_NAME)

.PHONY: all run clean install uninstall

