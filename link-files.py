#!/usr/bin/python

import os
import errno

HOME = os.path.expanduser('~')
DOTFILES = [
    '.aliases',
    '.gitconfig',
    '.gitconfig-upside',
    '.gitignore-global',
    '.vimrc',
    '.zshrc'
]


print('\nlinking the following dotfiles to homedir:\n\n', '\n'.join(DOTFILES), '\n')

for f in DOTFILES:
    src = HOME + '/dotfiles/' + f
    dest = HOME + '/' + f
    try:
        os.symlink(src, dest)
    except OSError as err:
        if err.errno == errno.EEXIST:
            print('removing existing', dest)
            os.remove(dest)
            os.symlink(src, dest)
            print(f"linked {src} to {dest}\n")
