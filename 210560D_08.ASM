; ===== CONTROL THE TRAFFIC LIGHTS =============================

	CLO		; Close unwanted windows.
Start:
			; Turn off all the traffic lights.
	MOV AL,84
	OUT 01

	MOV AL,0A
	CALL 30

	MOV AL,48
	OUT 01

	MOV AL,01
	CALL 30
			; Turn on all the traffic lights.
	MOV AL,30	; Copy 11111100 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).

	MOV AL,05
	CALL 30
	JMP Start	; Jump back to the start.
			; Program ends.

;

	ORG	30	; Generate machine code from address [30]

	PUSH	AL	; Save AL on the stack.
	PUSHF		; Save the CPU flags on the stack.
Rep:
	DEC	AL	; Subtract one from AL.
	JNZ	REP	; Jump back to Rep if AL was not Zero.

	POPF		; Restore the CPU flags from the stack.
	POP	AL	; Restore AL from the stack.

	RET		; Return from the procedure.
;
	END
;
	
; ===== Program Ends ==========================================

	YOUR TASK
	=========
	Use the help page on Hexadecimal and ASCII codes.
	Work out what hexadecimal numbers will activate the
	correct traffic lights. Modify the program to step
	the lights through a realistic sequence.
