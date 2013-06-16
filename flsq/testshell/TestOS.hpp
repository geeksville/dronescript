#ifndef __TestOS_hpp
#define __TestOS_hpp

#include "SQOS.hpp"

class TestOS : public SQOS {
protected:
	// Send a message
    virtual void sendMavlink(const uint8_t *payload, unsigned payloadLen);

	virtual bool waitMessage(int waitMsecs, uint8_t *destBuf, int *destBufLen);

};

#endif

