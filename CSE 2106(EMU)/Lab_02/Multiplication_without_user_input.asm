.model small
.stack 100h

.data

a db 15
b db 16 

.code

main proc
    
    mov ax,@data
    mov ds,ax  
    
    mov al,a
    mul b
    
    aam
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
    
    
    
