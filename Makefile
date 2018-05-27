all:
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf

clean:
	rm -f ~/.tmux.conf

.PHONY: all
