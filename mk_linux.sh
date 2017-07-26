#!/bin/sh

CFLAGS="-Wall -fPIC -std=c++11 -O2 -Isrc"

g++ -shared -o libprngCpp.1.0.3.so ${CFLAGS} src/mt19937.cpp

