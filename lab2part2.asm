; Program Name:          lab2part2.asm

; Program Description: Write a program that defines symbolic integer constants for all seven days of the week. Create an array variable that uses the symbols as initializers.
; Author: Chris Banci
; Date: August 28, 2015

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

MONDAY = 0 
TUESDAY = 1 
WEDNESDAY = 2
THURSDAY = 3
FRIDAY = 4
SATURDAY = 5
SUNDAY = 6

.data

daysOfWeek BYTE MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY

.code
main PROC

	INVOKE ExitProcess,0
main ENDP

; (insert additional procedures here)
END main