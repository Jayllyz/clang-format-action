#!/bin/sh

# This script is used to test the GitHub Action locally and in CI workflow.

mkdir temp_repository
cd temp_repository || exit

git config --global init.defaultBranch main

git init
git config user.name "Test User"
git config user.email "test@mail"

touch test.c

git add .

git commit -m "Initial commit"

# Add code that violates the style
printf "#include <stdio.h>\nvoid main(){for(int i=0;i<10;i++){printf(\"Hello, world!\");}}" >test.c

# Commit the changes
git add .

git commit -m "Add code that violates the style guide"

echo "Clang-format version:"
clang-format --version

# Run clang-format on the file
git clang-format --extensions=c -v HEAD^

git commit -am "clang-format ✅"

cat test.c

# Exit with a success code
exit 0
