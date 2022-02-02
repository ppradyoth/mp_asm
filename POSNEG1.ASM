data segment
num db -10h
posneg db ?
data ends
code segment
assume cs:code,ds:data
begin:
mov ax,data
mov ds,ax
mov al,num
rol al,1
jc L1
mov al,00h
jmp L2
L1: mov al,0ffh
L2: mov posneg,al
mov ah,4ch
int 21h
code ends
end begin
