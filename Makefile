CRYSTAL_BIN ?= $(shell which crystal)
ICR_BIN ?= $(shell which icr)

build:
	$(CRYSTAL_BIN) build bin/icr src/icr/cli.cr
clean:
	rm -f ./bin/icr
test:
	$(CRYSTAL_BIN) spec
reinstall:
	cp ./bin/icr $(ICR_BIN) -rf
