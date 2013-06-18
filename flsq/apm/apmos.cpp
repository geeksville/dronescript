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

uint8_t outbuf[128], *writep;
int numWritten;

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

  printf("receiver_thread: Starting\n");

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

void APMOS::sendMavlink(const uint8_t *payload, unsigned payloadLen) {
}



bool APMOS::waitMessage(int waitMsecs, uint8_t *destBuf, int *destBufLen) {
  MsgInfo msg;

  // FIXME - use the specified timeout wiht timedreceive
  int nbytes = mq_receive(incoming, &msg, sizeof(msg), 0);
  if(nbytes > 0) {
    memcpy(destBuf, msg.bytes, msg.numBytes); // FIXME validate max len
    *destBufLen = msg.numBytes;
    return true;
  }
  else
    return false;
}
