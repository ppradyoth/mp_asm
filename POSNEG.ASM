data segment
num dw -10h
posneg dw ?
data ends
code segment
assume cs:code,ds:data
begin:mov ax,data
mov ds,ax
mov ax,num
rol ax,1
jc neg1
mov ax,00h
jmp pos
neg1: mov ax,0ffh
pos: mov posneg,ax
mov ah,4ch
int 21h
code ends
end begin
