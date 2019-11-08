#!/bin/bash
GREEN='\032[0;31m'
NC='\033[0m'
# display CPU info taken from /proc/cpuinfo
echo -e " ${GREEN}CPU info:\n"
cat /proc/cpuinfo | grep 'vendor' | uniq
cat /proc/cpuinfo | grep 'model name' | uniq
echo -e "${NC}\n"

make info && make demo && \
chmod +x ./build/demo 
# run application we've just built
echo "${GREEN}"
./build/demo
echo "${NC}"
