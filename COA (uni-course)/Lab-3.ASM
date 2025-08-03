.MODEL SMALL
.STACK 100H
.DATA
 
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV AX,32H
    MOV BX,32H
    CMP AX,BX
    JG axbig
    JL bxbig
    JE eq
  axbig:
    MOV AH,2
    MOV DX,AX
    INT 21H
    JMP exit 
  bxbig:
    MOV AH,2
    MOV DX,BX
    INT 21H
    JMP exit
  eq:
    MOV AH,2
    MOV DX,03H
    INT 21H
    JMP exit
  exit:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN