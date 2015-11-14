#!/usr/bin/env bash

LOCAL_NAME=$(git config --get user.name)
LOCAL_EMAIL=$(git config --get user.email)

GLOBAL_NAME=$(git config --global user.name)
GLOBAL_EMAIL=$(git config --global user.email)

GITHUB=$(git config --get remote.origin.url | grep -c github.com)

if [ "$GITHUB" -eq 1 ] && [[ "$LOCAL_EMAIL" == "$GLOBAL_EMAIL" ]]; then
  # assigns stdin
  exec < /dev/tty

  printf \
"[WARN] Trying to commit to a github repo using a private email
Local git config
\tuser.name:\t%s
\tuser.email:\t%s
Global git config
\tuser.name:\t%s
\tuser.email:\t%s\n\n" \
"$LOCAL_NAME" "$LOCAL_EMAIL" "$GLOBAL_NAME" "$GLOBAL_EMAIL"

  read -p "[WARN] Proceed with private email [$LOCAL_EMAIL] (y/n): " -r OPTION

  if [[ $OPTION == [yY] ]]; then
    exit 0
  else
    read -p "Enter new local user.email: " -r NEW_EMAIL

    read -p "Proceed with new local user.email [$NEW_EMAIL] (y/n): " -r OPTION

    case $OPTION in
      [yY]* ) git config user.email "$NEW_EMAIL" && \
              printf "\n[OK] Please run the commit again\n" && \
              exit 1;;
          * ) exit 1;;
    esac
  fi
fi

exit 0
