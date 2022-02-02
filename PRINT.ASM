data segment
m dw -10h
m1 db "positive$"
m2 db "negative$"
posneg dw ?
data ends
printf macro msg
lea dx,msg
mov ah,09h
int 21h
endm
code segment
assume cs:code, ds:data
begin:
mov ax,data
mov ds,ax
mov ax,m
rol ax,1
jc L1
mov ax,00h
printf m1
jmp L2
;mov ax,09h
;int 21h
L1: mov ax,0ffh
    printf m2
L2: mov posneg,ax
mov ah,4ch
int 21h
code ends
end begin
