.model small
.stack 100h

.data

str db "Hello$"

.code
main proc
    mov ax,@data
    mov ds,ax

    lea si,str
    mov cx,5
    cld
    
    l1:
    
    lodsb
    mov dl,al
    mov ah,2
    int 21h
    
    loop l1
    
    
    
    mov ax,4c00h
    int 21h
    main endp
end main