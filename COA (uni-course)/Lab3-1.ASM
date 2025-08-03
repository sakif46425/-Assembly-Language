.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 36H    ; Load AX with 36H
    MOV BX, 39H    ; Load BX with 39H

    CMP AX, BX
    JG AXBIG
    ; If AX > BX, jump to AXBIG
    ; Else, BX is bigger or equal
BXBIG:
    MOV DL, BH     ; Extract high nibble of BX
    MOV AH, 9H
    ADD DL, 30H
    INT 21H

    MOV DL, BL     ; Extract low nibble of BX
    MOV AH, 9H
    ADD DL, 30H
    INT 21H
    

AXBIG:
    MOV DL, AH     ; Extract high nibble of AX
    MOV AH, 9H
    ADD DL, 30H
    INT 21H

    MOV DL, AL     ; Extract low nibble of AX
    MOV AH, 9H
    ADD DL, 30H
    

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
