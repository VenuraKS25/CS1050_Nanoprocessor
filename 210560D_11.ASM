; ======================================================
; ===== 99sevseg.asm ===================================
; ===== Seven Segment Displays Port 02 =================


	JMP	Start
	ORG 	B0
	DB	FA
	DB	0B
	DB	C4
	DB	9D
	DB	4E
	DB	DC
	DB	FC
	DB	8A
	DB	FE
	DB	CE
	DB	EE
	DB	6C
	DB	F0
	DB	3E
	DB	F4
	DB	E4

	
	ORG	40
Start:
	MOV	DL,1
	MOV	CL,1
	CALL	70

	PUSH	CL
	POP	AL
	PUSH	CL
	POP	BL
	DIV	AL,10
	MOD	BL,10
	ADD	AL,B0
	MOV	AL,[AL]
	OUT	02

	ADD	BL,B0
	MOV	CL,[BL]
	INC	CL
	PUSH	CL
	POP	AL
	OUT	02
	JMP	Start
;

	ORG	70
Rep:
	CMP	DL,6
	JZ	Stop
	MUL 	CL,DL
	INC	DL
	JMP	Rep
;

	ORG	7C	
Stop:
	RET
;

	END
