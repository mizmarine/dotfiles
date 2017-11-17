.PHONY: init neobundle

init:
	ln -s ~/dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/dotfiles/.vimrc ~/.vimrc
	ln -s ~/dotfiles/.editorconfig ~/.editorconfig
	ln -s ~/dotfiles/.gitignore.local ~/.gitignore.local
	cp ~/dotfiles/.gitconfig.local.org ~/.gitconfig.local

neobundle:
	curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
	sh ./install.sh
	rm ./install.sh
