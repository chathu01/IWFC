#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
rm -rf out
mkdir -p out
find src/main/java -name '*.java' > sources.txt
javac -encoding UTF-8 -source 17 -target 17 -d out @sources.txt
rm -f sources.txt
java -cp out com.iwfc.ui.IWFCGui
