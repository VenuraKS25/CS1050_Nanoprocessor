; ======================================================
; ===== 99sevseg.asm ===================================
; ===== Seven Segment Displays Port 02 =================


	ORG 	10
	DB	00
	DB	01
	DB	02
	DB	03
	DB	04
	DB	05
	DB	06
	DB	07
	DB	08
	DB	09
	DB	0A
	DB	0B
	DB	0C
	DB	0D
	DB	0E
	DB	0F
	JMP	Start

	ORG 	00
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
	MOV	AL,1
	OUT	02

	MOV	BL,1
	CALL	70

	PUSH	AL
	POP	CL
	PUSH	AL
	POP	DL
	DIV	CL,10
	MOD	DL,10
	MOV	BL,00

	CALL	80

;
	ORG	70
Rep:
	CMP	BL,6
	JZ	Stop
	MUL 	AL,BL
	INC	BL
	JMP	Rep
;

	ORG	80
Left:
	CMP	CL,BL
	JZ	Stop
	INC	BL
	JMP	Left
;


	ORG	7C	
Stop:
	RET
;

	END
