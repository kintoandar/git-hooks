#!/usr/bin/env bash

LOCAL_NAME=$(git config --local user.name)
LOCAL_EMAIL=$(git config --local user.email)

GLOBAL_NAME=$(git config --global user.name)
GLOBAL_EMAIL=$(git config --global user.email)

GITHUB=$(git config --get remote.origin.url | grep -c github.com)

if [ "$GITHUB" -eq 1 ] && [[ -z "$LOCAL_EMAIL" ]]; then
  # assigns stdin
  exec < /dev/tty

  printf \
"[WARN] Trying to commit to a github repo using global settings
Global git config
\tuser.name:\t%s
\tuser.email:\t%s\n\n" \
"$GLOBAL_NAME" "$GLOBAL_EMAIL"

  read -p "[WARN] Proceed with global email [$GLOBAL_EMAIL] (y/n): " -r OPTION

  if [[ $OPTION == [yY] ]]; then
    git config --local user.email "$GLOBAL_EMAIL"
    printf "\n[OK] Please run the commit again\n"
    exit 1
  else
    read -p "Enter new local user.email: " -r NEW_EMAIL

    read -p "Proceed with new local user.email [$NEW_EMAIL] (y/n): " -r OPTION

    case $OPTION in
      [yY]* ) git config --local user.email "$NEW_EMAIL" && \
              printf "\n[OK] Please run the commit again\n" && \
              exit 1;;
          * ) exit 1;;
    esac
  fi
fi

exit 0
