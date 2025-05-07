.model small
.stack 100h

.data
str1 db "Enter the ending point: $"
str2 db " is Even",0ah,0dh,24h
str3 db " is Odd",0ah,0dh,24h
str4 db 0ah,0dh,24h

n db ?
a db 2

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
    
    lea dx,str4
    mov ah,9
    int 21h
    
    mov bl,0  
    
    l1:
    
    cmp bl,n
    jg l4 
  
    mov ax,0
    mov al,bl
    div a
    
    cmp ah,0
    je l2
    jmp l3
    
    l2:
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str2
    mov ah,9
    int 21h
    inc bl
    jmp l1
    
    l3:
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str3
    mov ah,9
    int 21h 
    inc bl
    jmp l1
    
    l4:
    mov ax,4c00h
    int 21h
    main endp
end main
    
    