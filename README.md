# container-ubuntu-systemd
Ubuntu 20.04 container image with systemd support.
This container image is built automatically on repository push.
# Table of Contents
- [container-ubuntu-systemd](#container-ubuntu-systemd)
- [Table of Contents](#table-of-contents)
  - [How to Build](#how-to-build)
  - [How to Use](#how-to-use)

## How to Build
If you want to build this image yourself follow this steps:
1. Install [Docker](https://docs.docker.com/get-docker/) or [Podman](https://podman.io/getting-started/installation) container engine
2. `clone` this repository and `cd` into the cloned directory
3. Run one of:
    1. `<docker/podman> build -t ubuntu .` if you want to build the latest major release. `20.04` at this moment
    2. `<docker/podman> build --build-arg=BASE_TAG=20.10 -t ubuntu:20.10 .` if you want to build a specific release
4. After the build is successful you can view the image with `<docker/podman> images`
## How to Use
To use the repository image:
1. Install [Docker](https://docs.docker.com/get-docker/) or [Podman](https://podman.io/getting-started/installation) container engine
2. Pull this image from Docker Hub: `<docker/podman> pull docker.io/vladvetu/ubuntu`
3. Run a container from the pulled image: 
   1. With systemd: `<docker/podman> run --detach --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro docker.io/vladvetu/ubuntu:latest` or use a specific image
   2. Without systemd: `<docker/podman> run --tty --interactive docker.io/vladvetu/ubuntu:latest bash` or use a specific image

> **Note**: To be able to run systemd inside containers at the date of writing this you need to user `cgroupVersion: v1`. If you have `cgroupVersion: v2` the container will start but any `systemctl` command will return an error.
> 1. Check CGroup Version `<docker/podman> info | grep -i cgroup`
> 2. If version is `2` then you have to append to your kernel parameter `systemd.unified_cgroup_hierarchy=0`. Please check your bootloader  documentation on how to pass this parameter.
> 3. Reboot your system and try again to use the image

> **Important Note**: Running containers with `--privileged` in PRODUCTION should be AVOIDED at any cost. The above examples are for testing purpose ONLY on a isolated environment. Use it at your own risk.