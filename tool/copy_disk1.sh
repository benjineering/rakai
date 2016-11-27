#!/bin/bash

IN_FILE="/dev/rdisk3"
OUT_FILE="three_volumes.akai"

BLOCK_SIZE="1024"
BLOCK_COUNT="524288"

sudo dd bs=$BLOCK_SIZE count=$BLOCK_COUNT if=$IN_FILE of=$OUT_FILE 
