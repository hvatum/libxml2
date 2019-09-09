FROM debian:stretch-slim

RUN sed -i 's|main|main contrib non-free|g' /etc/apt/sources.list && \
	dpkg --add-architecture i386 && apt-get update && apt-get install -y \
	gcc g++ build-essential make git cifs-utils sudo wget gnupg1 \
	 python-dev autoconf automake libtool bash locales \
	gcc-multilib g++-multilib libc6-dev:i386 libpng16-16:i386
	 
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8 

COPY dockerfiles/my_init /sbin/
RUN chmod +x /sbin/my_init

USER jenkins

CMD ["/sbin/my_init"]
