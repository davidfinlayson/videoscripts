#!/bin/bash
######################################################################
# PROGRAM:  mov2frame.sh
# PURPOSE:  Export framegrabs from movie files
# AUTHOR:   David Finlayson <dfinlayson@usgs.gov>
# REQUIRES: Depends on FFMPEG
#
# HISTORY:
# 
# 2014-06-17 - Created script
#
######################################################################
set -o nounset
set -o errexit

EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
	echo "Usage: $(basename $0) <source movie> <dest_root>"
	echo
	echo "source      - Source movie (any ffmpeg supported format)"
	echo "dest_root   - The destination directory and root basename of files"
	echo
	exit 1
fi
 

SRC=$1
ROOT=$2

ffmpeg -i $SRC -q:v 2 ${ROOT}%05d.bmp

