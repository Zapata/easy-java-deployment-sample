#!/usr/bin/env bash

extract_dir=devops

start() {
  appname=$1
  ./$extract_dir/$appname/bin/$appname start
  sleep 10
  ./$extract_dir/$appname/bin/$appname status
  if [ $? -ne 0 ]
  then
	  echo "Failed to start $appname"
	  exit 1
  fi
}

stop() {
  appname=$1
  ./$extract_dir/$appname/bin/$appname stop
}

if [ -d $extract_dir ]
then
  echo "Uninstalling..."
  stop devops-core
  stop devops-web  
  rm -rf $extract_dir
fi

echo "Installing new version..."
tar xzf /vagrant/target/devops-0.0.1-SNAPSHOT-dist.tar.gz
chmod +x $extract_dir/*/bin/*

start devops-core
start devops-web