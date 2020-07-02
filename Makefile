rebuild: distclean config build

clean:
	sudo lb clean
	
distclean:
	sudo lb clean --purge
	
config:
	sudo lb config

build:
	sudo lb build

uefi-test:
	sudo qemu-system-x86_64 -m 1024 -cdrom live-image-amd64.hybrid.iso -bios /usr/share/qemu/OVMF.fd 

legacy-test:
	sudo qemu-system-x86_64 -m 1024 -cdrom live-image-amd64.hybrid.iso -bios /usr/share/seabios/bios.bin

