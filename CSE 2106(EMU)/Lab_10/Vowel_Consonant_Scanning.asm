.model small
.stack 100h

.data

str1 db "RuEt_CSe#$"
str2 db "Number of vowels: $"
str3 db 0ah,0dh,"Number of consonants: $"
vowel db "AEIOUaeiou$"
consonant db "BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz$"
len db 9

vowel_ct db 0
consonant_ct db 0

.code

main proc
    mov ax,@data
    mov ds,ax
    mov es,ax 
    
    lea si,str1 
    cld
    
    _Loop:
    
    lodsb
    lea di,vowel
    mov cx,10
    repne scasb
    
    jne Cons
    inc vowel_ct
    jmp Continue
    
    Cons:
    
    lea di,consonant
    mov cx,42
    repne scasb
    jne Continue
    inc consonant_ct
    
    Continue:
    
    dec len
    cmp len,0
    je Print
    
    jmp _Loop
    
    Print:
    
    lea dx,str2
    mov ah,9
    int 21h
    
    mov dl,vowel_ct
    add dl,48
    mov ah,2
    int 21h
    
    lea dx,str3
    mov ah,9
    int 21h
    
    mov dl,consonant_ct
    add dl,48
    mov ah,2
    int 21h
    
    mov ax,4c00h
    int 21h
    main endp
end main