; Program Name:           lab10part1.asm

; Program Description: String is copied to a destination with a max character limit.
; Author: Chris Banci
; Date: 10/21/15

INCLUDE Irvine32.Inc

Str_copyN PROTO,
	source:PTR BYTE,							; source string
	target:PTR BYTE,							; target string
	maxNumber: DWORD

.data

string1 BYTE "HelloWorld", 0
string2 BYTE 10 DUP(0)
prompt1 Byte "Enter max number to copy: ", 0

.code
main PROC

	mov edx, OFFSET prompt1
	call WriteString
	call ReadInt
	
	INVOKE Str_copyN, OFFSET string1, OFFSET string2, eax
	INVOKE ExitProcess,0
main ENDP


Str_copyN PROC USES eax ecx esi edi,
	source:PTR BYTE,							; source string
	target:PTR BYTE,							; target string
	maxNumber: DWORD							;input

	INVOKE Str_length, source					; EAX = length source

	mov ecx,maxNumber							; REP count

	mov esi,source
	mov edi,target

	cld											; direction = up
	rep movsb									; copy the string

	mov edx, OFFSET string2
	call WriteString
	call Crlf

	ret

Str_copyN ENDP
END main