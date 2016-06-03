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

  read -p "[WARN] Use global email [$GLOBAL_EMAIL] for this repo (y/N): " -r OPTION

  if [[ $OPTION == [yY] ]]; then
    git config --local user.email "$GLOBAL_EMAIL"
    printf "\n[OK] Please run the commit again\n"
    exit 1
  else
    
    if [[ ! -z "$PRE_COMMIT_GITHUB_EMAIL" ]]; then
      read -p "Enter new local user.email or leave blank to proceed with [$PRE_COMMIT_GITHUB_EMAIL]: " -r NEW_EMAIL
      if [[ -z "$NEW_EMAIL" ]]; then
        NEW_EMAIL="$PRE_COMMIT_GITHUB_EMAIL"
      fi
    else 
      read -p "Enter new local user.email: " -r NEW_EMAIL
    fi

    read -p "Proceed with new local user.email [$NEW_EMAIL] (Y/n): " -r OPTION

    case $OPTION in
      [nN]* ) printf "\n[FATAL] Aborted by user!\n" && \
              exit 1;;
          * ) git config --local user.email "$NEW_EMAIL" && \
              printf "\n[OK] Please run the commit again\n" && \
              exit 1;;
    esac
  fi
fi

exit 0
