all:
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/alacritty

	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.ideavimrc ] || ln -s $(PWD)/ideavimrc ~/.ideavimrc
	[ -f ~/.zprofile ] || ln -s $(PWD)/zprofile ~/.zprofile
	[ -f ~/.bash_aliases ] || ln -s $(PWD)/bash_aliases ~/.bash_aliases
	[ -f ~/.gpg.conf ] || ln -s $(PWD)/gpg.conf ~/.gnupg/gpg.conf
	[ -f ~/.gpg-agent.conf ] || ln -s $(PWD)/gpg-agent.conf ~/.gnupg/gpg-agent.conf
	[ -f ~/.ripgreprc ] || ln -s $(PWD)/ripgreprc ~/.ripgreprc

clean:
	rm -f ~/.tmux.conf
	rm -f ~/.gitconfig

.PHONY: all
