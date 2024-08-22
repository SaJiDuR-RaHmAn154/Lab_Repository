;Even-Odd Printing(Range less than 10)

.model small
.stack 100h

.data

str1 db "Enter the ending point: $"
str2 db " is even",0ah,0dh,24h
str3 db " is odd",0ah,0dh,24h
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
    
    mov bl,0
    mov cl,2
    
    _loop:
    
    cmp bl,n 
    jg Terminate
    
    mov ax,bx
    div cl
    
    cmp ah,0
    je Even
                
    Odd:
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str3
    mov ah,9
    int 21h
    
    inc bl
    jmp _loop
    
    
    Even:
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str2
    mov ah,9
    int 21h
    
    inc bl
    jmp _loop
    
    Terminate:
        
    mov ax,4c00h
    int 21h
    main endp
end main                                                    

