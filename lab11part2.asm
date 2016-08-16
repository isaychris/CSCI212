; Program Name:           lab11part2.asm

; Program Description: Macro mReadInt reads 16bit or 32bit number and returns it in a argument.
; Author: Chris Banci
; Date: 10/28/15

INCLUDE Irvine32.Inc
INCLUDE Macros.inc

mReadInt MACRO wbitT, dbitT
	call ReadInt						;input

	cmp eax, 32767				
		jg l1							;if greater than 32767, input is 32bit.
		jle l2							;if less than or equal to 32767, input is 16bit.

	l1:									
		mov dbitT, eax					;move to 32bit variable.
		jmp finish

	l2:								
		cmp eax, -32768					
		jl l1							;if less than -32768, jump to l1 and input is 32bit.
		mov wbitT, ax					;move to 16bit variable.
		jmp finish						

	finish: 	
ENDM

.data
	wbit SWORD 0						;16bit signed variable
	dbit SDWORD 0						;32bit signed variable

.code
main PROC
	mWrite <"Enter number: ">		
		
	mReadInt wbit, dbit					;macro returns variables		

	mWrite <"16bit = ">
		mov eax, 0
		movsx eax, ax
		call WriteInt
		call Crlf

	mWrite <"32bit = ">
		mov eax, 0
		mov eax, dbit
		call WriteInt
		call Crlf

; ------------------------------------------------
; displays if its a 32 bit or 64 bit number
	cmp wbit, 0
		jne msg

		mWrite <"Input is a 32bit number.">
		jmp done

	msg:
		mWrite <"Input is a 16bit number.">
		jmp done

; ------------------------------------------------

	done:
		call Crlf

	INVOKE ExitProcess,0
main ENDP
END main