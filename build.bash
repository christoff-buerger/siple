#!/bin/bash

# This program and the accompanying materials are made available under the
# terms of the MIT license (X11 license) which accompanies this distribution.

# author: Christoff Bürger

# Clear all:
rm *.jar
rm -rf src-gen
rm -rf java-bin
mkdir src-gen
mkdir java-bin

# Generate code:
java -jar tools/jflex.jar -d src-gen/siple specifications/Lexer.jflex
java -jar tools/beaver.jar -c -d src-gen specifications/Parser.beaver
java -jar tools/jastadd2.jar --rewrite --package="siple.ast" --o=src-gen \
	specifications/*.ast specifications/*.jrag

# Build distribution:
javac -deprecation -encoding utf-8 -classpath tools/beaver-rt.jar \
	-d java-bin -sourcepath src-gen src/**/*.java src-gen/**/*.java
binaries=`find java-bin/*`
jar cfm siple.jar manifest.txt -C java-bin ${binaries#*/}
