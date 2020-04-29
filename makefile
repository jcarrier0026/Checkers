# Some useful variables
OBJS = graphics.o input.o main.o sprite.o game.o
CFLAGS = -Wall -g -std=c++17
LIBS = `sdl2-config --cflags --libs` -lSDL2_image
CC = g++

# 'all' is a phony target.
# Just typing 'make' will use the 'all' target.
# Let's point that at the run executable target.
all: run.out

# This is the run.out target. It will make the file 'run.out'
# using the provided command.
run.out: ${OBJS}
	${CC} ${CFLAGS} ${OBJS} ${LIBS} -o $@

# Special rule for making .o files out of .cpp files.
.cpp.o:
	${CC} ${CFLAGS} -c $<
	
# 'clean' is a phony target.
# Typing "make clean" will actually just run a command for us.
# Typically, 'clean' is set to remove the compiled outputs.
clean:
	rm *.out *.o


