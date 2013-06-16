SQUIRREL= ../..

OUT= $(SQUIRREL)/bin/flsq
INCZ= -I$(SQUIRREL)/include -I. -I$(SQUIRREL)/sqlibs -I../apm
LIBZ= -L$(SQUIRREL)/lib 
LIB= -lsquirrel -lsqstdlib

OBJS= sq.o testos.o
SRCS= sq.cpp testos.cpp

test: flsq
	cd ..; ../bin/flsq test.nut

flsq:
	g++ -O2 -s -fno-exceptions -fno-rtti -o $(OUT) $(SRCS) $(INCZ) $(LIBZ) $(LIB)

flsqprof:
	g++ -O2 -pg -fno-exceptions -fno-rtti -pie -gstabs -g3 -o $(OUT) $(SRCS) $(INCZ) $(LIBZ) $(LIB)

