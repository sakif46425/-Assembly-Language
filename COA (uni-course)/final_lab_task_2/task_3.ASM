.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "Before Swap AX=5 BX=6",13,10,"After Swap: $"

.CODE

output PROC
    MOV AH,2
    INT 21H
    RET
output ENDP


MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,9
    LEA DX,MSG1
    INT 21H

    MOV AX,0005H    
    MOV BX,0006H     

    PUSH AX
    PUSH BX
    POP AX
    POP BX

   
    ADD AL,30H      
    MOV DL,AL
    CALL output

    MOV DL,' '
    CALL output

    ADD BL,30H
    MOV DL,BL
    CALL output

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN