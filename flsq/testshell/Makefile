FLSQ_ROOT= ../..

FLSQ_COMMONDIR = $(FLSQ_ROOT)/flsq/common
COMMON_SRCS  = $(addprefix $(FLSQ_COMMONDIR)/, SQOS.cpp flsqmem.cpp)

OUT= $(FLSQ_ROOT)/bin/flsq
INCZ= -I$(FLSQ_ROOT)/include -I. -I$(FLSQ_ROOT)/sqlibs -I../common -I$(FLSQ_ROOT)/squirrel
LIBZ= -L$(FLSQ_ROOT)/lib 
LIB= -lsquirrel -lsqstdlib

SRCS= sq.cpp TestOS.cpp $(COMMON_SRCS)

test: flsq
	cd ..; ../bin/flsq startup.nut

flsq:
	g++ -O2 -s -fno-exceptions -fno-rtti -o $(OUT) $(SRCS) $(INCZ) $(LIBZ) $(LIB)

flsqprof:
	g++ -O2 -pg -fno-exceptions -fno-rtti -pie -gstabs -g3 -o $(OUT) $(SRCS) $(INCZ) $(LIBZ) $(LIB)

