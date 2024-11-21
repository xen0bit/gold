.PHONY: default
default: clean build check-symbol test;

clean:
	rm -rf dist/

build:
	mkdir -p dist
	CGO_ENABLED=1 go build -buildmode=c-shared -o dist/gold.so
	#GOOS=linux GOARCH=386 CGO_ENABLED=1 go build -buildmode=c-shared -o dist/gold_386.so
	GOOS=linux GOARCH=amd64 CGO_ENABLED=1 go build -buildmode=c-shared -o dist/gold_amd64.so
	CC=arm-linux-gnueabi-gcc GOOS=linux GOARCH=arm GOARM=5 CGO_ENABLED=1 go build -buildmode=c-shared -o dist/gold_arm5.so
	CC=arm-linux-gnueabi-gcc GOOS=linux GOARCH=arm GOARM=6 CGO_ENABLED=1 go build -buildmode=c-shared -o dist/gold_arm6.so
	CC=arm-linux-gnueabi-gcc GOOS=linux GOARCH=arm GOARM=7 CGO_ENABLED=1 go build -buildmode=c-shared -o dist/gold_arm7.so
	#CC=arm-linux-gnueabi-gcc GOOS=linux GOARCH=arm64 CGO_ENABLED=1 go build -buildmode=c-shared -o dist/gold_arm64.so
	#GOOS=linux GOARCH=mips CGO_ENABLED=1 go build -buildmode=c-shared -o dist/gold_mips.so
	#GOOS=linux GOARCH=mips64 CGO_ENABLED=1 go build -buildmode=c-shared -o dist/gold_mips64.so
	#GOOS=linux GOARCH=mips64le CGO_ENABLED=1 go build -buildmode=c-shared -o dist/gold_mips64le.so
	#GOOS=linux GOARCH=mipsle CGO_ENABLED=1 go build -buildmode=c-shared -o dist/gold_mipsle.so
	#GOOS=linux GOARCH=ppc64 CGO_ENABLED=1 go build -buildmode=c-shared -o dist/gold_ppc64.so

build-musl:
	CC="$$(which musl-gcc)" go build --ldflags '-linkmode external -extldflags "-static"' -buildmode=c-shared -o gold.so

test:
	python3 -c 'import ctypes;lib = ctypes.CDLL("./dist/gold.so");print(lib.helloWorld())'

check-symbol:
	file dist/gold*.so

