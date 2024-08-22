.model small
.stack 100h

.data

str1 db "ABCBA$"
str2 db 5 dup(?)
str3 db "str1 is a Palindrome$"
str4 db "str1 is not a palindrome$"

.code

main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea si,str1+4
    lea di,str2
    cld
    
    mov cx,5
    
    _Loop1:
    
    movsb
    sub si,2
    
    loop _Loop1
    
    xor si,si
    xor di,di
    lea si,str1
    lea di,str2
    mov cx,5
    cld
        
    repe cmpsb
    jz Palindrome 
    
    lea dx,str4
    mov ah,9
    int 21h
            
    jmp Terminate
    
    Palindrome:
    
    lea dx,str3
    mov ah,9
    int 21h
    
    Terminate:
    
    mov ax,4c00h
    int 21h
    main endp
end main