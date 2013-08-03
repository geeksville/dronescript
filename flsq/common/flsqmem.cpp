#include "sqpcheader.h"

static int totalAlloc;

void *sq_vm_malloc(SQUnsignedInteger size) {	
	totalAlloc += size;  // Approximate
	printf("sqmalloc %d (total %d)\r\n", (int) size, totalAlloc);

	void *r = malloc(size); 
	if(!r) {
		printf("OUT OF MEMORY\r\n"); // FIXME - use separate heap from other apps
		for(;;)
			;
	}

    return r;
}

void *sq_vm_realloc(void *p, SQUnsignedInteger oldsize, SQUnsignedInteger size) { 
	totalAlloc = totalAlloc + size - oldsize;

	return realloc(p, size); 
}

void sq_vm_free(void *p, SQUnsignedInteger size) {
	printf("sqfree %d\r\n", size);
	totalAlloc -= size;

	free(p); 
}
