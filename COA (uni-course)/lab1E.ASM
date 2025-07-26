.MODEL SMALL
.STACK 100H 

.DATA

input DB "INPUT: $"

.CODE
MAIN PROC
    MOV AX,@DATA 
    MOV DS,AX
    
    MOV AH,2       ;SINGLE CHAR OUTPUT
    MOV DL,61H     ;PRINT a
    INT 21H
   
    MOV AH,2
    MOV DL,10       ;NEW LINE
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV AH,9        ; OUTPUT A STRING
    LEA DX,input
    INT 21H
    
    MOV AH,1      ;INPUT
    INT 21H
    MOV BH,AL
    
    MOV AH,2       ;SINGLE CHAR OUTPUT
    MOV DL,BH     ;PRINT VALUE
    INT 21H
    
    MAIN ENDP
END MAIN