.model small
.stack 100h
.data
.code
main proc
    mov ax, @data
    mov ds, ax


    mov cx, 20
    mov ax, 0
    mov bx, 100

    sum_Loop:
        add ax, bx
        sub bx, 5
        loop sum_Loop

        mov ah, 4ch
        int 21h
main endp
end main