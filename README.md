# Collection of git hooks

## pre-commit hooks

### github_email_verify.sh
Assumes you are using your private email as the global git configuration and denies commits to a github repo, if you do not configure a local public email address first.

#### Install
```
git clone https://github.com/kintoandar/git-hooks.git
cd git-hooks
git config --global init.templatedir '~/.git_templates'
mkdir -p ~/.git_templates/hooks
ln -s $(pwd)/pre-commit/github_email_verify.sh ~/.git_templates/hooks/pre-commit
```