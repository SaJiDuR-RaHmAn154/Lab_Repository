.model small
.stack 100h

.data

str1 db "Quotient : $"
str2 db "Remainder : $" 

a dw 9
b db 2 

.code

main proc
    
    mov ax,@data
    mov ds,ax  
    
    mov ax,a
    div b
    mov bx,ax
    
    lea dx,str1
    mov ah,9
    int 21h
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h 
    
    mov dl,0ah
    mov ah,2
    int 21h 
    
    mov dl,0dh
    mov ah,2
    int 21h
    
    lea dx,str2
    mov ah,9
    int 21h  
    
    mov dl,bh
    add dl,48
    mov ah,2
    int 21h
                   
    mov ax,4c00h
    int 21h
    main endp  
end main
    
    
    
