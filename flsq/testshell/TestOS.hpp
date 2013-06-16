#ifndef __TestOS_hpp
#define __TestOS_hpp

#include "SQOS.hpp"

class TestOS : public SQOS {
protected:
	// Send a message
    virtual void sendMavlink(const void *payload, unsigned payloadLen);

	virtual bool waitMessage(int waitMsecs, unsigned char *destBuf, int *destBufLen);

};

#endif

