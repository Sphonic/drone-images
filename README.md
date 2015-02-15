# Drone Continuous Integration

Scripts and Dockerfiles to generate build machines for Drone CI.

---

These scripts are based on the https://github.com/drone/images repository.

The base image is mostly compatible with the drone.io one.
The biggest difference is the upgrade to Ubuntu trusty (14.04) and the decission
to run all builds as `root`.

---

All scripts have a preconfigured `DOCKER_USER` that is used as first part of
each repository name.
If images should be build for a different organisation than 'sphonic' the env
variable needs to be change accordingly.

The images are all based on a ubuntu seed image that is created from an ubuntu
cloud image. A working linux system with docker, lxc-utils and recent
lxc-templates is required to build the seed image.

Ubuntu 14.04 is the system that was used for testing.

The script `ubuntu-seed/build.sh` can be used to generate seed images for
different ubuntu versions by exporting the `UBUNTU_RELEASE` env variable.

```terminal
UBUNTU_RELEASE=trusty  ubuntu-seed/build.sh
UBUNTU_RELEASE=precise ubuntu-seed/build.sh
```

This will result in `sphonic/ubuntu:trusty` and `sphonic/ubuntu:precise` docker
images being created and imported.

All other images can be build in a one-shot manner using the supplied helpers:

### build_images

This will loop through the defined templates and build them in serial.
A logfile for each image will be placed in `logs/` by default.
The log directory can be changed using the `LOG_DIR` env variable.

To skip specific images the script can be edited and the `build` command for the
image can be changed to `skip`.

### cleanup_images

This will loop through the defined templates and remove the already created
images from the local docker repository.

*To skip specific images the script can be edited and the `remove` command for
the image can be changed to `skip`.*

### publish_images

This will loop through the defined templates and push the generated images to the
configured remote docker repository.
To successfully push images you have to be authenticated already.
For authentication with the hub run `docker login` and enter your credentials.

*To skip specific images the script can be edited and the `publish` command for
the image can be changed to `skip`.*

# Image definitions

Images are split into basic groups `builder` and `database`.
A `builder` is a machine for actually *building* a source repository.
All other groups suply additional services that can be requested inside a
`.drone.yml` definition for running tests.

`builders` are generally based on a `base` image which includes a majority of
supportive tooling out of the box.

## Base

A JeOS ubuntu image with some automation around compiler toolkits.

Included software:

- git
- mercurial
- subversion
- bzr
- fossil
- unzip
- gzip
- bzip2
- xz
- gcc
- clang
- automake
- autoconf
- autogen
- libtool
- make
- cmake
- gdb
- bison
- flex
- scons
- imagemagick
- sqlite3
- mysql-client
- postgres-client
- libcurl
- libffi
- libfontconfig
- libgdbm
- libmagick
- libmemcache
- libmysql
- libncurses
- libossp-uuid
- libpq
- libqt4
- libreadline
- libsqlite3
- libssl
- libxml2
- libxslt
- libyaml
- libz
- libzmq
- chromedriver
- chromium
- firefox
- phantomjs
- java (openjdk-7)
- ant
- ivy
- maven
- gradle
- golang (via goenv)
- nodejs (via nodenv)
- python (via pyenv)
- ruby (via rbenv)

### Builders

```
# gcc
docker pull sphonic/gcc:4.6
docker pull sphonic/gcc:4.7
docker pull sphonic/gcc:4.8

# scala
docker pull sphonic/scala:2.9.3
docker pull sphonic/scala:2.10.4
docker pull sphonic/scala:2.11.5

# clojure
docker pull sphonic/leiningen:2.5.1

# nodejs
docker pull sphonic/nodejs:0.8.26
docker pull sphonic/nodejs:0.10.36
docker pull sphonic/nodejs:0.11.14

# golang
docker pull sphonic/golang:1.2.2
docker pull sphonic/golang:1.3.3
docker pull sphonic/golang:1.4.1

# python
docker pull sphonic/python:2.7.9
docker pull sphonic/python:3.2.6
docker pull sphonic/python:3.3.6
docker pull sphonic/python:3.4.2

# ruby
docker pull sphonic/ruby:1.9.3-p551
docker pull sphonic/ruby:2.0.0-p598
docker pull sphonic/ruby:2.1.5
docker pull sphonic/ruby:2.2.0
```

### Databases

```
# elasticsearch
docker pull sphonic/elasticsearch:0.90.13
docker pull sphonic/elasticsearch:1.0.3
docker pull sphonic/elasticsearch:1.1.2
docker pull sphonic/elasticsearch:1.2.3
docker pull sphonic/elasticsearch:1.3.8
docker pull sphonic/elasticsearch:1.4.3
```
