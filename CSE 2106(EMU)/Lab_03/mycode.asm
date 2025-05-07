.model small
.stack 100h

.data
a dw 18
b dw 12

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ax,a
    sub ax,b
    aaa
    
    mov bx,ax
    mov dl,bh
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    mov ax,4c00h
    int 21h
    main endp
end main
    