#!/bin/sh
dpkg-query -W --showformat='${Installed-Size;10}\t${Package}\n' | sort -k1,1n
