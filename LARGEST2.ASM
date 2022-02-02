data segment
array dw 10h,20h,78h,23h,13h
cnt dw ($-array)
largest dw ?
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
    ja large
    mov ax,array[si]
large: mov largest,ax
       loop n1
mov ax,largest
mov ah,4ch
int 21h
code ends
end begin
