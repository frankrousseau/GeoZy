#!/bin/bash

set -e

# Inspect binary.
if [ $platform == "linux" ]; then
    ldd ./lib/glslOptimizer.node
elif [ $platform == "darwin" ]; then
    otool -L ./lib/glslOptimizer.node
fi

COMMIT_MESSAGE=$(git show -s --format=%B $TRAVIS_COMMIT | tr -d '\n')

if test "${COMMIT_MESSAGE#*'[publish binary]'}" != "$COMMIT_MESSAGE"
    then

    node-pre-gyp package
    node-pre-gyp testpackage
    node-pre-gyp publish
    node-pre-gyp info
    rm -rf build
    node-pre-gyp clean
    npm install --fallback-to-build=false
    npm test
fi
