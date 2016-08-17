; Program Name:           Lab15part1.asm

; Program Description:    Exercise [1]. Program randomly displays a colored square 100 times in console with a delay of 50 miliseconds.
; Author: Chris Banci
; Date: 12/09/15

INCLUDE Irvine32.inc

WriteAscii PROTO char:BYTE

.data
xRandom BYTE ?
yRandom BYTE ?

.code
main PROC
	call Randomize									;randomize seed

	mov eax, 0
	mov al, green									;set text color to green.
	call SetTextColor						

	mov ecx, 100									;loop displayLoop 100 times

	displayLoop:									
		call Clrscr									;clears square
		call RandCord								;generates random <x,y> cords and moves them to variables
				
		mov edx, 0
		mov dl, xRandom
		mov dh, yRandom
		call Gotoxy

		call DrawSquare								;draws square to console

		mov eax, 50								;delay set to 50 miliseconds
		call Delay
	loop displayLoop

	exit
main ENDP

WriteAscii PROC,
	char:BYTE

	mov al, char
	call WriteChar

	ret
WriteAscii ENDP

DrawSquare PROC
	INVOKE WriteAscii, 219
	INVOKE WriteAscii, 219
	INVOKE WriteAscii, 219
	INVOKE WriteAscii, 219

	mov ebx, 0
	mov bl, yRandom
	inc bl

	mov dh, bl
	call Gotoxy

	INVOKE WriteAscii, 219
	INVOKE WriteAscii, 219
	INVOKE WriteAscii, 219
	INVOKE WriteAscii, 219

	ret
DrawSquare ENDP

RandCord PROC
	mov eax, 80									;x axis limit
	call RandomRange							;random number generated with upper bound
	mov xRandom, al								;moves to x cord variable

	mov eax, 25									;y axis limit
	call RandomRange							;random number generated with upper bound
	mov yRandom, al								;moves to y cord variable

	ret
RandCord ENDP

END MAIN
