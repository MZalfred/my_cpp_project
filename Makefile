# Compiler
CC=g++

# Sources and Objects
NEW_SOURCES=main.cpp Calculator.cpp
OLD_SOURCES=old_main.cpp
NEW_OBJECTS=$(NEW_SOURCES:.cpp=.o)
OLD_OBJECTS=$(OLD_SOURCES:.cpp=.o)

# Output names
NEW_OUTPUT=calc_app
OLD_OUTPUT=hello_world

# Compiler Flags
ifdef DEBUG
    CFLAGS=-g
else
    CFLAGS=-O2
endif

# Phony Targets
.PHONY: all old run_old run clean quick test

# Targets
all: $(NEW_OUTPUT)

old: $(OLD_OUTPUT)

$(NEW_OUTPUT): $(NEW_OBJECTS)
	$(CC) $(NEW_OBJECTS) -o $(NEW_OUTPUT)

$(OLD_OUTPUT): $(OLD_OBJECTS) Calculator.o
	$(CC) $(OLD_OBJECTS) Calculator.o -o $(OLD_OUTPUT)

%.o: %.cpp
	$(CC) -c $(CFLAGS) $< -o $@

run: $(NEW_OUTPUT)
	./$(NEW_OUTPUT)

run_old: $(OLD_OUTPUT)
	./$(OLD_OUTPUT)

test: all
	./$(NEW_OUTPUT)

clean:
	rm -f *.o $(NEW_OUTPUT) $(OLD_OUTPUT)
