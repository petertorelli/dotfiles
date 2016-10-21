#!/usr/bin/env bash
GLOBIGNORE='.:..:.git:*.swp'
PWD=`pwd`
BACKUP=old.$$
mkdir $BACKUP
for x in .*; do
  echo Linking $x...
  mv ~/$x $BACKUP
  ln -s $PWD/$x ~/$x
done
