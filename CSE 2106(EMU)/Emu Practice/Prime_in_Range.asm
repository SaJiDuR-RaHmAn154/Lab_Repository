.model small
.stack 100h

.data
str1 db "Enter the ending point: $"
str2 db " is prime",0ah,0dh,24h
str3 db " is not prime",0ah,0dh,24h  
str4 db "1 is not a prime",0ah,0dh,24h
str5 db 0ah,0dh,24h

n db ?
i db ?


.code
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
    
    lea dx,str5
    mov ah,9
    int 21h   
    
    lea dx,str4
    mov ah,9
    int 21h
    
    mov bl,2 
    
    l1:
    
    cmp bl,n
    jg l6
           
    l2:
    
    mov i,2
    cmp i,bl
    jge l3 
    
    jmp l4
    
    l3:
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str2
    mov ah,9
    int 21h 
    
    inc bl
    jmp l1
    
    l4:
    
    mov ax,0
    mov al,bl
    div i
    
    cmp ah,0
    je l5 
    
    inc i 
    cmp i,bl
    jl l4
    
    jmp l3
    
    l5: 
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str3
    mov ah,9
    int 21h
    
    inc bl
    jmp l1
    
    l6:
    mov ax,4c00h
    int 21h
    main endp
end main
    
    