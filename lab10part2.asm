; Program Name:           lab10part2.asm

; Program Description: Bubble-sorting program. varFlag is set to 1 when no exchanges occur and exits the
;                      sort using the flag before its normal completion of passing through the array.
; Author: Chris Banci
; Date: 10/26/15

INCLUDE Irvine32.Inc

BubbleSort PROTO,
	pArray:PTR DWORD,
	Count:DWORD,

.data

intArray BYTE 8, 4 ,9, 2, 5, 2, 3, 1

.code
main PROC
	INVOKE BubbleSort, OFFSET intArray, LENGTHOF intArray
	INVOKE ExitProcess,0
main ENDP


BubbleSort PROC USES eax ecx esi,
		pArray:PTR DWORD, Count:DWORD

		LOCAL varFLAG: DWORD

		mov varFlag, 0
		mov ecx,Count
		dec ecx ; decrement count by 1

	L1: mov esi,pArray ; point to first value

	L2: mov eax,[esi] ; get array value
		cmp [esi+4],eax ; compare a pair of values
		mov varFlag, 1
		jge L3 ; if [esi] <= [edi], skip
		xchg eax,[esi+4] ; else exchange the pair
		mov [esi],eax

	L3: add esi,4 ; move both pointers forward
		loop L2 ; inner loop
		cmp varFlag, 1
		je L4
		loop L1 ; else repeat outer loop

	L4: ret

BubbleSort ENDP
END main