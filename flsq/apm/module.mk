############################################################################
#
#   Copyright (c) 2012, 2013 PX4 Development Team. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in
#    the documentation and/or other materials provided with the
#    distribution.
# 3. Neither the name PX4 nor the names of its contributors may be
#    used to endorse or promote products derived from this software
#    without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
# AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
############################################################################

#
# flying squirrel scripting shell 
#

SQ_COMP_SRCS = sqlexer.cpp sqcompiler.cpp 

FLSQ_COMMONDIR = $(FLSQ_ROOT)/flsq/common
FLSQ_APMDIR = $(FLSQ_ROOT)/flsq/apm

SQ_SRCS = sqapi.cpp sqbaselib.cpp sqfuncstate.cpp sqdebug.cpp sqobject.cpp sqstate.cpp sqtable.cpp sqvm.cpp sqclass.cpp $(SQ_COMP_SRCS)

SQLIB_SRCS = sqstdblob.cpp sqstdio.cpp sqstdaux.cpp sqstdstream.cpp sqstdmath.cpp sqstdsystem.cpp sqstdstring.cpp sqstdrex.cpp

MODULE_NAME = flsq
MODULE_COMMAND	 = flsq
COMMON_SRCS  = $(addprefix $(FLSQ_COMMONDIR)/, SQOS.cpp flsqmem.cpp)
SRCS		 = $(FLSQ_APMDIR)/flysq.cpp $(FLSQ_APMDIR)/apmos.cpp $(FLSQ_APMDIR)/setjmp.S $(COMMON_SRCS) $(addprefix $(FLSQ_ROOT)/squirrel/, $(SQ_SRCS)) $(addprefix $(FLSQ_ROOT)/sqstdlib/, $(SQLIB_SRCS))

SQ_SRCDIR	 = $(abspath $(FLSQ_ROOT))
INCLUDE_DIRS     += $(SQ_SRCDIR)/include
INCLUDE_DIRS     += $(SQ_SRCDIR)/squirrel
INCLUDE_DIRS     += $(SQ_SRCDIR)/sqstdlib
INCLUDE_DIRS     += $(FLSQ_COMMONDIR)
INCLUDE_DIRS     += $(FLSQ_APMDIR)

MODULE_STACKSIZE = 16000



