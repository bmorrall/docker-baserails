#!/bin/bash -ex

# based on https://github.com/promptworks/docker-ruby-2.1/blob/master/install_ruby.sh

export RUBY_INSTALL_VERSION=0.4.3
export RUBY_VERSION=2.1.2

cd /tmp

wget -O ruby-install-$RUBY_INSTALL_VERSION.tar.gz \
  https://github.com/postmodern/ruby-install/archive/v$RUBY_INSTALL_VERSION.tar.gz
tar -xzf ruby-install-$RUBY_INSTALL_VERSION.tar.gz
cd ruby-install-$RUBY_INSTALL_VERSION
make install
ruby-install -i /usr/local ruby $RUBY_VERSION

make uninstall
rm -rf /usr/local/src/ruby*
rm -rf /tmp/*
