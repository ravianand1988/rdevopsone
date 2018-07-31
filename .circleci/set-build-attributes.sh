#!/usr/bin/env bash

# Set BUILD_NUM to $CIRCLE_BUILD_NUM
echo "BUILD_NUM=${CIRCLE_BUILD_NUM}"
echo "export BUILD_NUM=${CIRCLE_BUILD_NUM}" >> $BASH_ENV
sed -i.back "s/.*\"buildNum\":.*/  \"buildNum\": \"${CIRCLE_BUILD_NUM}\",/" ~/repo/package.json

# Set BUILD_BRANCH
case "${CIRCLE_TAG:-$CIRCLE_BRANCH}" in
    release-*)
      BUILD_BRANCH=live
    ;;
    *)
      BUILD_BRANCH=${CIRCLE_BRANCH//\//_}
    ;;
esac
echo "BUILD_BRANCH=${BUILD_BRANCH}"
echo "export BUILD_BRANCH=${BUILD_BRANCH}" >> $BASH_ENV

# Set VERSION
VERSION=$(npx -c 'echo "$npm_package_version"')
echo "VERSION=${VERSION}"
echo "export VERSION=${VERSION}" >> $BASH_ENV
