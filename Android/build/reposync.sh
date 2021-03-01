#!/bin/bash
START=$(date +%s)
echo $1 >> repo_url
if grep -wFo https://android.googlesource.com/platform/manifest/ repo_url*; then
    repo init -u $1 -b $2
# TODO: Add more Options
else
    echo """
    usage: bash reposync.sh url branch
    """
fi
rm repo_url
repo sync
END=$(date +%s)
SYNCTIME="Sync time: $(echo $((${END}-${START})) | awk '{print int($1/60)" minutes and "int($1%60)" seconds"}')"
echo $SYNCTIME > /home/torben/synctime.txt
shutdown