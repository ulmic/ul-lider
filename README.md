Сайт конкурса "Я-лидер!" 2015 года. 
=======
http://ul-lider.ru

[![Build Status](https://travis-ci.org/ulmic/ul-lider.svg?branch=develop)](https://travis-ci.org/ulmic/ul-lider) [![Coverage Status](https://coveralls.io/repos/ulmic/ul-lider/badge.png?branch=develop)](https://coveralls.io/r/ulmic/ul-lider?branch=develop) [![Code Climate](https://codeclimate.com/github/ulmic/ul-lider/badges/gpa.svg)](https://codeclimate.com/github/ulmic/ul-lider)

# Installation

Your need install some packages:
```zsh
$ sudo apt-get install redis-server imagemagick
```
After your need clone this repo:
```zsh
$ git clone git@github.com:ulmic/ul-lider.git
```
After a little bit magick ;)
```bash
$ cd ul-lider
$ bundle
$ cp config/secrets.yml.sample config/secrets.yml
```
At finish just run:
```bash
$ rails s
```

###Troobleshooting
If you see this:

```sh
$ rails s
bin/rails:6: warning: already initialized constant APP_PATH
/{app_path}/bin/rails:6: warning: previous definition of APP_PATH was here
```

You need to reinstall your rmv and ruby:
```sh
$ rvm implode
your need type "yes" there
```

Then your need install ruby and rvm again:

```sh
$ \curl -sSL https://get.rvm.io | bash -s stable --ruby 
```
