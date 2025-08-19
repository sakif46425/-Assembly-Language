.model small
.stack 100h
.data
    msg db 'YX$'       
.code
main proc
    mov ax, @data
    mov ds, ax

    
    mov si, offset msg
    mov al, [si]        
    mov bl, [si+1]      

    
    mov [si], bl       
    mov [si+1], al      


    mov dx, offset msg
    mov ah, 9
    int 21h             

    mov ah, 4Ch         
    int 21h

main endp
end main