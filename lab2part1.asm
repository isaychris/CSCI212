; Program Name:          lab2part1.asm

; Program Description: Program calculates the following expression using registers: A = (A + B) - (C + D). Assigns initial integer values to the EAX,EBX, ECX, and EDX registers.
; Author: Chris Banci
; Date: August 28, 2015

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	valueA DWORD 10			
	ValueB DWORD 5			
	valueC DWORD 3			
	valueD DWORD 4			

.code
main PROC

	mov eax, valueA			;move valueA to eax.
	mov ebx, valueB			;move valueB to ecx;
	mov ecx, valueC			;move valueC to edx.
	mov edx, valueD			;move valueD to edx.

	add ebx, eax			;add eax(10) to ebx(5)
	add edx, ecx			;add ecx(3) to edx(4)
	sub ebx, edx			;sub edx(7) from ebx(15).

	mov eax, ebx			;move abx(8) to aex.

	INVOKE ExitProcess,0
main ENDP

; (insert additional procedures here)
END main