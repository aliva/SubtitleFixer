#!/bin/bash

# go to install dirctories
mkdir -p ~/.gnome2/nautilus-scripts
mkdir -p ~/.local/bin
cd ~/.local/bin

# remove old version
if [ -d SubtitleFixer ]
then
    rm -Rf  SubtitleFixer
fi

# download
if `git --version > /dev/null`
then
    git clone git://github.com/aliva/SubtitleFixer.git
else
    rm -Rf aliva-SubtitleFixer-*
    wget https://github.com/aliva/SubtitleFixer/tarball/master -O SubtitleFixer.tar.gz
    tar -xf SubtitleFixer.tar.gz
    mv aliva-SubtitleFixer-* SubtitleFixer
fi

# removes old version from nautilus-scripts
if [ -d ~/.gnome2/nautilus-scripts/SubtitleFixer ]
then
    rm -Rf ~/.gnome2/nautilus-scripts/SubtitleFixer
fi

if [ -f ~/.gnome2/nautilus-scripts/SubtitleFixer ]
then
    rm -Rf ~/.gnome2/nautilus-scripts/SubtitleFixer
fi

# install in nautilus-scripts
ln -s ~/.local/bin/SubtitleFixer/SubtitleFixer ~/.gnome2/nautilus-scripts/SubtitleFixer

# add line to bashrc
grep subtitlefixer ~/.bashrc > /dev/null

if [ $? == 1 ]
then
    echo 'alias subtitlefixer=~/.local/bin/SubtitleFixer/SubtitleFixer' >> ~/.bashrc
fi

echo "************************"
echo "subtitlefixer installed!"
echo "************************"
