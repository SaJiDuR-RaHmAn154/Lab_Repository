.model small
.stack 100h

.data

str1 db "Enter the string: $" 
str2 db 0ah,0dh,"Reversed String: $"
newline db 0ah,0dh,24h

.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,str1
    mov ah,9
    int 21h
    
    mov ax,'$'
    push ax
    
    _Loop1:
         
    mov ah,1
    int 21h
    
    cmp al,0dh
    je Print
    
    xor ah,ah
    push ax
    
    jmp _Loop1
    
    Print:
    
    lea dx,str2
    mov ah,9
    int 21h
    
    _Loop2:
    
    pop bx
    
    cmp bx,'$'
    je Terminate 
    
    mov dx,bx
    mov ah,2
    int 21h
    
    jmp _Loop2
    
    Terminate:
    
    mov ax,4c00h
    int 21h
    main endp
end main