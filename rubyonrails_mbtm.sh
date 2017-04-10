#!/bin/bash
echo 'Iniciando a instalação do Ruby on Rails no seu: '
cat /proc/version

sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs

#rvm
echo 'Instalando RVM '
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.4.0
rvm use 2.4.0 --default
echo 'Instalando: '
ruby -v

gem install bundler

#git
echo "Deseja configurar GIT se sim digite 'y' se não digite 'n' " ; read git

if [ $git == 'y' ]
then
  echo 'Iniciando...'
  echo "Digite nome do usuário no GIT " ; read name
  echo "Digite email do usuário no GIT " ; read email
  git config --global color.ui true
  git config --global user.name "$name"
  git config --global user.email "$email"
  ssh-keygen -t rsa -b 4096 -C "$email"   
else
  echo 'Pulando configuração do GIT.'
fi

#Rails
echo 'Instalando Rails: '
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
gem install rails -v 5.0.1
echo 'Instalando: '
rails -v

#mysql
echo "Deseja instalar o MySQL se sim digite 'y' se não digite 'n' " ; read my

if [ $my == 'y' ]
then
  echo 'Iniciando...'
  sudo apt-get install mysql-server mysql-client libmysqlclient-dev
else
  echo 'Pulando instalação do MySQL.'
fi

#PostgreSQL
echo "Deseja instalar o PostgreSQL se sim digite 'y' se não digite 'n' " ; read pos

if [ $pos == 'y' ]
then
  echo 'Iniciando...'
  sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
  wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
  sudo apt-get update
  sudo apt-get install postgresql-common
  sudo apt-get install postgresql libpq-dev 

  echo 'Intalando PGadmin3'
  sudo apt-get install pgadmin3
else
  echo 'Pulando instalação do POstgreSQL.'
fi
