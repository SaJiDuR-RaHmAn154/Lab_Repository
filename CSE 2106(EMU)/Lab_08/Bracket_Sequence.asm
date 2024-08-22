.model small
.stack 100h

.data

str1 db "Enter Bracket Sequence: $"
str2 db 0ah,0dh,"Valid Sequence $"   
str3 db 0ah,0dh,"Invalid Sequence $"
newline db 0ah,0dh,24h

.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,str1
    mov ah,9
    int 21h
    
    mov ax,'$'
    push ax
    
    _Loop:
    
    mov ah,1
    int 21h
    
    xor ah,ah
    
    cmp al,0dh
    je Check  
    
    cmp al,'('
    je _Push
    
    cmp al,'{'
    je _Push
    
    cmp al,'['
    je _Push
    
    cmp al,')'
    je Opening_FB 
    
    cmp al,'}'
    je Opening_SB
    
    cmp al,']'
    je Opening_TB
    
    _Push:
    
    push ax
    jmp _Loop
    
    Opening_FB: 
    
    pop bx
    cmp bx,'('
    jne Invalid
    jmp _Loop 
    
    Opening_SB: 
    
    pop bx
    cmp bx,'{'
    jne Invalid
    jmp _Loop
    
    Opening_TB: 
    
    pop bx
    cmp bx,'['
    jne Invalid
    jmp _Loop
    
    
    Check:
    
    pop bx
    cmp bx,'$'
    je Valid
    jmp Invalid
    
    Valid:
    
    lea dx,str2
    mov ah,9
    int 21h
                  
    jmp Terminate 
    
    Invalid:
    
    lea dx,str3
    mov ah,9
    int 21h
    
    Terminate:
    
    mov ax,4c00h
    int 21h
    main endp
end main                                                                      


