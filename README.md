docker-plenv
============

An isolated perl environment using docker, plenv, and the latest stable perl

Hack on latest Perl quickly?
=======================

```
$ docker pull jmmills/plenv:latest
$ docker run jmmills/plenv:latest
```

Want to spin up a known-to-work image for devs on a project (for Dist::Zilla)?
==========================

```
$ docker pull jmmills/plenv:latest
$ CONTAINER_ID=$( docker run -d -i -t /bin/bash -l ) && docker attach $CONTAINER_ID

root@92308d1f9ae2:/# cpanm Dist::Zilla
# ...
root@92308d1f9ae2:/# git clone ${GIT_URL} ${PROJECT_DIR}
root@92308d1f9ae2:/# cd ${PROJECT_DIR}
root@92308d1f9ae2:/# dzil authordeps | cpanm
# ...
root@92308d1f9ae2:/# dzil listdeps | cpam
root@92308d1f9ae2:/# exit

$ docker commit $CONTAINER_ID ${PROJECT_NAME}:latest
$ docker push ${PROJECT_NAME}:latest
```

Now any developer can get right to a working development environment easily with:
```
$ docker pull ${PROJECT_NAME}:latest
```

To use with targeted perl
==========================

If there is a tagged version in my docker index?
```
$ docker pull jmmills/plenv:5.18.2
```

I may in the near future attempt to interate through the available version from plenv.
Until then perhaps you would like to build your own? Or, maybe spin up a non-maint version for testing

```
$ docker pull jmmills/plenv:base
$ CONTAINER_ID=$( docker run -d jmmills/plenv:base sh -c 'plenv install 5.17.2 && plenv global 5.17.2' ) \
               && docker attach $CONTAINER_ID \
               && docker commit $CONTAINER_ID my_perl_build:5.17.2
$ docker run -t -i my_perl_build:5.17.2 /bin/bash -l

root@11dfc289f789:/# plenv versions
  system
* 5.17.2 (set by //.plenv/version)
root@11dfc289f789:/# exit
logout

$ 
```

What is this for?
=================

Mostly? Mostly for me. Maybe it could be for you?
You can use this to test module dependancy pull-in from CPAN, or build a perl development and/or integration and/or testing environment around it.
I'm not quite sure what it will be good for yet, other than allowing me to quickly pull down a copy of the latest stable perl in a runnable environment rather quickly.




