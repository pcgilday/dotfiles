#!/usr/bin/python

import os, errno

home = os.path.expanduser('~')
f = open('home-dir-files', 'r')
dotfiles = [line.strip() for line in f.readlines()]
f.close()

for dotfile in dotfiles:
	src = home + '/dotfiles/' + dotfile
	dest = home + '/' + dotfile
	try:
		os.symlink(src, dest)
		print 'linked', src, 'to', dest, '\n'
	except OSError, e:
		if e.errno == errno.EEXIST:
			print 'removing existing', dest
			os.remove(dest)
			os.symlink(src, dest)
			print 'linked', src, 'to', dest, '\n'
