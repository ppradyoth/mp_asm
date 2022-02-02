data segment
a dw 20h
b dw 10h
sum dw ?
diff dw ?
avg dw ?
data ends
code segment
assume cs:code,ds:data
begin:
mov ax,data
mov ds,ax
mov ax,a
mov bx,a
add ax,b
mov sum,ax
mov cx,sum
ror ax,1
mov avg,ax
sub bx,b
mov diff,bx
mov ah,4ch
int 21h
code ends
end begin




