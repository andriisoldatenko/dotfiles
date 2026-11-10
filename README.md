# dotfiles
My OS X dotfiles

```
make

# for clean up

make clean
```

### Neovim notes

```
brew upgrade neovim
```

### Brew install

```bash
# generate a Brewfile
$ brew bundle dump
$ ls
Brewfile

# check everything is installed
$ brew bundle check
The Brewfile's dependencies are satisfied.
```

## To install useful key bindings and fuzzy completion:
```
$(brew --prefix)/opt/fzf/install
```


## To arrange windows
> Spectacle users have recommended Rectangle as an open source alternative.
https://github.com/rxhanson/Rectangle


## Github aliases cli
```
gh alias import ~/dotfiles/gh_aliases.yml
```

### dump current aliases
```
gh alias list > ~/dotfiles/gh_aliases.yml
```
