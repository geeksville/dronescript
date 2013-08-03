/****************************************************************************
 *
 *   Author: @author Kevin Hester (kevinh@geeksville.com)
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
#include <mqueue.h>
#include <fcntl.h>

#include <squirrel.h>
#include <sqstdblob.h>
#include <sqstdsystem.h>
#include <sqstdio.h>
#include <sqstdmath.h>	
#include <sqstdstring.h>
#include <sqstdaux.h>

#include "apmos.hpp"


struct MsgInfo {
  uint8_t *bytes;
  int     numBytes;
};

mqd_t fromAPM = NULL;

#define MAX_MAVLINK_SIZE 128

uint8_t outbuf[MAX_MAVLINK_SIZE], *writep = outbuf;
int numWritten = 0;

// from the scripting env to the APM
uint8_t fromsq[MAX_MAVLINK_SIZE];
uint16_t fromsq_remaining;
uint8_t *fromsq_readptr;

__EXPORT void flsq_send_start(void) {
  if(!fromAPM) {

    printf("sender_thread: Starting\n");

    /* Fill in attributes for message queue */

    struct mq_attr attr;
    attr.mq_maxmsg  = 1; // FIXME - support multiple messages in flight
    attr.mq_msgsize = sizeof(MsgInfo);
    attr.mq_flags   = 0;

    /* Set the flags for the open of the queue.
     * Make it a blocking open on the queue, meaning it will block if
     * this process tries to send to the queue and the queue is full.
     *
     *   O_CREAT - the queue will get created if it does not already exist.
     *   O_WRONLY - we are only planning to write to the queue.
     *
     * Open the queue, and create it if the receiving process hasn't
     * already created it.
     */

    fromAPM = mq_open("FrAPM", O_WRONLY|O_CREAT|O_NONBLOCK, 0666, &attr);
  }

  writep = outbuf;
  numWritten = 0;
}

__EXPORT void flsq_send_end(void) {
  MsgInfo msg;
  msg.bytes = outbuf;
  msg.numBytes = numWritten;
  int status = mq_send(fromAPM, &msg, sizeof(msg), 42);
  // FIXME - support multiple messages in flight, don't just drop things
}

__EXPORT void flsq_send_buffer(const uint8_t *buf, uint8_t len) {
  // Crude check for maxsize
  if(numWritten + len <= sizeof(outbuf)) {
    memcpy(writep, buf, len);
    numWritten += len;
    writep += len;
  }
}

APMOS::APMOS() {

  printf("APM flsq starting\n");

  /* Fill in attributes for message queue */

  struct mq_attr attr;
  attr.mq_maxmsg  = 20;
  attr.mq_msgsize = sizeof(MsgInfo);
  attr.mq_flags   = 0;

  /* Set the flags for the open of the queue.
   * Make it a blocking open on the queue, meaning it will block if
   * this task tries to read from the queue when the queue is empty
   *
   *   O_CREAT - the queue will get created if it does not already exist.
   *   O_RDONLY - we are only planning to read from the queue.
   *
   * Open the queue, and create it if the sending process hasn't
   * already created it.
   */

  incoming = mq_open("FrAPM", O_RDONLY|O_CREAT, 0666, &attr);
}

__EXPORT uint8_t flsq_read(void) {
	if(fromsq_remaining) {
		fromsq_remaining--;
		return *fromsq_readptr++;
	}
}

__EXPORT uint16_t flsq_get_available(void) {
	return fromsq_remaining;
}


void APMOS::sendMavlink(const uint8_t *payload, unsigned payloadLen) {
	printf("sending a msg from flsq\n");

	// FIXME, append to the previous bytes (ring buffer) rather than blowing away
	// FIXME, validate payloadLen vs max size
	memcpy(fromsq, payload, payloadLen);
	fromsq_remaining = payloadLen;
	fromsq_readptr = fromsq;
}



bool APMOS::waitMessage(int waitMsecs, uint8_t *destBuf, int *destBufLen) {
  MsgInfo msg;

  // FIXME - use the specified timeout wiht timedreceive
  int nbytes = mq_receive(incoming, &msg, sizeof(msg), 0);
  if(nbytes > 0) {
	printf("delivering msg to flsq\n");
    memcpy(destBuf, msg.bytes, msg.numBytes); // FIXME validate max len
    *destBufLen = msg.numBytes;
    return true;
  }
  else
    return false;
}
