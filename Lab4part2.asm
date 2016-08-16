; Program Name:          Lab4part2.asm

; Program Description: Copies elements from 16bit array to 32bit array using loops.
; Author: Chris Banci
; Date: September 9, 2015

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
myArray WORD 1, 2, 3, 4, 5, 6
myArray2 DWORD 6 DUP (0) 

.code
main PROC

mov esi, OFFSET myArray							;address of array.
mov ecx, LENGTHOF myArray						;Loop 6 times					
mov esi, 0										;start with 0

myLoop:
mov ax, myArray[esi * TYPE myArray]				;set array to ax, increase esi by 2
mov ebx, myArray2[esi * TYPE myArray]			;set array2 to ebx, increase esi by 2

movzx ebx, ax									; move  16bit  to 32bit 

mov myArray2[esi * TYPE myArray], ebx			; copy ebx to myArray2
inc esi								

loop myLoop

	INVOKE ExitProcess,0
main ENDP

END main






































