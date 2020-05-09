FROM perl:5.30.2-slim-threaded

RUN apt-get update && \
    apt-get install -yq \
      libcurses-perl \
      libjson-perl \
      libstatistics-descriptive-perl && \
    apt-get clean && \
    rm -rf \
	    /tmp/* \
	    /var/lib/apt/lists/* \
	    /var/tmp/*

COPY ping-multi /usr/bin

ENTRYPOINT [ "/usr/bin/ping-multi" ]
