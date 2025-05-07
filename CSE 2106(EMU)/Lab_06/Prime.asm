.model small
.stack 100h

.data

str1 db "Enter a number: $"
str2 db " is a prime",0ah,0dh,24h
str3 db " is not a prime",0ah,0dh,24h
str4 db 0ah,0dh,24h

.code
   
n db ?

main proc 
    
    mov ax,@data
    mov ds,ax      
    
    lea dx,str1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,30h
    mov n,al
    
    lea dx,str4
    mov ah,9
    int 21h
    
    mov bl,2
    
    _loop:
    
    cmp bl,n 
    je Prime
    
    mov ax,0
    mov al,n
    div bl
    
    cmp ah,0
    je Not_Prime
    
    inc bl
    jmp _loop
        
    Not_Prime:
    
    mov dl,n
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str3
    mov ah,9
    int 21h
    
    jmp Terminate
    
    
    Prime:
    
    mov dl,n
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str2
    mov ah,9
    int 21h
    
    Terminate:    
    mov ax,4c00h
    int 21h
    main endp
end main                           

