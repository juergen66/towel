rebuild: distclean config build

clean:
	lb clean
	
distclean:
	lb clean --purge
	
config:
	lb config

build:
	lb build
