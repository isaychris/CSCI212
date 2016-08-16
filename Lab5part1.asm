; Program Name:          Lab5part1.asm

; Program Description: Changes color of string 4 times through a loop.
; Author: Chris Banci
; Date: 9/16/15


INCLUDE Irvine32.inc

.data
str1 BYTE "Hello World, All Your Base Are Belong To Us",0dh,0ah,0

.code
main PROC

	mov ebx, 9						;color counter start
	mov ecx, 4						;counter

myLoop:

	mov eax, ebx				;move color to ax
	call SetTextColor				;set color

	mov	edx, OFFSET str1		
	call WriteString			;write string to screen

	mov eax, ebx
	inc ebx						;incease bx to change color

loop myLoop

	mov eax, white					;reset color to default
	call SetTextColor				;set color


	exit
main ENDP

END main