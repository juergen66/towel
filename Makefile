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
	sudo qemu-system-i386 -m 1024 -cdrom live-image-i386.hybrid.iso

