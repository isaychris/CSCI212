; Program Name:           Lab15part4.asm

; Program Description:	  Exercise [4]. Program displays chessboard and changes to all 16 colors.
; Author: Chris Banci
; Date: 12/09/15

INCLUDE Irvine32.inc

WriteColorChar PROTO char:BYTE, forecolor:BYTE, backcolor:BYTE
RowOdd PROTO color:BYTE
RowEven PROTO color:BYTE

.data
colorchange BYTE 0

.code
main PROC
	mov ecx, 16
	mov ebx, 0
	mov bl, colorchange

	display:
		call chessboard
		inc bl
		mov colorchange, bl

		mov dl, 0						
		mov dh, 0
		call Gotoxy

		mov eax, 500						;delay set to 500 miliseconds
		call Delay
	loop display
	
	call readchar

	exit
main ENDP

chessboard PROC uses ecx					
	mov ecx, 4
	L1:
		INVOKE RowOdd, white
		call Crlf
		INVOKE RowEven, white
		call Crlf
	loop L1
	ret
chessboard ENDP

RowOdd PROC uses ecx, color:BYTE
	mov ecx, 4
	L1:
		INVOKE WriteColorChar, ' ', color, color
		INVOKE WriteColorChar, ' ', color, color
		INVOKE WriteColorChar, ' ', colorchange, colorchange
		INVOKE WriteColorChar, ' ', colorchange, colorchange
	loop L1
	ret
RowOdd ENDP

RowEven PROC uses ecx, color:BYTE
	mov ecx, 4
	L1:
		INVOKE WriteColorChar, ' ', colorchange, colorchange
		INVOKE WriteColorChar, ' ', colorchange, colorchange
		INVOKE WriteColorChar, ' ', color, color
		INVOKE WriteColorChar, ' ', color, color
	loop L1
	ret
RowEven ENDP

WriteColorChar PROC,
	char:BYTE, 
	forecolor:BYTE, 
	backcolor:BYTE 

	movzx eax, backcolor
	shl eax, 4
	or al, forecolor
	call SetTextColor	

	mov al, char
	call WriteChar

	ret
WriteColorChar ENDP

END main
