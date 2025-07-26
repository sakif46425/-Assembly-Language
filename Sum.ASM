.model small
.stack 100h
.data    

num1 DB ?
num2 DB ?
Sum DB ?

msg1 DB "Enter two number: $"
msg2 DB "Num1: $" 
msg3 DB "Num2: $"   
msg4 DB "The sum is: $"

.code
main proc  
    MOV AX, @data
    MOV DS, AX        
    
    MOV AH, 9
    LEA DX, msg1
    INT 21H  
    
    MOV AH,2 
    MOV DL,10D
    INT 21H
    MOV DL,13D
    INt 21H
    
    MOV AH, 9
    LEA DX, msg2
    INT 21H
               
    MOV AH,1
    INT 21H
    SUB AL, 30H
    MOV num1, AL
         
    MOV AH,2 
    MOV DL,10D
    INT 21H
    MOV DL,13D
    INT 21H     
   
    MOV AH, 9
    LEA DX, msg3
    INT 21H
      
    MOV AH,1
    INT 21H 
    SUB AL, 30H
    MOV num2, AL 
    
    MOV AH,2
    MOV DL, 10
    INT  21H
    MOV DL, 13
    INT 21H 
    
    MOV AH, 9
    LEA DX, msg4
    INT 21H  
    
    MOV BH, num1
    MOV CH, num2
    ADD BH,CH  
    ADD BH, 30H
    
    MOV AH, 2 
    MOV DL, BH 
    INT 21H
    
    
    main endp
end main 