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

mov al,0h
up: mov dx,pa
out dx,al
call delay
add al,01h
daa
cmp al,09h
jne up
down: mov dx,pa
out dx,al
call delay
sub al,01h
das
cmp al,00h
jne down

delay proc
push cx
push bx
mov cx,0ffffh
up2: mov bx,0ffffh
up1: nop
dec bx
jnz up1
loop up2
pop bx
pop cx
ret
delay endp
mov ah,4ch
int 21h
end
