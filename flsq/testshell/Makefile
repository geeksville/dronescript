SQUIRREL= ../..

OUT= $(SQUIRREL)/bin/flsq
INCZ= -I$(SQUIRREL)/include -I. -I$(SQUIRREL)/sqlibs -I../common
LIBZ= -L$(SQUIRREL)/lib 
LIB= -lsquirrel -lsqstdlib

OBJS= sq.o TestOS.o ../common/SQOS.o
SRCS= sq.cpp TestOS.cpp ../common/SQOS.cpp

test: flsq
	cd ..; ../bin/flsq test.nut

flsq:
	g++ -O2 -s -fno-exceptions -fno-rtti -o $(OUT) $(SRCS) $(INCZ) $(LIBZ) $(LIB)

flsqprof:
	g++ -O2 -pg -fno-exceptions -fno-rtti -pie -gstabs -g3 -o $(OUT) $(SRCS) $(INCZ) $(LIBZ) $(LIB)

