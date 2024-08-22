.model small
.stack 100h

.data
str1 db "Enter a hex digit: $"
str2 db 0ah,0dh,"In decimal: $"
str3 db "Do you want to do it again?(Y/y/N/n) $"
str4 db 0ah,0dh,24h 
str5 db 0ah,0dh,"Invalid Input$"

p db ?

.code  

main proc
    mov ax,@data
    mov ds,ax
    
    _Loop:
    
    lea dx,str4
    mov ah,9
    int 21h
    
    lea dx,str1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h 
    mov p,al
    
    cmp al,30h
    jl Invalid
    
    cmp al,46h
    jg Invalid
    
    cmp al,39h
    jle Digit
    
    jmp Character
    
    Digit:
    
    lea dx,str2
    mov ah,9
    int 21h
    
    mov dl,p
    mov ah,2
    int 21h
    
    lea dx,str4
    mov ah,9
    int 21h
    
    jmp Ask
    
    Character:
    
    mov bl,p
    sub bl,11h 
    
    lea dx,str2
    mov ah,9
    int 21h
    
    mov dl,31h
    mov ah,2
    int 21h 
    
    mov dl,bl
    mov ah,2
    int 21h     
    
    lea dx,str4
    mov ah,9
    int 21h
    
    jmp Ask
             
    Invalid:
    
    lea dx,str5
    mov ah,9
    int 21h
    
    lea dx,str4
    mov ah,9
    int 21h 
    
    Ask:
    
    lea dx,str3
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,'y'
    je _Loop
    
    cmp al,'Y'
    je _Loop
    
    cmp al,'n'
    je Terminate
    
    cmp al,'N'
    je Terminate
    
    Terminate:
   
    mov ax,4c00h
    int 21h
    main endp
end main
    
    