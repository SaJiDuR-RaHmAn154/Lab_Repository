;Read a hexadecimal digit (0 to 9 and A to F)
;Print the decimal value on the next line


.model small
.stack 100h

.data
str1 db "Enter the hexadecimal digit: $"
str2 db "Decimal Value= $" 
str3 db "Invalid Input $"

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
    
    mov dl,0ah
    mov ah,2
    int 21h
    
    mov dl,0dh
    mov ah,2
    int 21h
    
    lea dx,str2
    mov ah,9
    int 21h
    
    
    mov cl,a
    
    cmp cl, 30h
    jl l5
    
    cmp cl,49h
    jg l5
    
    cmp cl,30h
    jge l1
    
    l1:   
    cmp cl,39h
    jle l2
    
    jmp l3
    
    l2:
      mov dl,cl
      mov ah,2
      int 21h
      jmp l4
       
    l3:    
      mov dl,31h
      mov ah,2
      int 21h
      
      sub cl,11h
      mov dl,cl
      mov ah,2
      int 21h 
      jmp l4
    l5: 
      lea dx,str3
      mov ah,9
      int 21h 
      
    l4:    
    mov ax,4c00h
    int 21h
    main endp
end main


