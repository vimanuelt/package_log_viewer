# Makefile

# Compiler and flags
OCAMLOPT = ocamlopt
OCAMLCFLAGS = -g -o
INCLUDES = -I src

# Source files
SRCS = $(wildcard src/*.ml)
OBJS = $(SRCS:.ml=.cmx)

# Target executable
TARGET = plv

# Default target
all: $(TARGET)

# Link the native executable
$(TARGET): $(OBJS)
	$(OCAMLOPT) $(OCAMLCFLAGS) $(TARGET) $(OBJS) -linkpkg -package [YOUR_PACKAGES]

# Compile individual modules
%.cmx: %.ml
	$(OCAMLOPT) $(OCAMLCFLAGS) -c $<

# Clean build artifacts
clean:
	rm -f src/*.cmx src/*.o $(TARGET)

.PHONY: all clean
