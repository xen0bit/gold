.PHONY: default
default: clean build check-symbol test;

clean:
	rm -rf dist/

build:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=1 go build -buildmode=c-shared -o gold.so

test:
	python3 -c 'import ctypes;lib = ctypes.CDLL("./gold.so");print(lib.helloWorld())'

check-symbol:
	file gold.so
	ldd gold.so
	nm -D gold.so
