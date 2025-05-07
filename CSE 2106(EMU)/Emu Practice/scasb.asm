.model small
.stack 100h

.data

str db "RueT-CsE$" 
vow db "AEIOUaeiou$"
nl db 0ah,0dh,24h
ct db 0
i db 0


.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea si,str
    
    l1:
    mov al,byte ptr [si]
    cld
    lea di,vow
    mov cx,10
    repnz scasb
    jz vowel
    jmp continue
    
    vowel:
    
    inc ct
    
    continue:
    
    inc i
    loop l1
   
    
    
    mov dl,ct
    mov ah,2
    int 21h
    
    mov ax,4c00h
    int 21h
    main endp
end main