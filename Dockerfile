# Dockerfile for a Rails application using Nginx and Unicorn

# Select ubuntu as the base image
FROM dockerfile/nginx

# Install Ruby
ADD install_ruby.sh /tmp/
RUN /tmp/install_ruby.sh
RUN gem update --system --no-document
RUN gem install bundler --no-ri --no-rdoc

# Install dependencies.
RUN apt-get update
RUN apt-get install -y \
  libpq-dev \
  nodejs \
  nodejs-legacy \
  npm

# Run app as ruby user
RUN addgroup --system rails
RUN adduser --system --no-create-home --ingroup rails rails
# RUN adduser --disabled-password --gecos "" ruby

# Create the apps directory
RUN mkdir /apps
RUN chown -R ruby:ruby \
  /apps
  /usr/local/
  /usr/lib/
  /usr/bin/

COMMAND ["nginx"]