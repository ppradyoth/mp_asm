data segment
string db 'HELLO WORLD!',13,10,'$'
data ends
code segment
assume cs:code,ds:data
start:
mov ax,ds
mov ds,ax
lea dx,string
mov ah,9
int 21h
mov ah,4ch
int 21h
code ends
end start
