SRC=centos-base.json
CC=packer
CCFLAGS=-only=virtualbox-iso -color=true
all: build

build: validate
	$(CC) build $(CCFLAGS) $(SRC)

validate:
	$(CC) validate $(SRC)
