.model small
.stack 100h

.data

str1 db " is even",0ah,0dh,24h
str2 db " is odd",0ah,0dh,24h

a db 2
b db 16

.code

main proc
    mov ax,@data
    mov ds,ax      
    
    mov bx,15
    
    _loop:
    
    cmp bx,36
    jg Terminate
    
    mov ax,bx
    div a
    
    cmp ah,0
    je Even
    
    jmp Odd
    
    
    Odd:
    
    mov ax,bx
    div b     
    
    xor cx,cx
    mov cl,al
    inc cl
    
    mov ax,bx
    _loop1: 
    
    aaa    
    loop _loop1
    
    mov cx,ax 
    
    mov dl,ch
    add dl,48
    mov ah,2
    int 21h 
    
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str2
    mov ah,9
    int 21h
    
    inc bx
    jmp _loop
    
    
    Even:
    
    mov ax,bx
    div b 
    
    xor cx,cx
    mov cl,al
    inc cl   
    
    mov ax,bx
    _loop2: 
    
    aaa    
    loop _loop2
    
    
    mov cx,ax 
    
    mov dl,ch
    add dl,48
    mov ah,2
    int 21h 
    
    mov dl,cl
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str1
    mov ah,9
    int 21h
    
    inc bx
    jmp _loop
    
    Terminate:    
    mov ax,4c00h
    int 21h
    main endp
end main