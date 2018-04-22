GCC = gcc
NASM = nasm

all:
	NASM -f win32 -o 1-abs.obj 1-abs.asm
	NASM -f win32 -o 10_atan.obj 10_atan.asm
	NASM -f win32 -o 2-exp.obj 2-exp.asm
	NASM -f win32 -o 3-ln.obj 3-ln.asm
	NASM -f win32 -o 4-sqrt.obj 4-sqrt.asm
	NASM -f win32 -o 5-cos.obj 5-cos.asm
	NASM -f win32 -o 6-sin.obj 6-sin.asm
	NASM -f win32 -o 7_tan.obj 7_tan.asm
	NASM -f win32 -o 8-acos.obj 8-acos.asm
	NASM -f win32 -o 9-asin.obj 9-asin.asm
	GCC -O3 -g0 1-abs.c 1-abs.obj -o 1-abs.exe
	GCC -O3 -g0  10_atan.c 10_atan.obj -o 10_atan.exe
	GCC -O3  -g0 2-exp.c 2-exp.obj -o 2-exp.exe
	GCC -O3 -g0  3-ln.c 3-ln.obj -o 3-ln.exe
	GCC -O3 -g0  4-sqrt.c 4-sqrt.obj -o 4-sqrt.exe
	GCC -O3 -g0  5-cos.c 5-cos.obj -o 5-cos.exe
	GCC -O3 -g0  6-sin.c 6-sin.obj -o 6-sin.exe
	GCC -O3 -g0  7_tan.c 7_tan.obj -o 7_tan.exe
	GCC -O3 -g0  8-acos.c 8-acos.obj -o 8-acos.exe
	GCC -O3 -g0  9-asin.c 9-asin.obj -o 9-asin.exe