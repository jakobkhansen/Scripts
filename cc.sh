#! /bin/bash

name=$(basename $1 .c);

gcc $1 -o $name && ./$name
