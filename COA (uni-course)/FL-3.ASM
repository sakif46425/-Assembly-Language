.model small
.stack 100h
.data
    input db 20 dup('$')       
    ones_count db 0
    zeros_count db 0
    msg1 db 'Enter binary string: $'
    msg2 db 13,10,'Binary Input: $'
    msg3 db 13,10,'Number of 1''s: $'
    msg4 db 13,10,'Number of 0''s: $'

.code
main:
    mov ax, @data
    mov ds, ax

   
    lea dx, msg1
    mov ah, 09h
    int 21h

 
    lea dx, input
    mov ah, 0Ah
    int 21h

    lea dx, msg2
    mov ah, 09h
    int 21h

    lea si, input+2          
display_loop:
    mov al, [si]
    cmp al, 13                
    je count_done
    mov dl, al
    mov ah, 02h
    int 21h

   
    cmp al, '1'
    je inc_ones
    cmp al, '0'
    je inc_zeros
    jmp skip_count

inc_ones:
    inc ones_count
    jmp skip_count

inc_zeros:
    inc zeros_count

skip_count:
    inc si
    jmp display_loop

count_done:

    lea dx, msg3
    mov ah, 09h
    int 21h

    mov al, ones_count
    call print_num

  
    lea dx, msg4
    mov ah, 09h
    int 21h

    mov al, zeros_count
    call print_num

    ; Exit
    mov ah, 4Ch
    int 21h


print_num:
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h
    ret
end main