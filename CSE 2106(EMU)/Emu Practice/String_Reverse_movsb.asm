.model small
.stack 100h

.data

str1 db "Hello$"
str2 db 5 dup(?)

.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea si,str1+4
    lea di,str2
    mov cx,5
    cld     
    
    l1:
    
    movsb 
    sub si,2
    
    loop l1
    
    mov cx,5 
    lea si,str2
    
    l2:
    
    mov dl,[si]
    mov ah,2
    int 21h
    
    add si,1
    loop l2
    
    mov ax,4c00h
    int 21h
    main endp
end main