SRC=centos-base.json
CC=packer
all: build

build: validate
	$(CC) build $(SRC)

validate:
	$(CC) validate $(SRC)
