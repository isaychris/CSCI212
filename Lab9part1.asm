; Program Name:           Lab9part1.asm

; Program Description: Using INVOKE, PROTO, and a procedure named FindLargest, the largest value in an array is found.
; Author: Chris Banci
; Date: 10/20/15

INCLUDE Irvine32.Inc

.data
	Array1 SDWORD -6, 2, 12, 3, 50
	Array2 SDWORD 4, 30, -2, 5
	Array3 SDWORD 21, 5, -4
	text1 BYTE "The largest value in the array is: ", 0

FindLargest PROTO,										;Prototype needed to pass values with INVOKE							
	pArray: PTR SDWORD, 
	Count: DWORD

.code
main PROC

	mov edx, 0										
	INVOKE FindLargest, OFFSET Array1, LENGTHOF Array1
	INVOKE FindLargest, OFFSET Array2, LENGTHOF Array2
	INVOKE FindLargest, OFFSET Array3, LENGTHOF Array3

	INVOKE ExitProcess,0
main ENDP

	FindLargest PROC USES ecx esi ebx edx,				;registers that are being preserved
		pArray: PTR SDWORD, Count: DWORD				;parameters to pass

		mov esi, pArray									;array pointer		
		mov ecx, Count									;length of array
		mov eax, [esi]									;address of pointer

		l1:												
			inc edx										;increases as much as count
			cmp edx, count								;checks if edx is equal to counter, if so procedure is finish.
			je finish	

			add esi, 4									;offset for next array value.
			cmp eax, [esi]								;checks which array value is greater,
			jg l2										;if current array value is greater then next array, jump to l2
			jl l3										;if current array value is less than next array, jump to l3

		l2:												;label to set next array value as the greatest.
			mov ebx, eax								;copies the greatest array value to ebx,
			mov eax, ebx								;moves greatest to eax and jumps back to l1 to compare it to next array value
			jmp l1	

		l3:												;label to set current array value as the greatest.
			mov ebx, [esi]								;copies the greatest to ebx,
			mov eax, ebx								;moves greatest to eax and jumps back to l1 to compare it to next array value
			jmp l1	

		finish:			
			mov edx, OFFSET text1						
			call WriteString						
			call WriteInt								;display the greatest array value
			call Crlf

		ret

	FindLargest ENDP
END main