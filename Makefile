rebuild: distclean prepare config build

clean:
	lb clean
	
distclean:
	lb clean --purge
	
prepare:
	cp -Lvn /usr/share/live/build/bootloaders/isolinux/* config/bootloaders/isolinux/
config:
	lb config

build:
	lb build

uefi-test:
	qemu-system-x86_64 -m 1024 -cdrom live-image-amd64.hybrid.iso -bios /usr/share/qemu/OVMF.fd 

legacy-test:
	qemu-system-x86_64 -m 1024 -cdrom live-image-amd64.hybrid.iso -bios /usr/share/seabios/bios.bin

