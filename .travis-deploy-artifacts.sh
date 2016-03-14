#!/bin/bash

set -e

# Do not deploy archives when building pull request
if [ "$TRAVIS_BRANCH" != "master" ] || [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  exit 0
fi

# Deploy jar artifacts to Sonatype OSSRH

./gradlew uploadArchives

# Deploy api and reference documentation to gh-pages

HAWAII_FRAMEWORK_VERSION=`cat gradle.properties | grep "version" | cut -d'=' -f2`
GH_PAGES_DIR=.gh-pages

echo "Deploying docs for version ${HAWAII_FRAMEWORK_VERSION}"

rm -rf ${GH_PAGES_DIR}
git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/hawaiifw/hawaii-framework ${GH_PAGES_DIR}

echo "Cloned the repo"

rm -rf ${GH_PAGES_DIR}/docs/${HAWAII_FRAMEWORK_VERSION}
mkdir -p ${GH_PAGES_DIR}/docs/${HAWAII_FRAMEWORK_VERSION}
unzip -o build/distributions/hawaii-framework-${HAWAII_FRAMEWORK_VERSION}-docs.zip -d ${GH_PAGES_DIR}/docs/${HAWAII_FRAMEWORK_VERSION}

echo "Unzipped docs"
echo "`ls -la ${GH_PAGES_DIR}/docs/${HAWAII_FRAMEWORK_VERSION}`"
echo "`ls -la ${GH_PAGES_DIR}/docs/${HAWAII_FRAMEWORK_VERSION}/api`"

git -C ${GH_PAGES_DIR} config user.email "travis@travis-ci.org"
git -C ${GH_PAGES_DIR} config user.name "Travis"
git -C ${GH_PAGES_DIR} commit --allow-empty -am "Travis build $TRAVIS_BUILD_NUMBER pushed docs to gh-pages"
git -C ${GH_PAGES_DIR} push origin gh-pages

echo "Pushed docs changed"

rm -rf ${GH_PAGES_DIR}