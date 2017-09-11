SRC=centos-base.json
CC=packer
CCFLAGS=-only=virtualbox-iso -color=true
# CCFLAGS= -color=true
all: build

build: validate
	$(CC) build $(CCFLAGS) $(SRC)

validate:
	$(CC) validate $(SRC)

clean:
	rm builds/*.json
	rm builds/*.box
