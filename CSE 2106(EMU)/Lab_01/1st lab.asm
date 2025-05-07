;sum=a+b in assembly language(Book,Page-14)

.model small ;program size-->small/medium/medium
.stack 100h  ;100h=256B,ram a 256B er stack neya hoise(size na dile by default 1KB size er  stack nibe)

.data    ;Data Segment

a dw 2   ;(dw->define word(16bit),db->define byte(8bit)),dd,dt
b dw 3   ;(variable naming convention chapter-4)
sum dw ? ;(>->uninitialized)

.code    ;Code Segment

main proc   ;(Format of function declaration->Function_Name proc)
    
    mov ax,@data ;Initializing Data segment into Code segment
    mov ds,ax    ;Data segment er segment address k segment register a neya hoise
    
    mov ax,a  ;ax->accumulator register(16bit)
    add ax,b
    mov sum,ax
    
    mov dx,sum  ;kono kisu output dekhate hole dx register a nite hobe
    add dx,48  ;5 er ascii value 53 so we added 48 with the value in dx
    mov ah,2
    int 21h ;Interrupt 21h->ah er value check korbe(1 thakle input nibe,2 thakle output dibe and 9 thakle string input nibe) and dx register er value output a display korbe
    
    exit: 
    
    mov ax,4c00h
    int 21h
    main endp
end main
     
;ax,bx,cx,dx->temporary register(16bit)     
;bx->
;cx->counter register
;dx->data register


;ax is divided into two parts(upper part-ah,;lower part-al)  
;If a db 2 kori then mov ax,a error dibe(as ax er size 16 bit and a er size 8bit),so here valid instruction will mov al,a
;mov ax,a here mov->opcode, ax->destination operand, a->source operand
;mov a,b invalid karon akta register hote hobe must
;add ax,a means ax=ax+a 
;Output er khetre akta character output dibo.Same for input.
;dx er moddhe j value ase seta ASCII value.So display er somoy oi ascii value er corresponding character show korbe         
;mov cs,ds(valid na)->karon duitai segment register
;output holo ascii character
;mov ax,4c00h (control operating system er kase chole jabe-kernel mode a)
;int 21h
;operating mode-(kernel mode,user mode)

