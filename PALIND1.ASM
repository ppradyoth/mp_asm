printf macro msg
lea dx,msg
mov ah,09h
int 21h
endm
data segment
block1 db "neven$"
m1 db "IT IS A PALINDROME$"
m2 db "IT IS NOT A PALINDROME$"
data ends
extra segment
block2 db 5 dup(?)
extra ends
code segment
assume cs:code,ds:data,es:extra
begin:
mov ax,data
mov ds,ax
mov ax,extra
mov es,ax
lea si,block1
lea di,block2+4
mov cx,05h
back: cld
      lodsb
      std
      stosb
      loop back
lea si,block1
lea di,block2
mov cx,05h
cld
repz cmpsb
jnz skip
printf m1
skip: printf m2
code ends
end begin

         
