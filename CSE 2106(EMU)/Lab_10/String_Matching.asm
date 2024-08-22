.model small
.stack 100h

.data

str1 db "ABCD$"
str2 db "ABCD$"
str3 db "str1 and str2 are not same$"
str4 db "str1 and str2 are same$" 
n1 db 0
n2 db 0

.code

main proc
    mov ax,@data
    mov ds,ax
    mov es,ax 
    
    lea si,str1
    lea di,str2
    cld
    
    mov cx,4
    
    repe cmpsb
    
    jz Matched
    
    lea dx,str3
    mov ah,9
    int 21h
    jmp Terminate
    
    Matched:
    
    lea dx,str4
    mov ah,9
    int 21h
    
    Terminate:
    
    mov cx,4
    mov ax,4c00h
    int 21h
    main endp
end main

