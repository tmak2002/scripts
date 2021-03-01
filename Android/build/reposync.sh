#!/bin/bash
START=$(date +%s)
repo sync
END=$(date +%s)
SYNCTIME="Sync time: $(echo $((${END}-${START})) | awk '{print int($1/60)" minutes and "int($1%60)" seconds"}')"
echo $SYNCTIME > /home/torben/synctime.txt
shutdown
