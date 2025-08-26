.model small
.stack 100h
.data
.code 
main proc
    mov ax,@data
    mov ds,ax

    mov cx, 256
    mov al, 0

    print_Loop:
        mov dl, al
        mov ah, 02h
        int 21h

        inc al
        loop print_Loop

        mov ah, 4ch 
        int 21h
main endp
end main