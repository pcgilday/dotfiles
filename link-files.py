#!/usr/bin/python

import os;

home = os.path.expanduser('~')
files = ['.bash_profile', '.editorconfig', '.gitconfig']


for file in files:
  src = home + '/config/' + file
  dest = home + '/' + file
  print 'linking', src, 'to', dest
  os.symlink(src, dest)

