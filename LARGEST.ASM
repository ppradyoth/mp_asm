data segment
array dw 98h,23h,12h,55h,34h
cnt dw $-array
large dw ?
data ends
code segment
assume cs:code,ds:data
begin:
mov ax,data
mov ds,ax
lea si,array
mov cx,cnt
mov ax,array[si]
n1: inc si
cmp ax,array[si]
ja largest
mov ax,array[si]
largest: mov large,ax
loop n1
mov ax,large
mov ah,4ch
int 21h
code ends
end begin
