; Program Name:           lab11part1.asm

; Program Description: Program reads input from user and uses macro to write ascii code and scan code.
; Author: Chris Banci
; Date: 10/28/15

INCLUDE Irvine32.Inc

mReadkey MACRO ascii, scan
	mov eax, 0								;clear eax
	call ReadChar							;keyboard input
    mov ascii, ah							;ascii code
	mov scan, al							;scan code

	mov eax, 0
	mov al, ascii							;ascii code for write

	call WriteInt
	call Crlf

	mov al, scan							;scan code for write
	call WriteInt
	ENDM

.data
	ascii BYTE ?
	scan BYTE ?

.code
main PROC

	mReadkey ascii, scan					;macro

	INVOKE ExitProcess,0
main ENDP

END main