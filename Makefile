all:
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.gitconfig] || ln -s $(PWD)/gitconfig ~/.gitconfig

clean:
	rm -f ~/.tmux.conf

.PHONY: all
