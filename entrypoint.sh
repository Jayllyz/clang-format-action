#!/bin/sh -l

git config --global --add safe.directory ${GITHUB_WORKSPACE}

BASE_REF="$5"

if [ "$4" != "latest" ]; then
    apk add --no-cache "clang$4-extra-tools"
else
    apk add --no-cache clang-extra-tools
fi

clang-format --version

# if check only

if [ "$1" = "true" ]; then
    echo "Checking formatting..."
    git clang-format --diff --style="$2" --extensions="$3" -v "${BASE_REF}"
    if [ $? -eq 0 ]; then
        echo "All files are formatted correctly."
    fi
    exit 0
fi

# if check and format

if [ "$1" = "false" ]; then
    echo "Formatting files..."
    git clang-format --style="$2" --extensions="$3" -v "${BASE_REF}"
    if [ $? -eq 0 ]; then
        echo "All files are formatted correctly."
    fi
    exit 0
fi
