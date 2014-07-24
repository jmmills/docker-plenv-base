FROM ubuntu:latest
MAINTAINER = Jason M. Mills <jmmills@cpan.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y git curl

RUN git clone git://github.com/tokuhirom/plenv.git /usr/share/plenv
RUN git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build
ENV PATH ${PATH}:/usr/share/plenv/bin

ADD plenv_profile.sh /etc/profile.d/plenv.sh
ADD plenv-latest_version /usr/share/plenv/libexec/

ONBUILD RUN plenv rehash

CMD ["/bin/bash", "-l"]
