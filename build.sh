#!/bin/bash

# display CPU info taken from /proc/cpuinfo
echo -e "\n CPU info from /proc/cpuinfo:\n"
cat /proc/cpuinfo | grep 'vendor' | uniq
cat /proc/cpuinfo | grep 'model name' | uniq
echo -e "\n"
# build app using Makefile and make binary executable
make info && make demo && \
chmod +x ./build/demo 
# run application we've just built
./build/demo

