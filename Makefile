.PHONY: clean distclean prepare config uefi-test legacy-test clone

ISO := live-image-amd64.hybrid.iso

default: $(ISO).sha256

$(ISO).sha256: $(ISO)
	sha256sum $(ISO) > $(ISO).sha256

$(ISO): config
	lb build

config:
	LB_ARCH=amd64 lb config

clean:
	lb clean

distclean:
	lb clean --purge
	
prepare:
	cp -Lvn /usr/share/live/build/bootloaders/isolinux/* config/bootloaders/isolinux/

uefi-test:
	qemu-system-x86_64 -m 1024 -cdrom live-image-amd64.hybrid.iso -bios /usr/share/qemu/OVMF.fd 

legacy-test:
	qemu-system-x86_64 -m 1024 -cdrom live-image-amd64.hybrid.iso -bios /usr/share/seabios/bios.bin

local:
	mkdir -p local
	git -C local clone https://salsa.debian.org/live-team/live-build.git

clone:
	git clone git@github.com:juergen66/towel.git
