.MODEL SMALL
.STACK 100H
.DATA
    
     prompt1 DB 'ENTER A LOWER-CASE STRING : $'
     prompt2 DB 0DH,0AH, 'IN UPPERCASE IT IS : $'
     char DB ?

.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX


    MOV AH,09H
    LEA DX,prompt1
    INT 21H


    MOV AH, 1
    INT 21H
    MOV char, AL

    SUB char, 20H

    MOV AH, 09H
    LEA DX,prompt2
    INT 21H

    MOV AH, 02H
    MOV DL, char
    INT 21H


    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN