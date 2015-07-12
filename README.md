#Emacs Config

This are my emacs configurations, to be installed `$HOME/.emacs.d`:

	$ [ -d "$HOME/.emacs.d" ] && mv $HOME/.emacs.d $HOME/emacs.dir
	$ git clone https://github.com/czipperz/emacs.d $HOME/.emacs.d
	$ [ -d "$HOME/emacs.dir" ] && mv $HOME/emacs.dir/* $HOME/.emacs.d
	$ [ -d "$HOME/emacs.dir" ] && rm -R $HOME/emacs.dir
