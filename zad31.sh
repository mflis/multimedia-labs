#!/bin/bash


# $1 input file
# $2 mowa, muzyka
# $3 $4 $5 - quality 0-9
ffmpeg -i $1 -codec:a libmp3lame -qscale:a $3 zad31$2$3.mp3
ffmpeg -i $1 -codec:a libmp3lame -qscale:a $4 zad31$2$4.mp3
ffmpeg -i $1 -codec:a libmp3lame -qscale:a $5 zad31$2$5.mp3