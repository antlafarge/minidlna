#!/bin/bash

trap "kill $pid && exit 128" SIGHUP SIGINT SIGTERM

/usr/sbin/minidlnad -d

#pid=$!
#wait $pid
#wait $pid
#exit $?
