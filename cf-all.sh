#!/bin/sh

for file in $(find . -name \*.c -print); do
  clang-format -i "$file"
done

for file in $(find . -name \*.h -print); do
  clang-format -i "$file"
done
