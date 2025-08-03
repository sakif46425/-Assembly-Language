.MODEL SMALL
.STACK 100H

.DATA
    msg DB 'Hello World$', 0DH, 0AH  

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

print_msg:
    MOV AH, 09H       
    LEA DX, msg       
    INT 21H          
    JMP print_msg    

MAIN ENDP
END MAIN
