# Automated built void-packages

.PHONY: help build
.DEFAULT_GOAL := help

help: 	Makefile
	sed -n '1p' $<


TAGNAME=voidbuilder
UID := $(shell id -u)
REPOBASEPATH := "/home/general/work"
REPONAME := "void-packages"

ifeq ($(pkg),)
$(info pkg not set)
all:
else

PKGNAME := $(pkg)

build:
	rm -rf ./${REPONAME} || true
	cp -r ${REPOBASEPATH}/${REPONAME} .
	docker build . \
		-t ${TAGNAME} \
		--build-arg UID=${UID} \
		--build-arg PKGNAME=${REPONAME}

endif


run:
	docker run \
		-it \
		--security-opt seccomp=unconfined \
		${TAGNAME}

