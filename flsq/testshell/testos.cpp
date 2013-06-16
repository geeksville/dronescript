/****************************************************************************
 *
 *   Copyright (C) 2012 PX3 Development Team. All rights reserved.
 *   Author: @author Kevin Hester (kevinh@geeksville.com)
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 * 3. Neither the name PX4 nor the names of its contributors may be
 *    used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 ****************************************************************************/

/**
 * Launches a flying squirrel script session.
 */

#include <unistd.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#include <squirrel.h>
#include <sqstdblob.h>
#include <sqstdsystem.h>
#include <sqstdio.h>
#include <sqstdmath.h>	
#include <sqstdstring.h>
#include <sqstdaux.h>

#include "apmos.hpp"


SQInteger register_global_func(HSQUIRRELVM v,SQFUNCTION f,const char *fname) {
  sq_pushroottable(v);
  sq_pushstring(v,fname,-1);
  sq_newclosure(v,f,0); //create a new function
  sq_createslot(v,-3);
  sq_pop(v,1); //pops the root table
  return 0;
}


SQInteger osWaitMessage(HSQUIRRELVM v) {
  printf("Waiting for message\n");

  SQInteger nargs = sq_gettop(v); //number of arguments
  if(nargs != 1)
    return sq_throwerror(v, _SC("Wrong # of arguments to waitMessage"));
	
  SQInteger timeoutMsec;
  if(!SQ_SUCCEEDED(sq_getinteger(v, 1, &timeoutMsec)))
    return 0;

  // sleep(timeoutMsec);

  // FIXME, return a blob with the mavlink bytes

  sq_pushnull(v);

#if 0
  for(SQInteger n=1;n<=nargs;n++)
    {
      printf("arg %d is ",n);
      switch(sq_gettype(v,n))
	{
	case OT_NULL:
	  printf("null");
	  break;
	case OT_INTEGER:
	  printf("integer");
	  break;
	case OT_FLOAT:
	  printf("float");
	  break;
	case OT_STRING:
	  printf("string");
	  break;
	case OT_TABLE:
	  printf("table");
	  break;
	case OT_ARRAY:
	  printf("array");
	  break;
	case OT_USERDATA:
	  printf("userdata");
	  break;
	case OT_CLOSURE:
	  printf("closure(function)");
	  break;
	case OT_NATIVECLOSURE:
	  printf("native closure(C function)");
	  break;
	case OT_GENERATOR:
	  printf("generator");
	  break;
	case OT_USERPOINTER:
	  printf("userpointer");
	  break;
	default:
	  return sq_throwerror(v,"invalid param"); //throws an exception
	}
      printf("\n");
    }
#endif

  // sq_pushinteger(v,nargs); //push the number of arguments as return value
  return 1; //1 because 1 value is returned
}


SQInteger osSendMavlink(HSQUIRRELVM v) {
  SQInteger nargs = sq_gettop(v); //number of arguments
  if(nargs != 1)
    return sq_throwerror(v, _SC("Wrong # of arguments to sendMavlink"));
	
  SQUserPointer payload;
  if(!SQ_SUCCEEDED(sqstd_getblob(v, 1, &payload)))
    return 0;

  SQInteger payloadLen;
  payloadLen = sqstd_getblobsize(v, 1);

  // FIXME
  printf("Sending mavlink %Ld bytes\n", payloadLen);

  return 0; 
}


void SQOS::init(HSQUIRRELVM v) {
  register_global_func(v, osWaitMessage, "os_waitMessage");
  register_global_func(v, osSendMavlink, "os_sendMavlink");
}
