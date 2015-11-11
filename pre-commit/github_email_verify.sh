#!/bin/bash

LOCAL_NAME=$(git config --get user.name)
LOCAL_EMAIL=$(git config --get user.email)

GLOBAL_NAME=$(git config --global user.name)
GLOBAL_EMAIL=$(git config --global user.email)

GITHUB=$(git config --get remote.origin.url | grep -c github.com)

if [ $GITHUB -eq 1 ] && [[ $LOCAL_EMAIL == $GLOBAL_EMAIL ]]; then
  echo -e "Trying to commit to a github repo using a private email!\n"
  echo "Local git config"
  echo -e "user.name:\t $LOCAL_NAME"
  echo -e "user.email:\t $LOCAL_EMAIL\n"
  echo "Global git config"
  echo -e "user.name:\t $GLOBAL_NAME"
  echo -e "user.email:\t $GLOBAL_EMAIL"
  exit 1
fi

exit 0
