FROM ajoergensen/baseimage-ubuntu
ARG _builddep="libpurple-dev bitlbee-dev autoconf libjson-glib-dev libglib2.0-dev libprotobuf-c-dev protobuf-c-compiler mercurial make libgcrypt20-dev libwebp-dev gettext build-essential git"

RUN \
	curl -s https://code.bitlbee.org/debian/release.key | apt-key add - && \
	curl -s https://jgeboski.github.io/obs.key | apt-key add - && \
	curl -s https://build.opensuse.org/projects/GNOME:Apps:pidgin-sipe/public_key  | apt-key add - && \
	echo "deb http://code.bitlbee.org/debian/master/xenial/amd64/ ./" > /etc/apt/sources.list.d/bitlbee.list && \
	echo "deb http://download.opensuse.org/repositories/home:/jgeboski/xUbuntu_16.04 ./" > /etc/apt/sources.list.d/jgeboski.list	
	echo "deb https://download.opensuse.org/repositories/GNOME:/Apps:/pidgin-sipe/xUbuntu_16.04 ./" > /etc/apt/sources.list.d/pidgin-sipe.list
	apt-get update && \
	apt-get -y dist-upgrade && \
	apt-get -y install bitlbee-libpurple bitlbee-plugin-otr bitlbee-facebook bitlbee-steam pidgin-sipe $_builddep && \
	cd /tmp && \
	hg clone https://bitbucket.org/EionRobb/purple-hangouts/ && cd purple-hangouts && \
	make && make install && \
	cd /tmp && \
	git clone --recursive https://github.com/majn/telegram-purple && cd telegram-purple && \
	./configure && make && make install && \
	cd /tmp && \
	git clone git://github.com/EionRobb/skype4pidgin.git && cd skype4pidgin/skypeweb && \
	make && make install && \
	cd /tmp && \
	git clone https://github.com/dylex/slack-libpurple.git && cd slack-libpurple && \
	make && make install &
	apt-get purge $_builddep && \
	cleanup.sh

COPY root/ /

RUN \
        chmod -v +x /etc/my_init.d/* /etc/service/*/run

VOLUME [ "/var/lib/bitlbee" ]
