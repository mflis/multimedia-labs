#!/bin/bash

ffmpeg -i $1 -codec:a libmp3lame -qscale:a 0 $20.mp3
ffmpeg -i $1 -codec:a libmp3lame -qscale:a 5 $25.mp3
ffmpeg -i $1 -codec:a libmp3lame -qscale:a 8 $28.mp3