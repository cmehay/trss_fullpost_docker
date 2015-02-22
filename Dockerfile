FROM debian

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y git

RUN mkdir -p /config/http/plugins/af_fullpost
RUN git clone https://github.com/itohsnap/ttrss_fullpost.git /config/http/plugins/af_fullpost
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /config/http/plugins/af_fullpost

CMD true
