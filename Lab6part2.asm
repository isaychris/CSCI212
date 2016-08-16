; Program Name:          Lab6part2.asm

; Program Description: Using the college registeration example, logic is recoded to use cmp and jump,
					 ; range is checked.. and message is displayed if student can register or nah.
; Author: Chris Banci
; Date: 9/27/15

INCLUDE Irvine32.inc

.data
TRUE = 1
FALSE = 0
gradeAverage  DWORD 0	
credits       DWORD 0	
OkToRegister  BYTE ?

prompt1 Byte "Enter grade average: ",0
prompt2 Byte "Enter credits value: ",0
yesRegister Byte "The student can register.",0
noRegister Byte "The student cannot register.",0
errorMsg Byte "Error - Please enter credits value between 1-30: ",0


.code
main PROC

	mov	edx, OFFSET prompt1			
	call WriteString					;display promp1
	call ReadInt						;get grade input
	mov gradeAverage, eax
				

	mov	edx, OFFSET prompt2		
	call WriteString					;display promp2
	call ReadInt						;get credit input
	mov credits, eax

	mov OkToRegister,FALSE				

	error:								;checks if credits is n > 30 < n, if not continues program.
	cmp credits, 1						;if below
	jb checkValue
	cmp credits, 30						;if above
	ja checkValue
	jmp condition1

	checkValue:							;jumps to error loop to check input again.
	mov	edx, OFFSET errorMsg		
	call WriteString					
	call ReadInt
	mov credits, eax
	jmp error

condition1:
;.IF gradeAverage > 350
 	cmp  gradeAverage,350				;if gradeAverage < 350 , jump to condition 2
 	jbe  condition2						 

 	mov  OkToRegister,TRUE				;else , set OkToRegister to True and jump to true to display message.
	jmp  trueMsg
				
condition2:
	;.IF (gradeAverage > 250) && (credits <= 16)
	cmp  gradeAverage,250				;if gradeAverage < 250, jump to condition3
	jbe  condition3					

	cmp  credits,16						;if credits > 16, jump to condition3
	ja   condition3

	mov  OkToRegister,TRUE				;else , set OkToRegister to True and jump to true to display message.
	jmp  trueMsg

;.ELSEIF (credits <= 12)
condition3:
	cmp  credits,12						; if credits > 12, jump to display message
	ja   falseMsg

	mov  OkToRegister,TRUE				; if credits < 12, jump to display
	jmp trueMsg

trueMsg:
	mov	edx, OFFSET yesRegister			;display yesRegister
	call WriteString
	call Crlf
	jmp done

falseMsg:
	mov	edx, OFFSET noRegister			;display noRegister
	call WriteString
	call Crlf
	jmp done

done:
			INVOKE ExitProcess,0
main ENDP
end main

