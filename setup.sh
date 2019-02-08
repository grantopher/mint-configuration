#!/bin/bash

declare -a apps=("vim"
		 "git"
		 "zsh")
for app in "${apps[@]}"
do
	if hash $app;
	then
		echo "$app is already installed! Ignoring..."
	else
		apt-get install $app
	fi
done

# GIT SETUP
git config --global user.email "shadowcarson@gmail.com"
git config --global user.name "Grantopher Carson"
git config --global core.editor "vim"

# OH-MY-ZSH
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Setup NVM
if hash nvm;
then
	echo "NVM is already installed! Ignoring..."
else
	wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
	echo "source ~/.nvm/nvm.sh"
	echo "export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
" >> ~/.zshrc
	zsh
	source ~/.zshrc
	nvm install 11.9.0
fi

