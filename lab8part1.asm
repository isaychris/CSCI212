; Program Name:           Lab8part1.asm

; Program Description: 
; Implements the following C++ expression in assembly language, using 32-bit unsigned operands:
; val1 = (val2 * val3) / (val4 - 3)

; Author: Chris Banci
; Date: 10/7/15

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
var1 DWORD 0
var2 DWORD 10
var3 DWORD 2
var4 DWORD 5

.code
main PROC

mov eax, var2			; var2 = 10
mov ebx, var3			; var3 = 2

mul ebx					; (10 * 2) = 20 stored in eax

mov ebx, var4			; var4 = 5
sub ebx, 3				; (5-3) = 2 stored in ebx

div ebx					;(20 / 2) = 10 stored in eax
mov var1, eax			; var1 = 10.
	
INVOKE ExitProcess,0
main ENDP

END main


