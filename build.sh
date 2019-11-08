#!/bin/bash

# build app using Makefile and make binary executable
make demo && chmod +x ./build/demo 

# run application we've just built
./build/demo
