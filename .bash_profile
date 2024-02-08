# bash profile

if [ -f ~/.bashrc ]; then
	. ~/.bashrc;
fi

if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi
