#ifndef __APMOS_HPP
#define __APMOS_HPP

#include "SQOS.hpp"

class APMOS : public SQOS {
protected:
	// Send a message
    virtual void sendMavlink(const uint8_t *payload, unsigned payloadLen);

	virtual bool waitMessage(int waitMsecs, uint8_t *destBuf, int *destBufLen);

};


#endif
