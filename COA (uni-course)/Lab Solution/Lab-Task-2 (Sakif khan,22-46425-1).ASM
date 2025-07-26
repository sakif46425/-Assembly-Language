.MODEL SMALL
.STACK 100H
.DATA

A DB 9
B DB 4
C DB 3
R DB ?

msg DB 'Result (R) is: $'


.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    
    
    MOV AH,9
    LEA DX, msg
    INT 21H
    
    
    MOV AL, A
    SUB AL, B
    ADD AL, C
    MOV R,AL
    
    
    ADD AL, 30H
    
    
    MOV AH,2
    MOV DL, AL
    INT 21H
    
    
    MAIN ENDP
END MAIN