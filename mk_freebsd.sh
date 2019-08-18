#!/bin/sh

CFLAGS="-Wall -fPIC -std=c++11 -O2 -Isrc"

clang++ -shared -o libprngCpp.freebsd.1.0.5.so ${CFLAGS} src/mt19937.cpp

