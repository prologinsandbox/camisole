FROM base/archlinux

RUN pacman -Syuq --noconfirm --needed \
	python python-pip base-devel pkgfile sudo git \
	&& pkgfile --update \
	&& useradd -m -U -s /bin/bash user \
	&& echo 'user ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/user
	
USER user 

COPY . /home/user/camisole
WORKDIR /home/user/camisole

RUN id && ls -alh /home
RUN .travis/build.sh

