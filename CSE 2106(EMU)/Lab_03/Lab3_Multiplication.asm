.model small
.stack 100h

.data

a db ?
b db ?
                              ; mul source
.code                         ;prod=a*b(a->multiplicand,b->multiplier) 8 bit er khetre multiplicand k must 'al' er moddhe nite hobe

main proc                     ;mul b (product automatically ax a chole jabe)
    
    mov ax,@data
    mov ds,ax 
    
    mov ah,1
    int 21h
    sub al,30h
    mov a,al
    
    mov ah,1
    int 21h  
    sub al,30h
    mov b,al
    
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
    
    
    
    
                 