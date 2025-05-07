;CASE CONVERSION IN ASSEMBLY LANGUAGE

.model small
.stack 100h

.data

str1 db "Enter a character: $"
str2 db "Output: $"
str3 db "Invalid Input$"      
str4 db 0ah,0dh,24h 


.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,str1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    lea dx,str4
    mov ah,9
    int 21h  
    
    lea dx,str2
    mov ah,9
    int 21h
    
    cmp bl,'a'
    jl l1
    
    cmp bl,'z'
    jg l1
    
    jmp l2
    
    l1:
    
    cmp bl,'A'
    jl l3
    
    cmp bl,'Z'
    jg l3
    
    add bl,32
    mov dl,bl
    mov ah,2
    int 21h
    jmp l4
    
    l2:   
    
    sub bl,32
    mov dl,bl
    mov ah,2
    int 21h
    jmp l4
    
    l3: 
    
    lea dx,str3
    mov ah,9
    int 21h
     
    l4:
    mov ax,4c00h
    int 21h
    main endp
end main                        


