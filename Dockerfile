# Dockerfile for a Rails application using Nginx and Unicorn

# Select ubuntu as the base image
FROM dockerfile/ubuntu

# Install Ruby
ADD install_ruby.sh /tmp/
RUN /tmp/install_ruby.sh
RUN gem update --system --no-document
RUN gem install bundler --no-ri --no-rdoc

# Install dependencies.
RUN apt-get update
RUN apt-get install -y libpq-dev

# Install npm
RUN apt-get install -y nodejs
RUN apt-get install -y nodejs-legacy
RUN apt-get install -y npm

# set WORKDIR
RUN mkdir -p /apps/please-ignore
WORKDIR /apps/please-ignore/current

# Run app as ruby user
# RUN addgroup --system ruby
# RUN adduser --system --no-create-home --ingroup railsapps pleaseignore
RUN adduser --disabled-password --gecos "" ruby

# Create the apps directory
RUN mkdir /apps
RUN chown -R ruby:ruby /apps
