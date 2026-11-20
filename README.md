# dotfiles

My OS X dotfiles

```sh
make

# for clean up

make clean
```

## Neovim notes

```sh
brew upgrade neovim
```

TODO: migrate LSP completion to [blink.cmp](https://github.com/saghen/blink.cmp).
Currently `init.lua` uses nvim 0.12 builtin completion (`autocomplete`, `complete+=o`,
`vim.lsp.completion.enable` with `autotrigger` on `LspAttach`; accept with `<C-y>`).
blink.cmp adds fuzzy matching, docs/signature popups and snippets. When migrating:
remove the builtin block, and fold the clever `<Tab>` logic into blink's keymap
(blink takes over `<Tab>`).

## Vim notes

Thesaurus for `CTRL-X CTRL-T` (fixes "'thesaurus' option is empty"),
see `:help compl-thesaurus`:

1. Download `thesaurus_pkg.zip` from
   <https://github.com/vim/vim/issues/629#issuecomment-443293282>
2. Unpack and install:

   ```sh
   mkdir -p ~/.vim/thesaurus
   mv thesaurus.txt ~/.vim/thesaurus/english.txt
   ```

3. In vimrc: `set thesaurus+=~/.vim/thesaurus/english.txt`

Don't use Moby `mthesaur.txt`: lines exceed Vim's 510-byte limit and use
comma-separated multi-word entries.

Dictionary for `CTRL-X CTRL-K` (fixes "'dictionary' option is empty"):
macOS ships a word list, so in vimrc:
`set dictionary+=/usr/share/dict/words`

Spell checking (fixes "E756: Spell checking is not enabled"): vimrc enables
`spell` for markdown/text/gitcommit only; elsewhere run `:set spell`.
Custom words (`zg`) go to `~/.vim/spell/en.utf-8.add`, so create the dir once:

```sh
mkdir -p ~/.vim/spell
```

Keys: `]s`/`[s` next/prev error, `z=` suggestions, `zg` add word,
`zw` mark wrong, insert-mode `CTRL-X s` fix word.

tmux prefix is `C-f`, so inside tmux `CTRL-X CTRL-F` needs `C-f` pressed twice
(or use the `<Tab>` / `<C-x>f` mappings in vimrc).

## Brew install

```bash
# generate a Brewfile
$ brew bundle dump
$ ls
Brewfile

# check everything is installed
$ brew bundle check
The Brewfile's dependencies are satisfied.
```

## To install useful key bindings and fuzzy completion

```sh
$(brew --prefix)/opt/fzf/install
```

## To arrange windows

> Spectacle users have recommended Rectangle as an open source alternative.
> <https://github.com/rxhanson/Rectangle>

## Github aliases cli

```sh
gh alias import ~/dotfiles/gh_aliases.yml
```

### dump current aliases

```sh
gh alias list > ~/dotfiles/gh_aliases.yml
```
