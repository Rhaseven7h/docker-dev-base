FROM ubuntu
MAINTAINER Gabriel Medina <rha7.com@gmail.com>

# Refresh point
LABEL REFRESH_ON 20150626T131456

# Install system dependencies
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y aptitude nano wget curl build-essential
RUN apt-get install -y openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev
RUN apt-get install -y libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf
RUN apt-get install -y libc6-dev ncurses-dev automake libtool bison subversion pkg-config
 
RUN apt-get install sudo -y
RUN groupadd ooyalasudo && useradd -ms /bin/bash -G ooyalasudo ooyaladev
RUN echo '%ooyalasudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo "ooyaladev:ooyaladev" | chpasswd

VOLUME /opt/devbase

USER ooyaladev

# install RVM, Ruby, and Bundler
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.2.1"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

RUN sudo mkdir /opt/go
RUN sudo chown ooyaladev.ooyaladev /opt/go
RUN curl -s https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz -o- | tar xvfz - -C /opt

ADD bashrc_append.sh /tmp/bashrc_append.sh

RUN cat /tmp/bashrc_append.sh >> ~/.bashrc
