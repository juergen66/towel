rebuild: distclean config build

clean:
	lb clean
	
distclean:
	lb clean --purge
	
config:
	lb config

build:
	lb build

test:
	sudo qemu-system-x86_64 -m 1024 -cdrom live-image-amd64.hybrid.iso -bios /usr/share/qemu/OVMF.fd

