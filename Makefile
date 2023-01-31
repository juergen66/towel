.PHONY: rebuild rebuild32 rebuild64 clean distclean prepare config32 config64 build32 build64 uefi-test32 legacy-test32 build64 uefi-test64 legacy-test64 clone

default: rebuild64

rebuild: rebuild32 rebuild64

rebuild32:
	${MAKE} distclean
	${MAKE} build32
rebuild64:
	${MAKE} distclean
	${MAKE} build64

clean:
	lb clean
	
distclean:
	lb clean --purge
	
prepare:
	cp -Lvn /usr/share/live/build/bootloaders/isolinux/* config/bootloaders/isolinux/

config32:
	LB_ARCH=i386 lb config

config64:
	LB_ARCH=amd64 lb config

build32: config32 prepare
	lb build

build64: config64 prepare
	lb build

uefi-test32:
	qemu-system-i386 -m 1024 -cdrom live-image-i386.hybrid.iso -bios /usr/share/qemu/OVMF.fd 

legacy-test32:
	qemu-system-i386 -m 1024 -cdrom live-image-i386.hybrid.iso -bios /usr/share/seabios/bios.bin

uefi-test64:
	qemu-system-x86_64 -m 1024 -cdrom live-image-amd64.hybrid.iso -bios /usr/share/qemu/OVMF.fd 

legacy-test64:
	qemu-system-x86_64 -m 1024 -cdrom live-image-amd64.hybrid.iso -bios /usr/share/seabios/bios.bin

clone:
	git clone https://github.com/juergen66/towel.git
