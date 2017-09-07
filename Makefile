SRC=centos-base.json
CC=packer
CCFLAGS=-only=virtualbox-iso -color=true
all: clean build

build: validate
	$(CC) build $(CCFLAGS) $(SRC)

validate:
	$(CC) validate $(SRC)

clean:
	rm -rf output-virtualbox-iso
