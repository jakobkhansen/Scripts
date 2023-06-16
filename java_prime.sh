#!/bin/bash
echo "Setting DRI_PRIME=1"
env DRI_PRIME=1 prime-run /usr/lib/jvm/java-17-openjdk/bin/java "$@"
