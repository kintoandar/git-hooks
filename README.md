Table of Contents
=================

  * [Collection of git hooks](#collection-of-git-hooks)
    * [pre\-commit hooks](#pre-commit-hooks)
      * [github\_email\_verify](#github_email_verify)
        * [Motivation](#motivation)
        * [Install](#install)
        * [Optional](#optional)
        * [Demo](#demo)
    * [Contributors](#contributors)

# Collection of git hooks

## pre-commit hooks

### github_email_verify
This hook reminds you if you forgot to change your local personal email on a github repo, but you still want to use your professional email globally on your system.

#### Motivation
We've created this hook after we had, yet again, to rewrite history by removing the professional email from public github commits.

#### Install
```
git clone https://github.com/kintoandar/git-hooks.git
cd git-hooks
mkdir -p ~/.git-templates/hooks
git config --global init.templatedir '~/.git-templates'
ln -s $(pwd)/pre-commit/github_email_verify.sh ~/.git-templates/hooks/pre-commit
```

#### Optional
In order to have your github's email account as the default email to be used, add the following line to your shell startup file (~/.bashrc, ~/.zshrc, etc).
```
export PRE_COMMIT_GITHUB_EMAIL='user@email.domain'
```

#### Demo
It can save your bacon!

![Image of Yaktocat](https://lh3.googleusercontent.com/-dTC_5x1zPLw/V1A69dVxy3I/AAAAAAAAPys/VhyXmGjqdoAY-T8Z4rKsI7sMrwHzOjGrgCCo/s2048/github_email_verify.gif)

## Contributors
Made with ♥️ by:
   * [kintoandar](https://github.com/kintoandar)
   * [ruizink](https://github.com/ruizink)
   * [andreferreirav2](https://github.com/andreferreirav2)
