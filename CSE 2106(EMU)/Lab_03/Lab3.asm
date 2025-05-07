.model small
.stack 100h

.data

str1 db "Hello$" ;$->string er end bujhay(ata string er length a included na),db,dw->proti character koto byte jayga niye thakbe seta define kore
str2 db 0Ah,0Dh,"World$" ;0Ah->cursor direct niche name and 0Dh->cursor line er surute chole asbe(carriage return)
str3 db 0Ah,0Dh,41h,42h,43h,24h   ;A->41h,....,4->24h 
str4 db "My Name is Sajid$"

.code
main proc
    mov ax,@data
    mov ds,ax 
    
    lea dx,str1            ;lea->Load Effective Address(kono string er base address k register a neya er kaj);base address 16 bit a convert hoye dx register a store hobe
    mov ah,9
    int 21h
    
    lea dx,str2
    mov ah,9
    int 21h       
    
    lea dx,str3
    mov ah,9
    int 21h  
    
    mov dl,0Ah       ;Manually New line printing
    mov ah,2
    int 21h
    
    mov dl,0Dh
    mov ah,2
    int 21h
           
    lea dx,str4
    mov ah,9
    int 21h
    
    
    mov ax,4c00h
    int 21h
    main endp
end main