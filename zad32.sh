#!/bin/bash


# $1 input file
# $2 mowa, muzyka
# $3 $4 $5 - bitrate
ffmpeg -i $1 -codec:a libmp3lame -b:a  $3k zad32$2$3.mp3
ffmpeg -i $1 -codec:a libmp3lame -b:a  $4k zad32$2$4.mp3
ffmpeg -i $1 -codec:a libmp3lame -b:a  $5k zad32$2$5.mp3