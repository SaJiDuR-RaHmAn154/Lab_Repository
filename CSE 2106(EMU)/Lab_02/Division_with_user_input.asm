.model small
.stack 100h

.data

str1 db "Enter the first number : $"
str2 db "Enter the second number : $"   
str3 db "Quotient : $"
str4 db "Remainder: $"

a dw ?
b db ?   

.code

main proc
    
    mov ax,@data
    mov ds,ax  
    
    lea dx,str1
    mov ah,9
    int 21h
    
    mov ah,1  
    int 21h
    sub ax,30h
    mov a,ax
    
    mov dl,0ah
    mov ah,2
    int 21h    
    
    mov dl,0dh
    mov ah,2
    int 21h
    
    lea dx,str2
    mov ah,9
    int 21h
     
    mov ah,1  
    int 21h
    sub al,30h
    mov b,al
    
    mov ax,a
    mov ah,0  
    div b 
    mov bx,ax
    
    mov dl,0ah
    mov ah,2
    int 21h    
    
    mov dl,0dh
    mov ah,2
    int 21h
    
    lea dx,str3
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
    
    lea dx,str4
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
    
    
    
