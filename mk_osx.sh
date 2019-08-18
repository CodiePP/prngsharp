#!/bin/sh

# have 'brew install openssl' to the newest version
OpenSSL_LIB="/usr/local/opt/openssl/lib"
OpenSSL_LDFLAGS="-v -L${OpenSSL_LIB} ${OpenSSL_LIB}/libssl.a ${OpenSSL_LIB}/libcrypto.a"
OpenSSL_CPPFLAGS="-I${OpenSSL_LIB}/../include"

CFLAGS_dyn="-Wall -fPIC -std=c++11 -O2 -Isrc ${OpenSSL_LDFLAGS} ${OpenSSL_CPPFLAGS}"
CFLAGS_s="-Wall -std=c++11 -O2 -Isrc ${OpenSSL_LDFLAGS} ${OpenSSL_CPPFLAGS}"

export MACOSX_DEPLOYMENT_TARGET="10.11.0"

clang++ -shared -o libprngCpp.osx.1.0.5.dylib ${CFLAGS_dyn} src/mt19937.cpp
clang++ -c -o libprngCpp_s.osx.1.0.5.o ${CFLAGS_s} src/mt19937.cpp
ar -qc libprngCpp_s.osx.1.0.5.a libprngCpp_s.osx.1.0.5.o
ranlib libprngCpp_s.osx.1.0.5.a

