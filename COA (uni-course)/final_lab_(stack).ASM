
.MODEL SMALL
.STACK 100h

.DATA

.CODE

MAIN PROC

         MOV  AX, @DATA

         MOV  DS, AX

         MOV  AX,12Ah

         MOV  BX,22AAh

         MOV  CX, 12

         ADD  AX,BX

         PUSH AX

         SUB  AX,89

         SHL  AX,1

         PUSH AX

         PUSH BX

         SHR  BX,2

         PUSH BX

         ROR  AX,3

         SHL  BX,1

         PUSH BX

         PUSH AX

         POP  CX

         POP  DX

         POP  AX

         MOV  AH, 4CH

         INT  21H

MAIN ENDP
 
END MAIN
 