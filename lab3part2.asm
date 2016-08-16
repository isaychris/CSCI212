; Program Name:          lab3part2.asm

; Program Description: Calculates the first 7 numbers of the Fibonacci number sequence.
; Author: Chris Banci
; Date: September 2, 2015

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
fibSequence BYTE 7 DUP (0)

.code
main PROC

mov al, 1							;initalize with 1
mov bl, 1							;initalize with 1

mov esi, OFFSET fibSequence			;address of array.
mov ecx, 5							;loop 5 times

mov [esi], al						;set fibsequence[0] to 0.
mov [esi+1], bl						;set fibsequence[1] to 1.

myLoop:
mov al, [esi]						;set al to fibsequence[esi]
mov bl, [esi+1]						;set bl to fibsequence[esi+1]
add bl, al							;sum of al + bl
mov [esi+2], bl						;move sum to fibsequence[esi+2]
inc esi								;inc esi

loop myLoop

	INVOKE ExitProcess,0
main ENDP

END main



































