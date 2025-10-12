#!/bin/sh

for file in $(find . -name \*.c -print); do
  diff <(clang-format "$file") <(cat "$file")
done

for file in $(find . -name \*.h -print); do
  diff <(clang-format "$file") <(cat "$file")
done
