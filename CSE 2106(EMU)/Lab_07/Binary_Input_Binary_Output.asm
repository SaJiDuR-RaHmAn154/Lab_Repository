;Binary Input Binary Output

.model small
.stack 100h 

.data
   
str1 db "Enter the binary string: $"
str2 db 0ah,0dh,"Binary Output: $"

.code 

main proc
    
    mov ax,@data
    mov ds,ax
    
    xor bl,bl
    
    lea dx,str1
    mov ah,9
    int 21h
    
    _loop:
     
     mov ah,1
     int 21h 
     
     cmp al,0dh
     je Msge
     
     sub al,30h
     
     shl bl,1
     or bl,al
     
     jmp _loop    
    
    Msge:
    
    lea dx,str2
    mov ah,9
    int 21h
      
    xor cx,cx
    mov cl,8
    
    Print:
    
    shl bl,1
    jc One
    jnc Zero
      
    One:
    
    mov dl,1
    add dl,48
    mov ah,2
    int 21h
     
    jmp Continue
    
    Zero:
    
    mov dl,0
    add dl,48
    mov ah,2
    int 21h
       
    Continue:
    
    loop Print
    
    mov ax,4c00h
    int 21h
    main endp
end main

