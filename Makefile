.PHONY: init neobundle

init:
	ln -s ~/dotfiles/.zshrc ~/.zshrc
	ln -s ~/dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/dotfiles/.vimrc ~/.vimrc
	ln -s ~/dotfiles/.editorconfig ~/.editorconfig
	ln -s ~/dotfiles/.gitignore.local ~/.gitignore.local
	cp ~/dotfiles/.gitconfig.local.org ~/.gitconfig.local
	echo "please set your account info in ~/.gitignore.local"

zsh:
	sudo echo /usr/local/bin/zsh >> /etc/shells
	chsh -s /usr/local/bin/zsh

neobundle:
	curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
	sh ./install.sh
	rm ./install.sh

HOMEBREW:=$(shell which brew || echo install homebrew. see https://brew.sh/index_ja.html)

brew/update:
	$(HOMEBREW) update

brew/install: brew/update
	$(HOMEBREW) install zsh
	$(HOMEBREW) install vim
	$(HOMEBREW) install wget
	$(HOMEBREW) install ghq
	$(HOMEBREW) install hub
	$(HOMEBREW) install tig
	$(HOMEBREW) install jq
	$(HOMEBREW) install ag
	$(HOMEBREW) install peco
	$(HOMEBREW) install awscli
	$(HOMEBREW) install mysql
	$(HOMEBREW) install pyenv
	$(HOMEBREW) install pipenv
	$(HOMEBREW) install goenv
	$(HOMEBREW) cask install adoptopenjdk8

