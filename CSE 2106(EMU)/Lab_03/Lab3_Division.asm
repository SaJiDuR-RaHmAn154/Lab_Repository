.model small
.stack 100h

.data

str1 db 0ah,0dh,"Remainder: $"
str2 db "Quotient: $"
a dw 19
b db ?
                              ; div source
.code                         ; divident k ax a rakhbo( mov ax,a)

main proc                     ;div b (quotient->al a and remainder->ah a jabe)
    
    mov ax,@data
    mov ds,ax 
               
    mov ah,1
    int 21h
    sub al,30h
    mov b,al
    
    mov ax,a
    div b
    
    mov bx,ax
    mov ah,0
    aad
         
    mov  cx,ax
    lea dx,str1
    mov ah,9
    int 21h
     
    mov dl,bh
    add dl,48
    mov bx,cx
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
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    mov ax,4c00h
    int 21h
    main endp
end main
    