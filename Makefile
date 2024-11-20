.PHONY: default
default: clean build check-ldd ;

clean:
	rm -rf dist/

build:
	CGO_ENABLED=1 go build -ldflags="-s -w" -buildmode=c-shared -o gold.so

check-ldd:
	file gold.so
	ldd gold.so
	nm gold.so
