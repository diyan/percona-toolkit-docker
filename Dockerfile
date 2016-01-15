FROM alpine:3.2
MAINTAINER Alexey Diyan <alexey.diyan@gmail.com>

# NOTE tool works on alpine:3.2, perl-5.20 but failed on alpine:3.3, perl-5.22:
# Pipeline process X (iteration) caused an error: Redundant argument in sprintf
ENV PERCONA_VERSION 2.2.16

RUN set -x \
  && buildDeps='make' \
  && apk add --update perl perl-dbi perl-dbd-mysql perl-io-socket-ssl perl-term-readkey $buildDeps \
  && wget -O /tmp/percona-toolkit.tar.gz https://www.percona.com/downloads/percona-toolkit/${PERCONA_VERSION}/tarball/percona-toolkit-${PERCONA_VERSION}.tar.gz \
  && tar -xzvf /tmp/percona-toolkit.tar.gz -C /tmp \
  && cd /tmp/percona-toolkit-${PERCONA_VERSION} \
  && perl Makefile.PL \
  && make \
  && make test \
  && make install \
  && apk del $buildDeps \
  && rm -rf /var/cache/apk/* /tmp/percona-toolkit*

#CMD sh
