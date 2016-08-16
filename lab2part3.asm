; Program Name:          lab2part3.asm

; Program Description: Write a program that defines symbolic names for several string literals (characters betweenquotes). Use each symbolic name in a variable definition.
; Author: Chris Banci
; Date: August 28, 2015

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

string1 TEXTEQU <"Wrong password"> 
string2 TEXTEQU <"Computer self-destructing">
string3 TEXTEQU <"3..2..1.. Goodbye">

.data

greeting1 BYTE string1
greeting2 BYTE string2
greeting3 BYTE string3

.code
main PROC

	INVOKE ExitProcess,0
main ENDP

; (insert additional procedures here)
END main