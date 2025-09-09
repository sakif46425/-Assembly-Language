.model small
.stack
.data
msg1 DB "Input: $"    
msg2 DB "Output: $"

.code    

Main Proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov bx,0
    mov cx,16
    
    input:
    mov ah,1
    int 21h
    cmp al,13
    je output
    
    and al,0fh
    shl bx,1
    or bl,al
    loop input
    
    output:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov cx,16
    
    output_1:
    shl bx,1
    JNC zero
    
    mov dl,31h
    mov ah,2
    int 21h
    jmp output_loop
    
    ZERO:
    mov dl,30h
    mov ah,2
    int 21h
    
    output_loop:
    loop output_1
    main endp
    end main