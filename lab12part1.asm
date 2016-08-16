; Program Name:           AsmMultArray.asm

; Program Description: in the c++ program, it uses this function to multiply each array value by 55.
; Author: Chris Banci
; Date: 11/9/15

.586
.model flat,C

AsmMultArray PROTO,
	srchVal:DWORD, arrayPtr:PTR DWORD, arraySize:DWORD

.code
;-----------------------------------------------
AsmMultArray PROC USES edi,
	mval:DWORD, arrayPtr:PTR DWORD, arraySize:DWORD
	mov ecx, arraySize

	mov edi, arrayPtr					;address
	mov eax, 4
	mov ebx, esi					
	mul ebx								;multiply esi counter by 4.

	add edi, eax						;add it to pointer
	mov eax, [edi]

	mov ebx, mval						
	mul ebx								;multiplay array value by mval.
	mov [edi], eax						;move back to address.

; Multiplies each element of an array by mval.
;-----------------------------------------------

; Your code goes here

	ret   
AsmMultArray ENDP

END

