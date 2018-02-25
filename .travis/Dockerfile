FROM base/archlinux

RUN pacman -Syu --noconfirm --needed \
	python python-pip pacman gawk

COPY . /opt/camisole

WORKDIR /opt/camisole
RUN .travis/build.sh

