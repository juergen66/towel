.PHONY: rebuild build clean distclean prepare config build uefi-test legacy-test clone

default: rebuild

rebuild:
	${MAKE} distclean
	${MAKE} build

clean:
	lb clean

distclean:
	lb clean --purge
	
prepare:
	cp -Lvn /usr/share/live/build/bootloaders/isolinux/* config/bootloaders/isolinux/

config:
	LB_ARCH=amd64 lb config

build: config prepare
	lb build

uefi-test:
	qemu-system-x86_64 -m 1024 -cdrom live-image-amd64.hybrid.iso -bios /usr/share/qemu/OVMF.fd 

legacy-test64:
	qemu-system-x86_64 -m 1024 -cdrom live-image-amd64.hybrid.iso -bios /usr/share/seabios/bios.bin

clone:
	git clone git@github.com:juergen66/towel.git
