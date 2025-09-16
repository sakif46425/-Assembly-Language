.MODEL SMALL
.STACK 100h
.DATA
    msg1    DB '$'
    msg2    DB '$'
    errMsg  DB 'Invalid input! Enter 0-9 only.$'
    newline DB 13,10,'$'

    num1    DB ?
    num2    DB ?
    result  DW ?

.CODE
MAIN PROC
                  MOV  AX, @DATA
                  MOV  DS, AX

    ; --- Input first number ---
    input1:       
                  LEA  DX, msg1
                  MOV  AH, 09h
                  INT  21h

                  MOV  AH, 01h
                  INT  21h
                  SUB  AL, '0'
                  CMP  AL, 0
                  JB   invalid_input
                  CMP  AL, 9
                  JA   invalid_input
                  MOV  num1, AL

    input2:       
                  LEA  DX, msg2
                  MOV  AH, 09h
                  INT  21h

                  MOV  AH, 01h
                  INT  21h
                  SUB  AL, '0'
                  CMP  AL, 0
                  JB   invalid_input
                  CMP  AL, 9
                  JA   invalid_input
                  MOV  num2, AL

 
                  MOV  AL, num1
                  CMP  AL, 5
                  JA   do_sum
                  MOV  AL, num2
                  CMP  AL, 5
                  JA   do_sum

    
                  MOV  AL, num1
                  MOV  BL, num2
                  MUL  BL
                  MOV  result, AX
                  JMP  print_result

    do_sum:       
                  MOV  AL, num1
                  ADD  AL, num2
                  MOV  AH, 0
                  MOV  result, AX

                  JMP  print_result

    invalid_input:
                  LEA  DX, errMsg
                  MOV  AH, 09h
                  INT  21h
                  JMP  input1

    print_result: 
   
                  LEA  DX, newline
                  MOV  AH, 09h
                  INT  21h

    
                  MOV  AX, result
                  CALL PrintNum

  
                  MOV  AH, 4Ch
                  INT  21h

MAIN ENDP

   
PrintNum PROC
                  PUSH AX
                  PUSH BX
                  PUSH CX
                  PUSH DX

                  MOV  CX, 0
                  MOV  BX, 10

    convert_loop: 
                  XOR  DX, DX
                  DIV  BX
                  PUSH DX
                  INC  CX
                  CMP  AX, 0
                  JNE  convert_loop

    print_loop:   
                  POP  DX
                  ADD  DL, '0'
                  MOV  AH, 02h
                  INT  21h
                  LOOP print_loop

                  POP  DX
                  POP  CX
                  POP  BX
                  POP  AX
                  RET
PrintNum ENDP

END MAIN
