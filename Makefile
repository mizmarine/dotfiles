init:
	ln -s ~/dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/dotfiles/.vimrc ~/.vimrc
	ln -s ~/dotfiles/.editorconfig ~/.editorconfig
	ln -s ~/dotfiles/.gitignore.local ~/.gitignore.local
	cp ./.gitconfig.local.org ~/.gitconfig.local
