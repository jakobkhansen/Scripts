#! /bin/bash

filename=$1
runname="$(echo $filename | rev | cut -c4- | rev)Kt"
kotlinc $filename
kotlin $runname
