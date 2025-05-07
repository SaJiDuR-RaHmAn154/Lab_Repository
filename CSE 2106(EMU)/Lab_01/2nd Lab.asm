.model small 
.stack 100h  

.data   

a dw 2  
b dw 8   
sum dw ? 

.code    

main proc  
    
    mov ax,@data 
    mov ds,ax
     
    
    mov ax,a  
    add ax,b
    mov sum,ax
    aaa
             ;Adjust After Addition(aaa)-Decimal digit duitake al,ah dui vage distribute kore dise
    
    mov bx,ax ;Temporary holding(karon 1 print korar por ah affected hosse so bx a ax k temporary vabe hold korte hobe otherwise ax change hoye jabe 0 print korte parbona)
    mov dl,ah
    add dl,48
    
    mov ah,2
    int 21h
    
    mov dl,al  ;8 bit a transfer korle always dl a nibo not dh(otherwise content change hoye jabe dl er)
    add dl,48
    
    mov dl,bl
    add dl,48
    
    mov ah,2
    int 21h
    
    exit: 
    
    mov ax,4c00h
    int 21h
    main endp
end main
     