.model small
.stack 100h

.data

str1 db "Enter the range of the loop: $"
a db ?

.code 
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,str1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov a,al
    mov bl,30h
    
    l1: 
    inc bl
    cmp bl,a
    jg l2
    
    mov dl,0ah
    mov ah,2 
    int 21h
    
    mov dl,0dh
    mov ah,2
    int 21h 
    
    mov dl,bl 
    mov ah,2
    int 21h
    jmp l1
    
    l2:
    mov ax,4c00h
    int 21h
    main endp
end main
    
    
     