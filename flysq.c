/****************************************************************************
 *
 *   Copyright (C) 2012 PX4 Development Team. All rights reserved.
 *   Author: @author Lorenz Meier <lm@inf.ethz.ch>
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

#include <nuttx/config.h>

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


#define scfprintf fprintf
#define scfopen	fopen
#define scvprintf vfprintf

void PrintVersionInfos();

SQInteger quit(HSQUIRRELVM v)
{
	int *done;
	sq_getuserpointer(v,-1,(SQUserPointer*)&done);
	*done=1;
	return 0;
}

void printfunc(HSQUIRRELVM v,const SQChar *s,...)
{
	va_list vl;
	va_start(vl, s);
	scvprintf(stdout, s, vl);
	va_end(vl);
}

void errorfunc(HSQUIRRELVM v,const SQChar *s,...)
{
	va_list vl;
	va_start(vl, s);
	scvprintf(stderr, s, vl);
	va_end(vl);
}

void PrintVersionInfos()
{
	scfprintf(stdout,_SC("%s %s (%d bits)\n"),SQUIRREL_VERSION,SQUIRREL_COPYRIGHT,((int)(sizeof(SQInteger)*8)));
}

void PrintUsage()
{
	scfprintf(stderr,_SC("usage: sq <options> <scriptpath [args]>.\n")
		_SC("Available options are:\n")
		_SC("   -c              compiles the file to bytecode(default output 'out.cnut')\n")
		_SC("   -o              specifies output file for the -c option\n")
		_SC("   -c              compiles only\n")
		_SC("   -d              generates debug infos\n")
		_SC("   -v              displays version infos\n")
		_SC("   -h              prints help\n"));
}

#define _INTERACTIVE 0
#define _DONE 2
#define _ERROR 3
//<<FIXME>> this func is a mess
int getargs(HSQUIRRELVM v,int argc, char* argv[],SQInteger *retval)
{
	int i;
	int compiles_only = 0;
	static SQChar temp[500];
	const SQChar *ret=NULL;
	char * output = NULL;
	int lineinfo=0;
	*retval = 0;
	if(argc>1)
	{
		int arg=1,exitloop=0;
		
		while(arg < argc && !exitloop)
		{

			if(argv[arg][0]=='-')
			{
				switch(argv[arg][1])
				{
				case 'd': //DEBUG(debug infos)
					sq_enabledebuginfo(v,1);
					break;
				case 'c':
					compiles_only = 1;
					break;
				case 'o':
					if(arg < argc) {
						arg++;
						output = argv[arg];
					}
					break;
				case 'v':
					PrintVersionInfos();
					return _DONE;
				
				case 'h':
					PrintVersionInfos();
					PrintUsage();
					return _DONE;
				default:
					PrintVersionInfos();
					scprintf(_SC("unknown prameter '-%c'\n"),argv[arg][1]);
					PrintUsage();
					*retval = -1;
					return _ERROR;
				}
			}else break;
			arg++;
		}

		// src file
		
		if(arg<argc) {
			const SQChar *filename=NULL;
#ifdef SQUNICODE
			mbstowcs(temp,argv[arg],strlen(argv[arg]));
			filename=temp;
#else
			filename=argv[arg];
#endif

			arg++;
			
			//sq_pushstring(v,_SC("ARGS"),-1);
			//sq_newarray(v,0);
			
#ifdef HAS_FILE
			//sq_createslot(v,-3);
			//sq_pop(v,1);
			if(compiles_only) {
				if(SQ_SUCCEEDED(sqstd_loadfile(v,filename,SQTrue))){
					const SQChar *outfile = _SC("out.cnut");
					if(output) {
#ifdef SQUNICODE
						int len = (int)(strlen(output)+1);
						mbstowcs(sq_getscratchpad(v,len*sizeof(SQChar)),output,len);
						outfile = sq_getscratchpad(v,-1);
#else
						outfile = output;
#endif
					}
					if(SQ_SUCCEEDED(sqstd_writeclosuretofile(v,outfile)))
						return _DONE;
				}
			}
			else {
				//if(SQ_SUCCEEDED(sqstd_dofile(v,filename,SQFalse,SQTrue))) {
					//return _DONE;
				//}
				if(SQ_SUCCEEDED(sqstd_loadfile(v,filename,SQTrue))) {
					int callargs = 1;
					sq_pushroottable(v);
					for(i=arg;i<argc;i++)
					{
						const SQChar *a;
#ifdef SQUNICODE
						int alen=(int)strlen(argv[i]);
						a=sq_getscratchpad(v,(int)(alen*sizeof(SQChar)));
						mbstowcs(sq_getscratchpad(v,-1),argv[i],alen);
						sq_getscratchpad(v,-1)[alen] = _SC('\0');
#else
						a=argv[i];
#endif
						sq_pushstring(v,a,-1);
						callargs++;
						//sq_arrayappend(v,-2);
					}
					if(SQ_SUCCEEDED(sq_call(v,callargs,SQTrue,SQTrue))) {
						SQObjectType type = sq_gettype(v,-1);
						if(type == OT_INTEGER) {
							*retval = type;
							sq_getinteger(v,-1,retval);
						}
						return _DONE;
					}
					else{
						return _ERROR;
					}
					
				}
			}
#endif

			//if this point is reached an error occured
			{
				const SQChar *err;
				sq_getlasterror(v);
				if(SQ_SUCCEEDED(sq_getstring(v,-1,&err))) {
					scprintf(_SC("Error [%s]\n"),err);
					*retval = -2;
					return _ERROR;
				}
			}
			
		}
	}

	return _INTERACTIVE;
}

void Interactive(HSQUIRRELVM v)
{
	
#define MAXINPUT 1024
	SQChar buffer[MAXINPUT];
	SQInteger blocks =0;
	SQInteger string=0;
	SQInteger retval=0;
	SQInteger done=0;
	PrintVersionInfos();
	
		scprintf(_SC("pushing\n"));

	sq_pushroottable(v);
	sq_pushstring(v,_SC("quit"),-1);
	sq_pushuserpointer(v,&done);
	sq_newclosure(v,quit,1);
	sq_setparamscheck(v,1,NULL);
	sq_newslot(v,-3,SQFalse);
	sq_pop(v,1);

	scprintf(_SC("pushed\n"));

    while (!done) 
	{
		SQInteger i = 0;
		scprintf(_SC("\nsq>"));

	scprintf(_SC("getc\n"));

		for(;;) {
			int c;
			if(done)return;
			c = getchar();
			if (c == _SC('\n')) {
				if (i>0 && buffer[i-1] == _SC('\\'))
				{
					buffer[i-1] = _SC('\n');
				}
				else if(blocks==0)break;
				buffer[i++] = _SC('\n');
			}
			else if (c==_SC('}')) {blocks--; buffer[i++] = (SQChar)c;}
			else if(c==_SC('{') && !string){
					blocks++;
					buffer[i++] = (SQChar)c;
			}
			else if(c==_SC('"') || c==_SC('\'')){
					string=!string;
					buffer[i++] = (SQChar)c;
			}
			else if (i >= MAXINPUT-1) {
				scfprintf(stderr, _SC("sq : input line too long\n"));
				break;
			}
			else{
				buffer[i++] = (SQChar)c;
			}
		}
		buffer[i] = _SC('\0');
		
		if(buffer[0]==_SC('=')){
			scsprintf(sq_getscratchpad(v,MAXINPUT),_SC("return (%s)"),&buffer[1]);
			memcpy(buffer,sq_getscratchpad(v,-1),(scstrlen(sq_getscratchpad(v,-1))+1)*sizeof(SQChar));
			retval=1;
		}
		i=scstrlen(buffer);
		if(i>0){
			SQInteger oldtop=sq_gettop(v);
			if(SQ_SUCCEEDED(sq_compilebuffer(v,buffer,i,_SC("interactive console"),SQTrue))){
				sq_pushroottable(v);
				if(SQ_SUCCEEDED(sq_call(v,1,retval,SQTrue)) &&	retval){
					scprintf(_SC("\n"));
					sq_pushroottable(v);
					sq_pushstring(v,_SC("print"),-1);
					sq_get(v,-2);
					sq_pushroottable(v);
					sq_push(v,-4);
					sq_call(v,2,SQFalse,SQTrue);
					retval=0;
					scprintf(_SC("\n"));
				}
			}
			
			sq_settop(v,oldtop);
		}
	}
}

__EXPORT int flysq_main(int argc, char *argv[]);

int flysq_main(int argc, char *argv[])
{
	SQInteger retval = 0;

	HSQUIRRELVM v;
	const SQChar *filename=NULL;
	
	v=sq_open(1024);
	sq_setprintfunc(v,printfunc,errorfunc);

	sq_pushroottable(v);

	//sqstd_register_bloblib(v);
	//sqstd_register_iolib(v);
	//sqstd_register_systemlib(v);
	//sqstd_register_mathlib(v);
	//sqstd_register_stringlib(v);

	//aux library
	//sets error handlers
	//sqstd_seterrorhandlers(v);

	//gets arguments
	switch(getargs(v,argc,argv,&retval))
	{
	case _INTERACTIVE:
		Interactive(v);
		break;
	case _DONE:
	case _ERROR:
	default: 
		break;
	}

	sq_close(v);

	return retval;
}



