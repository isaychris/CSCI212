; Program Name:           ;lab13part2.asm

; Program Description: Quadratic formula program
; Author: Chris Banci
; Date: 11/18/15

INCLUDE Irvine32.Inc
INCLUDE Macros.inc

.data
vala REAL8 ?
valb REAL8 ?
valc REAL8 ?
part1 REAL8 ?

two REAL8 2.0
four REAL8 4.0
zero REAL8 0.0
junk REAL8 0.0

.code
main PROC
	FINIT

	mWrite <"Quadratic calculator: Ax^2 +Bx + C = 0">	
		call crlf
		call crlf

	mWrite <"Enter <A>: ">	
		call ReadFloat
		fstp vala							;stores point

	mWrite <"Enter <B>: ">	
		call ReadFloat
		fstp valb							;stores point

	mWrite <"Enter <C>: ">	
		call ReadFloat
		fstp valc							;stores point

		call crlf
	mWrite <"----------------------------------------">	
		call crlf

	; B^2 - 4AC
		fld valb						
		fmul ST(0),ST(0)					
		fld four
		fmul vala
		fmul valc

	; B^2 - 4AC
		fsub
		fld zero
		fcomi ST(0), ST(1)
		ja imaginary_root

	; calculating square root
		fstp junk
		fsqrt
		fst part1

	; calculating the first root
		fld valb
		fchs
		fadd part1
		fld vala
		fmul two
		fdivp ST(1),ST(0)

	; Display the first root.
		mWrite <"root 1: ">	
		call WriteFloat
		call crlf

	; calculating the second root
		fld valb
		fchs
		fsub part1
		fld vala
		fmul two
		fdivp ST(1),ST(0)

	; Display the second root.
		mWrite <"root 2: ">	
		call WriteFloat
		call crlf
		jmp done

	imaginary_root:
		mWrite <"root is imaginary.",0>
		call crlf

done:

	INVOKE ExitProcess,0
main ENDP

END main