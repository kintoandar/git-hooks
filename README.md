# Collection of git hooks

## pre-commit hooks

### github_email_verify.sh
Allows changing the user email or proceeding with the global configured one before committing to a github repo.  
> Assumes you are using your private email as the global git configuration.

#### Install
```
git clone https://github.com/kintoandar/git-hooks.git
cd git-hooks
mkdir -p ~/.git-templates/hooks
git config --global init.templatedir '~/.git-templates'
ln -s $(pwd)/pre-commit/github_email_verify.sh ~/.git-templates/hooks/pre-commit
```

## Contributors
[kintoandar](https://github.com/kintoandar)  
[ruizink](https://github.com/ruizink)
