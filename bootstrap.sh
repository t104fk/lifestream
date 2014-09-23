#!/bin/bash
DIR="$(cd `dirname $0`;pwd)"
# install rbenv
if [ -z `which rbenv 2> /dev/null` ]; then
  RBENV_REPO="https://github.com/sstephenson/rbenv.git"
  RUBYBUILD_REPO="https://github.com/sstephenson/ruby-build.git"
  RBENV_HOME="~/.rbenv"
  RUBYBUILD_HOME="$RBENV_HOME/plugins/ruby-build"
  [ ! -d $RBENV_HOME ] && git clone $RBENV_REPO $RBENV_HOME
  [ ! -d $RUBYBUILD_HOME ] && git clone $RUBYBUILD_REPO $RUBYBUILD_HOME
  echo "install rbenv and ruby-build."
fi

RUBY_VERSION="2.1.3"
if [ `rbenv versions | grep $RUBY_VERSION | wc -l` -lt 1 ]; then
  rbenv install $RUBY_VERSION
  rbenv rehash
fi

GEMS=(chef knife-solo)
for p in ${GEMS[@]}
do
  if [ `gem list --local | grep $p | wc -l` -lt 1 ]; then
    gem install $p --no-ri --no-rdoc
    rbenv rehash
  fi
done

