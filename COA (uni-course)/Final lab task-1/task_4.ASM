.model small
.stack 100h
.data
newline db 0Dh,0Ah,'$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, 80h        
    
outer_loop:
    push cx
    mov cx, 10        
    
inner_loop:
    mov dl, al
    mov ah, 02h
    int 21h
    
    mov dl, ' '       
    mov ah, 02h
    int 21h
    
    inc al
    loop inner_loop
    
    
    mov ah, 09h
    lea dx, newline
    int 21h
    
    pop cx
    sub cx, 10
    jnz outer_loop
    
    
    mov ah, 4ch
    int 21h
main endp
end main
