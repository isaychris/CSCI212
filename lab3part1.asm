; Program Name:           lab3part1.asm

; Program Description: Copies value from bigEndian and converts value to littleEndian.
; Author: Chris Banci
; Date: September 1, 2015

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
bigEndian BYTE 12h,34h,56h,78h              ; 8-bit 
littleEndian DWORD 0                        ; 32-bit

.code
main PROC

mov eax, DWORD PTR bigEndian				;pointer used to move 8bit to 32bit eax register.
mov littleEndian, eax						;move eax register into littleEndian variable.

	INVOKE ExitProcess,0
main ENDP

; (insert additional procedures here)
END main