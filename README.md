# dotfiles
My OS X dotfiles

```
make

# for clean up

make clean
```

### Vim/nvim notes

Install pathogen:
```
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

Install plugin manager
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
