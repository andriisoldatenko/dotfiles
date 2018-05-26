all:
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmuxconf ~/.tmux.conf

clean:
	rm -f ~/.tmux.conf

.PHONY: all
