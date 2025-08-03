.MODEL SMALL
.STACK 100H

.DATA
    helloMsg DB 'Hello world', 0DH, 0AH, '$'
    byeMsg   DB 'Bye world$', 0DH, 0AH

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5         

print_loop:
    MOV AH, 09H       
    LEA DX, helloMsg 
    INT 21H           
    LOOP print_loop   


    MOV AH, 09H
    LEA DX, byeMsg
    INT 21H

   
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
