#!/bin/bash

set -e

PLATFRM="Any CPU"

sh mk_linux.sh

sn -k sharpPRNG/sharpPRNG.snk

xbuild /t:clean /p:Configuration="Debug" /p:Platform="${PLATFRM}" sharpPRNG/sharpPRNG.sln
xbuild /p:Configuration="Debug" /p:Platform="${PLATFRM}" sharpPRNG/sharpPRNG.sln

cp libprngCpp.linux.1.0.5.so  sharpPRNG/testSharpPRNG/bin/Debug/

mono sharpPRNG/testSharpPRNG/bin/Debug/testSharpPRNG.exe

