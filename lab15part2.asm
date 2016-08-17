; Program Name:           Lab15part2.asm

; Program Description:	  Exercise [2]. Program calculates booleans with 32-bit integers with implentation of Table-Driven Selection techinque.
; Author: Chris Banci
; Date: 12/09/15

INCLUDE Irvine32.inc
INCLUDE MACROS.inc

.data
xVar BYTE 0
yVar BYTE 0

CaseTable	BYTE '1'
			DWORD BoolAnd
			EntrySize = ($ - CaseTable)
			BYTE '2'
			DWORD BoolOr
			BYTE '3'
			DWORD BoolNot
			BYTE '4'
			DWORD BoolXor
			BYTE '5'
			DWORD Terminate

NumberOfEntries = ($ - CaseTable)/EntrySize
			
.code
main PROC
	mov eax, 0
	mov ebx, 0

	call menuPrompt
	mWrite <"Option: ",0>
	call ReadChar
	call ClrScr
	mov ebx, OFFSET CaseTable
	mov ecx, NumberOfEntries

	L1: 
		cmp al, [ebx]
		jne L2
		call NEAR PTR [ebx + 1]
		jmp L3

	L2: 
		add ebx, EntrySize
		loop L1

	L3: 		
		exit
main ENDP

menuPrompt PROC
	mWrite <"// 32-bit boolean calculator",0>
	call Crlf
	call Crlf
	mWrite <"Select an option to calculate",0>
	call Crlf
	mWrite <" [1]: x AND y",0>
	call Crlf
	mWrite <" [2]: x OR y",0>
	call Crlf
	mWrite <" [3]: NOT x",0>
	call Crlf
	mWrite <" [4]: x XOR y",0>
	call Crlf
	mWrite <" [5]: Exit Program",0>
	call Crlf
	call Crlf
	ret
menuPrompt ENDP

ReadEntry PROC
	mWrite <"Enter two 32-bit integers.",0>
	call Crlf

	mWrite <"x: ",0> 
	call ReadInt
	mov xVar, al

	mWrite <"y: ",0> 
	call ReadInt
	mov yVar, al

	ret
ReadEntry ENDP

BoolAnd PROC
	mWrite <"// 32-bit boolean calculator",0>
	call Crlf
	call Crlf

	mWrite <"[1]: x AND y",0>
	call Crlf
	call Crlf

	call ReadEntry
	mov bl, xVar
	mov al, yVar
	AND al, bl

	mWrite <"result = ",0>
	call WriteInt
	call Crlf
	ret
BoolAnd ENDP

BoolOr PROC
	mWrite <"// 32-bit boolean calculator",0>
	call Crlf
	call Crlf

	mWrite <"[2]: x OR y",0>
	call Crlf
	call Crlf

	call ReadEntry
	mov bl, xVar
	mov al, yVar
	OR al, bl

	mWrite <"result = ",0>
	call WriteInt
	call Crlf
	ret
BoolOr ENDP

BoolNot PROC
	mWrite <"// 32-bit boolean calculator",0>
	call Crlf
	call Crlf

	mWrite <"[3]: NOT x",0>
	call Crlf
	call Crlf

	mWrite <"Enter 32-bit integer.",0>
	call Crlf

	mWrite <"x: ",0>

	call ReadInt
	mov xVar, al
	NOT eax

	mWrite <"result = ",0>
	call WriteInt
	call Crlf
	ret
BoolNot ENDP

BoolXor PROC
	mWrite <"// 32-bit boolean calculator",0>
	call Crlf
	call Crlf

	mWrite <"[4]: x XOR y",0>
	call Crlf
	call Crlf

	call ReadEntry
	mov bl, xVar
	mov al, yVar
	XOR al, bl

	mWrite <"result = ",0>
	call WriteInt
	call Crlf
	ret
BoolXor ENDP

Terminate PROC
	mWrite <"Terminating program.",0>
	call Crlf
	exit
Terminate ENDP

END main