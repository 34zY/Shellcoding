;; nasm -f win64 win-x86-64-Hello-2.asm -o a64.obj
;; golink a64.obj /entry _start /console kernel32.dll
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
		
		xor rcx, rcx
		push -11			;; mov rcx, -11
		pop  rcx
		call GetStdHandle

		sub rsp, 32
		sub rsp, 8

							;							 ___________
		push rax            ; [1]                       [_   rax   _] 
		push hi             ; [2]						[_   hi    _]
		push written        ; [3]						[_ written _]
		push 11             ; [4] 						[_   11    _]
							;							   ‾‾‾|‾‾‾
		pop  r8             ; [4] ;; mov r8, 11  <-----------{|] LIFO
		pop  r9             ; [3] ;; mov r9, written <-------{|]
		pop  rdx            ; [2] ;; mov rdx, hi <-----------{|]
		pop  rcx            ; [1] ;; mov rcx,rax <-----------{/] 
		
		push 0              ;;mov qword [rsp+32], 0
		pop  qword [rsp+32] 
		call WriteConsoleA

		add rsp, 32+8
		push 0				;; mov ecx, 0
		pop  rcx
		xor  ecx, ecx
		call ExitProcess


