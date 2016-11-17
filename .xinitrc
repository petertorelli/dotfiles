#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession

# Damnit apple... I hate to have to do this.
#xmodmap -e 'clear Lock' -e 'keycode 66 = Escape NoSymbol Escape' &

xrdb ~/.Xresources &
