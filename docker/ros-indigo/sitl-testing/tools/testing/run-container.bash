#!/bin/bash

if [ -z "$WORKSPACE" ]; then
	echo "\$WORKSPACE not set"
	exit 1
fi

# Pulling latest image
docker pull px4io/sitl-testing

#
# Running SITL testing container
# Assuming that necessary source projects, including this one, are cloned in the build server workspace of this job.
#
docker run --rm -v "$WORKSPACE:/job:rw" px4io/sitl-testing bash "/sitl/scripts/testing/run-tests.bash"
