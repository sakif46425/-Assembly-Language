.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "Before Reverse: $"
MSG2 DB 13,10," After Reverse: $"

.CODE


input PROC
    MOV AH,1        
    INT 21H
    RET
input ENDP


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

   
    CALL input
    PUSH AX
    CALL input
    PUSH AX
    CALL input
    PUSH AX

  
    MOV AH,9
    LEA DX,MSG2
    INT 21H

    
    POP AX
    MOV DL,AL
    CALL output
    POP AX
    MOV DL,AL
    CALL output
    POP AX
    MOV DL,AL
    CALL output

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
