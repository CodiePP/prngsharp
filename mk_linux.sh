#!/bin/sh

CFLAGS="-Wall -fPIC -std=c++11 -O2 -Isrc"

g++ -shared -o libprngCpp.linux.1.0.4.so ${CFLAGS} src/mt19937.cpp

