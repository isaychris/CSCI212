; Program Name:          Lab4part1.asm

; Program Description: Switches elements in a pair with a loop
; Author: Chris Banci
; Date: September 9, 2015

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
myArray BYTE 1, 2, 3, 4, 5, 6

.code
main PROC

mov esi, OFFSET myArray			;address of array.
mov ecx, 3						;loop 3 times
mov esi, 0						

myLoop:
mov al, myArray[esi]			;set 1 to al
mov bl, myArray[esi+1]			;set 2nd to bl

xchg al, bl						;exchange al and bl
mov myArray[esi], al			;mov al to array
mov myArray[esi+1], bl			;mov bl to array

inc esi							;increase by 2
inc esi

loop myLoop

	INVOKE ExitProcess,0
main ENDP

END main






































