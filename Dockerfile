# VERISON 0.99.0

FROM ubuntu:latest
MAINTAINER = Jason M. Mills <jmmills@cpan.org>

ENV PATH $PATH:/usr/share/plenv/bin
ENV DEBIAN_FRONTEND noninteractive

RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe >/etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git build-essential curl

RUN git clone git://github.com/tokuhirom/plenv.git /usr/share/plenv
RUN git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build

ADD plenv_profile.sh /etc/profile.d/plenv.sh
RUN plenv install-cpanm

CMD ["/bin/bash", "-l"]
