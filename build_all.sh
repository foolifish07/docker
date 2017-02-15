#!/bin/bash -exu

# environment
./base/build.sh
./java/build.sh
./nodejs/build.sh

# gui app
./chrome/build.sh
./firefox/build.sh

# for shanghai QE
./selenium-chrome/build.sh