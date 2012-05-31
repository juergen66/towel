#!/bin/sh

/etc/init.d/wicd status > /dev/null ||  /etc/init.d/wicd start
/usr/bin/wicd-curses

