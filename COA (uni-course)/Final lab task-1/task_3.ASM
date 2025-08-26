.model small
.stack 100h
.data
msg db 'Enter a character: $'
newline db 0Dh,0Ah,'$'
.code
main proc
    mov ax, @data
    mov ds, ax

    
    mov ah, 09h
    lea dx, msg
    int 21h
    
    
    mov ah, 01h
    int 21h
    mov bl, al         
    
   
    mov ah, 09h
    lea dx, newline
    int 21h
    
   
    mov cx, 50
print_loop:
    mov dl, bl
    mov ah, 02h
    int 21h
    loop print_loop
    

    mov ah, 4ch
    int 21h
main endp
end main