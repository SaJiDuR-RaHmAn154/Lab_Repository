.model small
.stack 100h
.data

x db ?
y db ?

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov x,al
    
    mov ah,1
    int 21h
    mov y,al
    
    mov bl,x
    add bl,y
    sub bl,48
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    
    
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    