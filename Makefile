init_git:
	ln -s ./.gitconfig ~/.gitconfig
	ln -s ./.vimrc ~/.vimrc
	ln -s ./.editorconfig ~/.editorconfig
	ln -s ./.gitignore.local ~/.gitignore.local
	cp ./.gitconfig.local.org ~/.gitconfig.local
