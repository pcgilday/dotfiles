#!/usr/bin/python

import os
import errno

HOME = os.path.expanduser('~')
BLACKLIST = [
    'README.md',
    'link-files.py',
    '.git',
]
ALL_FILES = os.listdir('.')

# This works, but could be cleaner
FILES = [f for f in os.listdir('.')
         if f not in BLACKLIST and not f.endswith('.swp')]

print '\nlinking the following dotfiles to homedir:\n\n', '\n'.join(FILES), '\n'

for f in FILES:
    src = HOME + '/dotfiles/' + f
    dest = HOME + '/' + f
    try:
        os.symlink(src, dest)
    except OSError, err:
        if err.errno == errno.EEXIST:
            print 'removing existing', dest
            os.remove(dest)
            os.symlink(src, dest)
            print 'linked', src, 'to', dest, '\n'
