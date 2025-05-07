;Read two characters and print them on the next line in alphabetic order.

.model small
.stack 100h

.data
str1 db "Enter the first character: $"  
str2 db "Enter the second character: $"  
str3 db "Resulted Alphabetical Order-> $"

a db ?
b db ?

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
               
    mov ah,1
    int 21h 
    mov b,al
    
    mov dl,0ah    
    mov ah,2
    int 21h 
    
    mov dl,0dh
    mov ah,2
    int 21h
    
    lea dx,str3    
    mov ah,9
    int 21h  
    
    mov cl,a
    mov bl,b 
     
    cmp cl,bl
    jge l1
    
    jmp l2
    
    l1:
       mov dl,bl
       mov ah,2
       int 21h
              
       mov dl,cl
       mov ah,2
       int 21h
       jmp l3
       
    l2:   
      mov dl,cl
      mov ah,2
      int 21h
              
      mov dl,bl
      mov ah,2
      int 21h
           
    l3:
    
    mov ax,4c00h
    int 21h
    main endp
end main
    
    
    