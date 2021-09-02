# VoidBuilder

## About
a simplistic container to build your packages for [void-linux](https://github.com/void-linux/void-packages)

## Overview
adjust the path to your repo in the makefile and pass the pkg name as argument to make build. 
to run the container needs elevated privileges, which have been granted within the run command.


To test the package, commit the built container and run it as root.
Assure yourself the necessary dependencies are met for any package to be tested.


#### example
```shell
make pkg="${PKGNAME}" build
make run
docker commit "${CONTAINER_ID}" debug/${PKGNAME}
docker run -it -u 0 --entrypoint /bin/sh debug/${PKGNAME}
```

