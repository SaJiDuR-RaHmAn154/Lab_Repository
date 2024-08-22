.model small
.stack 100h

.data

arr db 1,1,1,1,1
    db 1,1,1,1,1
    db 1,1,1,1,1
    db 1,1,1,1,1
    db 1,1,1,1,1  
    
nl db 0ah,0dh,24h 
    
.code

main proc
    mov ax,@data
    mov ds,ax  
    
    mov bx,0
    mov si,2
    mov cx,5
    
    _Loop1:
    
    mov [arr+bx+si],0
    add bx,5
    loop _Loop1 
    
    xor si,si
    xor bx,bx
    
    mov si,0
    mov bx,10
    mov cx,5
      
    _Loop2:
    
    mov [arr+bx+si],0
    add si,1
    loop _Loop2
    
    mov cx,25
    xor si,si 
    mov bl,5
    lea si,arr
    
    _Loop3:
    
    mov ax,cx
    div bl 
    
    cmp ah,0
    je newline
    jmp print
         
    
    newline:
    
    lea dx,nl
    mov ah,9
    int 21h 
    
    print:
   
    mov dl,[si]
    add dl,48
    mov ah,2
    int 21h
    add si,1
    
    loop _Loop3
    
    
    mov ax,4c00h
    int 21h
    main endp
end main  

