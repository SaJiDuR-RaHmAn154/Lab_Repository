;Binary Input Decimal Output(Less than or equal 15)

.model small
.stack 100h 

.data
   
str1 db "Enter the binary string: $"
str2 db 0ah,0dh,"Decimal Output: $" 

power db 0
ans dw 0

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
    xor ax,ax
    
    _loop1:
    
    shr bl,1
    jc One
    jnc Zero
    
    
    One:
    
    mov al,01h    
    mov cl,power
    shl al,cl
    inc power  
    add ans,ax
     
    jmp Continue
    
    Zero:
    
    mov al,00h
    mov cl,power
    shl al,cl
    inc power
    add ans,ax    
       
    Continue:
    
    cmp power,8
    jl _loop1
    
    xor ax,ax
    mov ax,ans
    
    aaa
    
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

