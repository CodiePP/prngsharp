#!/bin/sh

PLATFRM="Any CPU"

sh mk_linux.sh

sn -k sharpPRNG/sharpPRNG.snk

xbuild /t:clean /p:Configuration="Debug" /p:Platform="${PLATFRM}" sharpPRNG/sharpPRNG.sln
$? || exit $?

xbuild /p:Configuration="Debug" /p:Platform="${PLATFRM}" sharpPRNG/sharpPRNG.sln
$? || exit $?

cp libprngCpp.1.0.4.so  sharpPRNG/testSharpPRNG/bin/Debug/

mono sharpPRNG/testSharpPRNG/bin/Debug/testSharpPRNG.exe

