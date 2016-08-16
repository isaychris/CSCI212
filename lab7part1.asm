; Program Name:           Lab7part1.asm

; Program Description: 
	; This program uses a procedure named WriteScaled to output a number with a decimal point.
	; When calling WriteScaled, the number’s offset is passed in EDX, the number length is passed in ECX, 
	; and the decimal offset is passed in EBX. This is tested with three numbers.

; Author: Chris Banci
; Date: 9/30/15

INCLUDE Irvine32.inc

DECIMAL_OFFSET = 5

.data
decimal_one BYTE "100123456789765"
decimal_two BYTE "133780085"
decimal_three BYTE "214752"

.code
main PROC

	;test 1
	mov edx, OFFSET decimal_one			;address of decimal_one
	mov ecx, LENGTHOF decimal_one		;the length of decimal_one
	mov ebx, DECIMAL_OFFSET				;the decimal offset position
	call WriteScaled					

	;test 2
	mov edx, OFFSET decimal_two
	mov ecx, LENGTHOF decimal_two
	mov ebx, DECIMAL_OFFSET
	call WriteScaled


	;test 3
	mov edx, OFFSET decimal_three
	mov ecx, LENGTHOF decimal_three
	mov ebx, DECIMAL_OFFSET
	call WriteScaled


INVOKE ExitProcess,0
main ENDP

	WriteScaled PROC	
	
		sub ecx, ebx				;position to insert decimal char.

		displayChars:				;loop to print chars one by one.
		mov al, [edx]				;moving first char to al to print.
		call WriteChar				;function to print chars
		inc edx						;to go to next char
		loop displayChars

		mov al, '.'					;moving decimal char al to print.
		call WriteChar			

		mov ecx, ebx				;remaining loop
	
		displayChars2:				;loop to continue printing remaining 5 chars.
		mov al,[edx]				;current char moved to al to print.
		call WriteChar				;function to print chars
		inc edx						;to go to next char
		loop displayChars2

		call crlf					;endline

		ret							;returns to main
	WriteScaled ENDP

END main


