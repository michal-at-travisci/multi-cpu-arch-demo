#!/bin/bash
make info && make demo && \
cd ./build && ls -la && \
chmod +x ./demo && ./demo
