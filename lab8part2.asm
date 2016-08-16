; Program Name:           Lab8part2.asm

; Program Description: 
; Write a procedure that displays a value stored in packed decimal format.
; Pass the value in AL. The input range is limited to 0 to 99. 
; The only procedure you can call from the book’s link library is WriteChar.

; Author: Chris Banci
; Date: 10/7/15

INCLUDE Irvine32.inc

.data
value BYTE 68h
errorMsg BYTE "Error: value must be in the range of 0-99.", 0
text1 BYTE "Hex value = ", 0
text2 BYTE "Unpacked BCD = ", 0

.code
main PROC
	mov eax, 0								;clears register
	mov ebx, 0								;clears register

	mov al, value							; value to pass to DisplayDecimal.

	mov edx, OFFSET text1					; displays "Hex value = "
	call WriteString
	call WriteHex							; original hex value to convert.
	call crlf

	call DisplayDecimal						; calls DisplayDecimal procedure

INVOKE ExitProcess,0
main ENDP

	DisplayDecimal PROC	

		check:								; range checker
			cmp ax, 0h						; checks if value is below 0
			jb error
			cmp ax, 99h						; checks if value is above 99
			ja error
			jmp begin

		error:								; errorMsg jump
			mov edx, OFFSET errorMsg		; displays error message.
			call WriteString
			call Crlf
			INVOKE ExitProcess,0

		begin:								; unpacks BCD.
			mov edx, OFFSET text2			; displays "Unpacked BCD = ".
			call WriteString

			mov bl, al						; copies al value to bl.

			shr al, 4						; al = (0110 0101)  --->   al = (0000 0110)
			add al, 48						; to convert to ascii
			call WriteChar

			shl bl, 4						; bl = (0110 0101)  --->   bl = (0110 0000)
			ror bl, 4						; bl = (0110 0000)  --->   bl = (0000 0110). 
			add bl, 48						; to convert to ascii.

			mov al, bl						; bl moved to al to write the char.
			call WriteChar
			call Crlf

		ret							
	DisplayDecimal ENDP
END main


