package main

import (
	"C"

	"github.com/ebitengine/purego"
)

var libc uintptr
var puts func(string)

func init() {
	libc, err := purego.Dlopen("libc.so.6", purego.RTLD_NOW|purego.RTLD_GLOBAL)
	if err != nil {
		panic(err)
	}
	purego.RegisterLibFunc(&puts, libc, "puts")
	puts("Init success.")
}

func main() {}

//export helloWorld
func helloWorld() {
	puts("Hello World!")
}
