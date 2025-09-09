.model small
.stack 100h
.data
.code
sum proc
    add bh,bl
    ret
    sum endp
 
output proc
    mov ah,2
    mov dl,bh
    int 21h
    ret
    output endp
 
main proc
    mov bh,0002h
    mov bl,0001h
    call sum
    call output

    main endp
end main
 
 