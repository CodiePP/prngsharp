#!/bin/sh

CFLAGS="-Wall -fPIC -std=c++11 -O2 -Isrc"

g++ -shared -o libprngCpp.linux.1.0.5.so ${CFLAGS} src/mt19937.cpp
g++ -c -o libprngCpp_s.linux.1.0.5.o ${CFLAGS} src/mt19937.cpp
ar -qc libprngCpp_s.linux.1.0.5.a libprngCpp_s.linux.1.0.5.o
ranlib libprngCpp_s.linux.1.0.5.a

