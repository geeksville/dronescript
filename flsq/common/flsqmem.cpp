#include "sqpcheader.h"


void *sq_vm_malloc(SQUnsignedInteger size) {	
	printf("sqmalloc %d\r\n", (int) size);
	void *r = malloc(size); 
	if(!r)
		printf("OUT OF MEMORY\r\n"); // FIXME - use separate heap from other apps
    return r;
}

void *sq_vm_realloc(void *p, SQUnsignedInteger oldsize, SQUnsignedInteger size) { 
	return realloc(p, size); 
}

void sq_vm_free(void *p, SQUnsignedInteger size) {	
	free(p); 
}
