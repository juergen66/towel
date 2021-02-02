Towel Live

A Debian (Sid) based live CD for system cleanup and other
maintenance tasks.

The goal of the project is to be able to create a live ISO image
with minimal prerequisites: All you should need is live-build.
There is also a simple Makefile provided, which needs a standard
(Gnu compatible) make program, but that is completely optional.

To build an ISO image, just issue the commands
  'lb clean --purge && lb config && lb build'
in the root directory of the project, or just type 'make', if
you have a make program installed.
