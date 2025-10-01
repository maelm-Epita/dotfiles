#!/bin/sh

for file in $(find . -name \*.c -print); do
  clang-format -i "$file"
done
