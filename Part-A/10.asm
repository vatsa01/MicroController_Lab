AREA PROG10,CODE,READONLY
ENTRY
STORAGE EQU 0X40000000
LDR SP, =STORAGE
LDR R3, =STORAGE + 200
NUM EQU 11
SIZE EQU 1
ADR R6, ARRAY
MOV R1, #0
MOV R2, #NUM - 1
MOV R5, #17 ;search value
STMDB R3!, {R6,R1,R2,R5, R0}
MAIN BL FINDIT
B MAIN
FINDIT
STMDB SP!, {R4,R7,R8,R9,R10,R11,R12,LR}
LDMFD R3!, {R11,R7,R8,R10, R0}
CMP R7, R8
BGT STOP
ADD R9, R7, R8
MOV R9, R9, ASR #1
LDR R12, [R11, R9,LSL #2]
ADD R11, R9, LSL #2
MOV R0, R11
ADD R4, R9, LSL #1
CMP R12, R10
SUBGT R8, R9, #1
ADDLE R7, R9, #1
LDR R11, [R3, #-4]
STMFD R3!, {R11,R7,R8,R10, R0}
LDMIA SP!, {R4,R7,R8,R9,R10,R11,R12,PC}
MOV PC, LR
STOP B STOP
ARRAY DCD 3,6,8,12,17,22,45,67,99,2089,30001
END
