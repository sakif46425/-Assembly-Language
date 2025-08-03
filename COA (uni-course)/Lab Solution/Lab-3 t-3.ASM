.MODEL SMALL
.STACK 100H

.DATA
    prompt  DB 'Enter a digit (0-9 or -1 to -9): $'
    posMsg  DB 0DH, 0AH, 'The number is positive.$'
    negMsg  DB 0DH, 0AH, 'The number is negative.$'
    zeroMsg DB 0DH, 0AH, 'The number is zero.$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Prompt message
    MOV AH, 09H
    LEA DX, prompt
    INT 21H

    ; Read character from user
    MOV AH, 01H     ; DOS function to read a character
    INT 21H         ; AL will contain ASCII value of input char

    ; Convert ASCII to integer
    SUB AL, 30H     ; Convert from ASCII to numeric value (for digits 0–9)

    ; Sign extend AL to AX to handle signed comparison
    CBW             ; Convert byte in AL to word in AX (sign-extend to AH)

    CMP AX, 0
    JE isZero
    JG isPositive
    JL isNegative

isPositive:
    MOV AH, 09H
    LEA DX, posMsg
    INT 21H
    JMP exit

isNegative:
    MOV AH, 09H
    LEA DX, negMsg
    INT 21H
    JMP exit

isZero:
    MOV AH, 09H
    LEA DX, zeroMsg
    INT 21H

exit:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
