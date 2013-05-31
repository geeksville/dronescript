/*	see copyright notice in squirrel.h */
#ifndef _SQPCHEADER_H_
#define _SQPCHEADER_H_

#if defined(_MSC_VER) && defined(_DEBUG)
#include <crtdbg.h>
#endif 

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>


// we don't use exceptions on PX4, and this .h file barfs, so turn it off
#define _EXCEPTION_PTR_H 
#define _GLIBCXX_NESTED_EXCEPTION_H

#include <new>
//squirrel stuff
#include <squirrel.h>
#include "sqobject.h"
#include "sqstate.h"

#endif //_SQPCHEADER_H_
