; Program Name:           lab9part2version2.asm

; Program Description: The GCD of two numbers are found using a recursive implementation of Euclids Algorithm.
; Author: Chris Banci
; Date: 10/20/15


INCLUDE Irvine32.Inc

.data
pair1 DWORD 20, 5
pair2 DWORD 24, 18
pair3 DWORD 11, 7
pair4 DWORD 432, 226
pair5 DWORD 26, 13

text1 BYTE "The GCD = "						

.code
main PROC

			mov esi, OFFSET pair1					;(20,5)
			mov eax, [esi]							;move first element to eax
			mov ebx, [esi+4]						;move second element to ebx			
			call Recursive							;recursive function
			mov eax, ebx							;mov GCD to eax to display.
			mov edx, OFFSET text1
			call WriteString
			call WriteDec							
			call Crlf
			
			mov esi, OFFSET pair2					;(24,18)
			mov eax, [esi]							;move first element to eax
			mov ebx, [esi+4]						;move second element to ebx			
			call Recursive							;recursive function
			mov eax, ebx							;mov GCD to eax to display.
			mov edx, OFFSET text1
			call WriteString
			call WriteDec							
			call Crlf

			
			mov esi, OFFSET pair3					;(11,7)
			mov eax, [esi]							;move first element to eax
			mov ebx, [esi+4]						;move second element to ebx			
			call Recursive							;recursive function
			mov eax, ebx							;mov GCD to eax to display.
			mov edx, OFFSET text1
			call WriteString
			call WriteDec							
			call Crlf
			
			mov esi, OFFSET pair4					;(432,226)
			mov eax, [esi]							;move first element to eax
			mov ebx, [esi+4]						;move second element to ebx			
			call Recursive							;recursive function
			mov eax, ebx							;mov GCD to eax to display.
			mov edx, OFFSET text1
			call WriteString
			call WriteDec							
			call Crlf
			
			mov esi, OFFSET pair5					;(26,13)
			mov eax, [esi]							;move first element to eax
			mov ebx, [esi+4]						;move second element to ebx			
			call Recursive							;recursive function
			mov eax, ebx							;mov GCD to eax to display.
			mov edx, OFFSET text1
			call WriteString
			call WriteDec							
			call Crlf
	
	INVOKE ExitProcess,0
main ENDP

	Recursive PROC 									;Recursive Procedure	
			mov edx, 0								;clear edx to divide			
			div ebx									;divides eax:ebx with remainder in edx	

			cmp edx, 0								;when remainder = 0, 
			je finish								;jump to finish
	
			mov eax, ebx							;move divisor to eax
			mov ebx, edx							;move dividend to ebx
			call Recursive
			
		finish:
			ret

	Recursive ENDP
END main