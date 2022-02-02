.model small
.stack
.data
pa equ 0dc50h
pb equ 0dc51h
pc equ 0dc52h
cr equ 0dc53h
cw db 80h
.code
mov ax,@data
mov ds,ax
mov al,cw
mov dx,cr
out dx,al
mov al,01h
mov cx,16h
up: mov dx,pa
out dx,al
call delay
rol al,01
xor al,01h
loop up
mov ah,4ch
int 21h
delay proc
push cx
push bx
mov cx,0ffffh
up2: mov bx,0ffffh
up1: nop
dec bx
jne up1
loop up2
pop bx
pop cx
ret
delay endp
end
