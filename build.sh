#!/bin/bash
cat /proc/cpuinfo | grep 'vendor' | uniq
cat /proc/cpuinfo | grep 'model name' | uniq
make info && make demo && \
chmod +x ./build/demo && ./build/demo
