;; nasm -f win64 a64.asm -o a64.obj 
;; golink.exe a64.obj /entry _start /console kernel32.dll

bits 64

extern GetStdHandle
extern WriteConsoleA
extern ExitProcess

section .data
	hi db 'Hello world', 10

section .bss
	written resq 1

section .text
	global _start
	_start:
		mov rcx, -11
		call GetStdHandle

		sub rsp, 32
		sub rsp, 8

		mov rcx,rax
		mov rdx, hi
		mov r8, 11
		mov r9, written
		mov qword [rsp+32], 0
		call WriteConsoleA

		add rsp, 32+8

		mov ecx, 0

		xor ecx, ecx
		call ExitProcess