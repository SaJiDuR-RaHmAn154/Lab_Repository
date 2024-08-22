.model small
.stack 100h

.data

str db 50 dup(?) 
nl db 0ah,0dh,24h

.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    xor bx,bx
    lea di,str
    cld
    
    l1:
    
    mov ah,1
    int 21h
    cmp al,0dh
    je break
    inc bx
    stosb 
    jmp l1
    
    
    break:
    
    lea dx,nl
    mov ah,9
    int 21h
    
    xor di,di
    mov cx,bx
    lea di,str
    
    l2:
    
    mov dl,[di]
    mov ah,2
    int 21h
    
    inc di
    loop l2
    
    mov ax,4c00h
    int 21h
    main endp
end main