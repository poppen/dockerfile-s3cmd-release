FROM phusion/baseimage:0.9.16
MAINTAINER MATSUI Shinsuke <poppen.jp@gmail.com>
ENV version 1.5.2

RUN apt-get update && \
    apt-get -y install \
        python-setuptools

WORKDIR /tmp
ADD https://github.com/s3tools/s3cmd/releases/download/v${version}/s3cmd-${version}.tar.gz /tmp/
RUN tar xzf s3cmd-${version}.tar.gz && \
    cd s3cmd-${version} && \
    python setup.py install

WORKDIR /
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /tmp/work

CMD ["/sbin/my_init"]
