#!/bin/bash

warn() {
    echo "$1" >&2
}
die() {
    warn "$1"
    exit 1
}

cd /tmp

# remove old version
if [ -d SubtitleFixer ]
then
    rm -Rf  SubtitleFixer
fi

# download
if `git --version &> /dev/null`
then
    git clone git://github.com/aliva/SubtitleFixer.git || die "Coudn't download script. check your internet connection and retry."
else
    warn "You need 'git' to install subtitlefixer."
    die  "install 'git' on your system and run install script again."
fi

cd SubtitleFixer
cp subtitlefixer /usr/bin
cp nautilus-subtitlefixer.py /usr/share/nautilus-python/extensions

echo "************************"
echo "subtitlefixer installed!"
echo "************************"
