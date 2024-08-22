;Printing Even or Odd  

.model small
.stack 100h

.data

str1 db "Enter a number: $" 
str2 db " is Even$"
str3 db " is Odd$"
str4 db 0ah,0dh,24h

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
    mov bx,0
    mov bl,al
    
    lea dx,str4
    mov ah,9
    int 21h
    
    mov ax,bx
    
    
    div a
    
    cmp ah,0
    je l1 
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h 
    
    lea dx,str3
    mov ah,9
    int 21h
    
    jmp l2
    
    l1:
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h 
    
    lea dx,str2
    mov ah,9
    int 21h
    
    l2:
    
    mov ax,4c00h
    int 21h
    main endp
end main
    
    