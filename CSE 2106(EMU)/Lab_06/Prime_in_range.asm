;Prime Printing in Range

.model small
.stack 100h

.data

str1 db "Enter the ending point: $"
str2 db " is a prime",0ah,0dh,24h
str3 db " is not a prime",0ah,0dh,24h
str4 db 0ah,0dh,24h
str5 db "1 is not prime",0ah,0dh,24h

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
    
    lea dx,str5
    mov ah,9
    int 21h
    
    mov bl,2
    
    _loop1:
    
    cmp bl,n 
    jg Terminate
    
    mov cl,2
    
    _loop2:
    
    cmp cl,bl
    je Prime
    
    mov ax,0
    mov al,bl
    div cl
    
    cmp ah,0
    je Not_Prime
    
    inc cl
    jmp _loop2
        
    Not_Prime:
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str3
    mov ah,9
    int 21h
    
    inc bl
    jmp _loop1
    
    
    Prime:
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str2
    mov ah,9
    int 21h
    
    inc bl
    jmp _loop1
    
    Terminate: 
       
    mov ax,4c00h
    int 21h
    main endp
end main