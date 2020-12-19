all:
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/alacritty

	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/vimrc ~/.config/nvim/init.vim
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.bash_aliases ] || ln -s $(PWD)/bash_aliases ~/.bash_aliases

clean:
	rm -f ~/.tmux.conf
	rm -f ~/.gitconfig
	rm -f ~/.vimrc

.PHONY: all
