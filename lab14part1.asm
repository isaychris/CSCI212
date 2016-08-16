; Program Name:          lab14part1.asm

; Program Description: fills console with random characters and colors
; Author: Chris Banci
; Date: 12/2/15

INCLUDE Irvine32.inc
.data
	outHandle HANDLE ?
	cellsWritten DWORD ?
	xyPos COORD <0,0>

	buffer DWORD 4000 DUP(?)
	BufSize DWORD 4000

	attributes DWORD 4000 DUP(?)


.code
main PROC
		
		Call Randomize
		call fillbuffer
		call fillcolor

	INVOKE GetStdHandle,STD_OUTPUT_HANDLE
		mov outHandle,eax

	INVOKE WriteConsoleOutputAttribute,
		outHandle, ADDR attributes,
		BufSize, xyPos, ADDR cellsWritten

	INVOKE WriteConsoleOutputCharacter,
		outHandle, ADDR buffer, BufSize,
		xyPos, ADDR cellsWritten

		call ReadChar
		exit

main ENDP

fillbuffer PROC

	mov ecx, LENGTHOF buffer
	mov esi, OFFSET buffer
		myloop:
			mov ebx, 222					;sets upper bound
			call RandomRange			;random number generated from the difference of bounds.
			add eax, 33					;lower bound added back, number is now greater than lowerbound.
			mov [esi], eax				;passes result to the array.
			inc esi						;esi is increased
		loop myLoop

		ret
	fillbuffer ENDP

	fillcolor PROC
		mov ecx, LENGTHOF attributes
		mov esi, OFFSET attributes

		colorset:
			mov eax, 2
			call RandomRange
			cmp eax, 0
			je anycolor

			redcolor:
				mov eax, 12
				mov [esi], eax				;passes result to the array.
				jmp done

			anycolor:						
				mov eax, 16
				call RandomRange			;random number generated from the difference of bounds.
				mov [esi], eax				;passes result to the array.

			done:
				inc esi						;esi is increased
			loop colorset

		ret
	fillcolor ENDP
END main