.model small
.stack 100h

.data

arr db 7,8,9,2,3,6,5,4,1 
min db ?
max db ?
str1 db "Max Element: $"
str2 db 0ah,0dh,"Min Element: $"

.code 
main proc
    mov ax,@data
    mov ds,ax
     
    lea si,arr
    mov cx,9
    xor ax,ax
    xor bx,bx 
    mov al,[arr]
    mov bl,[arr]
    
    _Loop:
    
    cmp [si],al
    jg _Max
    
    cmp [si],bl
    jl _Min 
    
    jmp continue
    
    _Max:
    
    mov al,[si]
    jmp Continue
    
    _Min:
    
    mov bl,[si] 
    
    Continue:
    
    add si,1
    loop _Loop
    
    mov max,al
    mov min,bl
           
    lea dx,str1
    mov ah,9
    int 21h
    
    mov dl,max
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str2
    mov ah,9
    int 21h
    
    mov dl,min
    add dl,48
    mov ah,2
    int 21h
    
    mov ax,4c00h
    int 21h
    main endp
end main
