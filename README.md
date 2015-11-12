# Collection of git hooks

## pre-commit hooks

### github_email_verify.sh
Allows changing the user email or proceed with the global configured one before committing to github.  
> Assumes you are using your private email as the global git configuration.

#### Install
```
git clone https://github.com/kintoandar/git-hooks.git
cd git-hooks
git config --global init.templatedir '~/.git'
mkdir -p ~/.git/hooks
ln -s $(pwd)/pre-commit/github_email_verify.sh ~/.git/hooks/pre-commit
```
