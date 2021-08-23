# VoidBuilder

## About
a simplistic container to build your packages for [void-linux](https://github.com/void-linux/void-packages)

## Overview
adjust the path to your repo in the makefile and pass the pkg name as argument to make build. 
to run the container needs elevated privileges, which have been granted within the run command.

#### example
```
make pkg="libcgroup" build
make run
```

