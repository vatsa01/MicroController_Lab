AREA PROG7,CODE,READONLY
A RN 1
D RN 2
N RN 3
ENTRY
MOV A,#1
MOV D,#2
MOV N,#10
MOV R5,#0x40000000
LOOP MUL R6,A,D
MOV A,R6
STR A,[R5],#4
SUBS N,N,#1
BNE LOOP
STOP B STOP
END
