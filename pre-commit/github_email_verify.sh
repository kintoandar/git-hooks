#!/bin/bash

LOCAL_NAME=$(git config --get user.name)
LOCAL_EMAIL=$(git config --get user.email)

GLOBAL_NAME=$(git config --global user.name)
GLOBAL_EMAIL=$(git config --global user.email)

GITHUB=$(git config --get remote.origin.url | grep -c github.com)

if [ "$GITHUB" -eq 1 ] && [[ "$LOCAL_EMAIL" == "$GLOBAL_EMAIL" ]]; then
  # assigns stdin
  exec < /dev/tty

  echo -e "\n[WARN] Trying to commit to a github repo using a private email\n"
  echo "Local git config"
  echo -e "user.name:\t $LOCAL_NAME"
  echo -e "user.email:\t $LOCAL_EMAIL\n"
  echo "Global git config"
  echo -e "user.name:\t $GLOBAL_NAME"
  echo -e "user.email:\t $GLOBAL_EMAIL\n"

  echo -n "[WARN] Proceed with private email [$LOCAL_EMAIL] (y/n): "
  read -r OPTION

  if [[ $OPTION == [yY] ]]; then
    exit 0
  else
    echo -ne "\nEnter new local user.email: "
    read -r NEW_EMAIL

    echo -n "Proceed with new local user.email [$NEW_EMAIL] (y/n): "
    read -r OPTION

    case $OPTION in
      [yY]* ) git config user.email "$NEW_EMAIL" && \
              echo -e "\n[OK] Please run the commit again" && \
              exit 1;;
          * ) exit 1;;
    esac
  fi
fi

exit 0
