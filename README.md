# gold

As of Go 1.21.3 cross compilation of shared libraries is... meh

```
sudo apt install musl-tools
sudo apt-get install gcc-arm-linux-gnueabi
```


```
dist/gold_amd64.so: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, BuildID[sha1]=3e5d6a18fab41f158c6fa02bcaa4f1da74adf9aa, with debug_info, not stripped
dist/gold_arm5.so:  ELF 32-bit LSB shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, BuildID[sha1]=53f539cc6c0ec6baf647f88e81713169a9dbd8f9, with debug_info, not stripped
dist/gold_arm6.so:  ELF 32-bit LSB shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, BuildID[sha1]=42259dcdaef0994f0233e67c459a8aa65dabef36, with debug_info, not stripped
dist/gold_arm7.so:  ELF 32-bit LSB shared object, ARM, EABI5 version 1 (SYSV), dynamically linked, BuildID[sha1]=5fe74c4c61be785280cce2ab4d6851dd18ce95c5, with debug_info, not stripped
python3 -c 'import ctypes;lib = ctypes.CDLL("./dist/gold.so");print(lib.helloWorld())'
Init Hook
Hello World!
0
```