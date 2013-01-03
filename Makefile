rebuild: mrclean config build

clean:
	lb clean
	
mrclean:
	lb clean --purge
	
config:
	lb config

build:
	lb build
