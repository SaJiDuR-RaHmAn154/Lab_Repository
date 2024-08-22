.model small 
.stack 100h  

.data   

a dw 5  
b dw 8    

.code    

main proc  
    
    mov ax,@data 
    mov ds,ax    
    
    mov ax,a  
    sub ax,b
    neg ax    ;neg ax-> -3 er 2's compliment kore 3 store kore ax a
    
    mov bx,ax
    
    mov dl,'-'   ;mov dl,45 (similar)
    
    mov ah,2
    int 21h
 
    mov dl,bl
    add dl,48
    
    mov ah,2
    int 21h
    
    
    exit: 
    
    mov ax,4c00h
    int 21h
    main endp
end main
     