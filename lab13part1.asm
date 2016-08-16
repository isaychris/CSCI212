; Program Name:           ;lab13part1.asm

; Program Description: compares the double float value x to y.
; Author: Chris Banci
; Date: 11/18/15

INCLUDE Irvine32.Inc

.data
var1 REAL8 6.2
var2 REAL8 6.6
var3 REAL8 6.9
var4 REAL8 6.3

msg1 BYTE "X is lower", 0
msg2 BYTE "X is not lower", 0

FindLargest PROTO,																
	x: REAL8, 
	y: REAL8

.code
main PROC

	FINIT

	INVOKE FindLargest, var1, var2
	INVOKE FindLargest, var3, var4

	INVOKE ExitProcess,0
main ENDP

FindLargest PROC USES edx,			
		x: REAL8,								
		y: REAL8

		fld x						;load x
		fcom y						;compare y
		fnstsw ax

		sahf
		jb test1					;jump if below

		mov edx, OFFSET msg2
		call WriteString
		call Crlf
		jmp done

	test1:
		mov edx, OFFSET msg1
		call WriteString
		call Crlf
	
	done:
		ret

	FindLargest ENDP
END main