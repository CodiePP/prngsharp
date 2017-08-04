#!/bin/sh

# have 'brew install openssl' to the newest version
OpenSSL_LIB="/usr/local/opt/openssl/lib"
OpenSSL_LDFLAGS="-v -L${OpenSSL_LIB} ${OpenSSL_LIB}/libssl.a
${OpenSSL_LIB}/libcrypto.a"
OpenSSL_CPPFLAGS="-I${OpenSSL_LIB}/../include"

CFLAGS="-Wall -fPIC -std=c++11 -O2 -Isrc ${OpenSSL_LDFLAGS} ${OpenSSL_CPPFLAGS}"

g++ -shared -o libprngCpp.1.0.4.dylib ${CFLAGS} src/mt19937.cpp

