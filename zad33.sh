#!/bin/bash


# $1 input file
# $2 mowa, muzyka
# $3  - bitrate
ffmpeg -i $1 -f wav - | lame --cbr -b $2 - zad33$2$3.mp3