;; @Eazy

bits 64

section .text
	global _start

_start:
	
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx
	push rax

	push 0x2f2f6269
	push 0x6e2f6261
	push 0x73680000
	mov rbx, rsp
	mov al, 0xb ;; 0xb execve
	syscall ;; int 0x80
