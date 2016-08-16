; Program Name:           Lab6part1.asm

; Program Description: 
	;This program uses a procedure to fill an array of DWORDS with N random ints, falling within the range of j..k inclusive.
	;Pointer is passed to the array and holds the data. N, j, k variables are also passed. 
	;The procedure is called twice with different values for j and k.

; Author: Chris Banci
; Date: 9/23/15

INCLUDE Irvine32.inc

.data
myArray DWORD 20 DUP (0)

j DWORD 0
k DWORD 0
N DWORD 0

.code
main PROC
		mov N, 5						;5 numbers to fill in array

	; test 1
		mov esi, OFFSET myArray			;pointer offset
		mov j, 10						;lower bound, gets passed
		mov k, 20						;upper bound, gets passed
		call randomGen					;calls randomGen procedure

	; test 2
		add esi, 2						;pointer offset for test 2
		mov j, 20						;lower bound, gets passed
		mov k, 30						;upper bound, gets passed
		call randomGen					;calls randomGen procedure

INVOKE ExitProcess,0
main ENDP

	randomGen PROC				
		mov ecx, N						;set N to ecx loop
		call Randomize					;randomizer seeder
	
		myLoop:						
			mov ebx, k					;sets upper bound
			sub ebx, j					;subtract lowerbound from upperbound, for correct range calculation.
			mov eax, ebx				;mov ebx to eax register to pass value to randomRange function.
			call RandomRange			;random number generated from the difference of bounds.
			add eax, j					;lower bound added back, number is now greater than lowerbound.
			mov [esi], eax				;passes result to the array.
			inc esi						;esi is increased
		loop myLoop

		ret
	randomGen ENDP

END main

