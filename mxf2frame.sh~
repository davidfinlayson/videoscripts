#!/bin/bash
######################################################################
# PROGRAM:  devignette 
# PURPOSE:  Reduce vignette effect from uneven camera lighting
# AUTHOR:   David Finlayson <dfinlayson@usgs.gov>
# REQUIRES: Depends on ImageMagick
#
# HISTORY:
# 
# 2014-06-16 - Created script
#
######################################################################
set -o nounset
set -o errexit

EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
	echo "Usage: $(basename $0) <source> <destination> [smoothing] [brightening]"
	echo
	echo "source      - Source directory of raw images"
	echo "destination - Destination directory for processed images"
	echo "smoothing   - (optional) smoothing parameter, higher is more [default: 60]"
	echo "brightness  - (optional) percentage increase in brightness [default: 130]"
	echo
	exit 1
fi
 

SRC=$1
DEST=$2
SIGMA=${3:60}
HUE=${4:130}

for f in $( ls -1 $SRC/* )
do
	echo Processing $f
	convert $f -blur 0x${SIGMA} -modulate ${HUE} -colorspace Gray $DEST/illumination.bmp
	convert $DEST/illumination.bmp \( $f -despeckle \) -compose Divide -composite $DEST/$(basename $f)
done
 