#!/bin/bash

IN_FILE="/dev/disk1"
OUT_FILE="disk1_dump.akai"

BLOCK_SIZE="1024"
BLOCK_COUNT="524288"

sudo dd bs=$BLOCK_SIZE count=$BLOCK_COUNT if=$IN_FILE of=$OUT_FILE 
