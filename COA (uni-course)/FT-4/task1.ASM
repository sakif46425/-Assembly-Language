.model small
.stack 100h
.data
    msg1     db "Input: $"
    msg2     db 13,10,"Output: $"
    odd_msg  db 13,10,"Odd parity$"
    even_msg db 13,10,"Even parity$"

.code
main proc
                mov  ax, @data
                mov  ds, ax
    
                mov  ah, 9
                lea  dx, msg1
                int  21h
    
                xor  bx, bx
                mov  cx, 16
    
    input_loop: 
                mov  ah, 1
                int  21h
    
                cmp  al, 13
                je   output
    
                cmp  al, '0'
                je   zero_bit
                cmp  al, '1'
                je   one_bit
                jmp  input_loop
    
    zero_bit:   
                shr  bx, 1
                loop input_loop
    
    one_bit:    
                shr  bx, 1
                or   bl, 1
                loop input_loop
    
    output:     
                mov  ah, 9
                lea  dx, msg2
                int  21h
    
  
                mov  al, bl
                and  al, 1
    
                cmp  al, 0
                je   even_parity
    
                mov  ah, 9
                lea  dx, odd_msg
                int  21h
                jmp  done
    
    even_parity:
                mov  ah, 9
                lea  dx, even_msg
                int  21h
    
    done:       
                mov  ah, 4Ch
                int  21h
    
main endp
end main

