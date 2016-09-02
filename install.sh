if [ ! -d ~/.emacs.d ]; then
	mkdir ~/.emacs.d
fi

echo "Linking conf files..."
ln -s "$PWD/init.el" ~/.emacs.d
ln -s "$PWD/custom.el" ~/.emacs.d
ln -s "$PWD/packages.el" ~/.emacs.d

echo "Done."
