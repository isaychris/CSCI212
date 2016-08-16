; Program Name:          Lab5part2.asm

; Program Description: Write a program that clears the screen, locates the cursor near the middle of the screen, 
;					   prompts the user for two integers, adds the integers, and displays their sum
; Author: Chris Banci
; Date: 9/16/15

INCLUDE Irvine32.inc

.data
str1 BYTE "Hello World testests",0dh,0ah,0

prompt1 BYTE "Enter 1st integer: ",0
prompt2 BYTE "Enter 2nd integer: ",0
prompt3 BYTE " ", 0
OutputSum BYTE "Sum:",0

.code
main PROC

	call Clrscr

	mov dl, 39						;center cursor
	mov dh, 12
	call Gotoxy

	mov	edx, OFFSET prompt1			
		call WriteString			;write string to screen
		call ReadInt				;input

		mov ebx, eax				;move input to ebx

		mov dl, 39					;move to next line
		mov dh, 13
		call Gotoxy

	mov	edx, OFFSET prompt2		
		call WriteString			;display string
		call  ReadInt				;input
	
		add ebx, eax				;sum inputs

		mov dl, 39					;move to next line
		mov dh, 14
		call Gotoxy

	mov	edx, OFFSET OutputSum
		call WriteString			;display string
		mov eax, ebx				
		call WriteInt				;display sum

		mov dl, 39					;move to next line
		mov dh, 15
		call Gotoxy

	exit
main ENDP

END main