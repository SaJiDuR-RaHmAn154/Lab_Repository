.model small
.stack 100h

.data

a db ?
b db ?

.code

main proc
    mov ah,1
    int 21h
    mov a,al  
    
    mov ah,1
    int 21h
    mov b,al
    
    mov bl,a
    add bl,b
    sub bl,48
   
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13 
             
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    
    
    
    
    
    