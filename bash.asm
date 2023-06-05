;; @Eazy
;; nasm -f elf64 bash.asm -o bash.o && ld bash.o -o baash

bits 64

section .text
	global _start

_start:
	
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx
	push rax

	push 0x2f2f0000
	push 0x2f6e6962 
	push 0x68736162 
	
	mov rbx, rsp
	mov al, 0xb ;; 0xb execve
	syscall
