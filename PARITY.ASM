initds macro
mov ax,@data
mov ds,ax
endm
init8255 macro
mov al,cw
mov dx,cr
out dx,al
endm
inpb macro
mov dx,pb
in al,dx
endm
outpa macro
mov dx,pa
out dx,al
endm
exit macro
mov ah,4ch
int 21h
endm
.model small
.stack
.data
pa equ 0dc50h
pb equ 0dc51h
pc equ 0dc52h
cr equ 0dc53h
cw db 82h
.code
initds
init8255
inpb
mov bl,al
mov bh,0h
mov cx,08h
nb:rol al,1
jnc next
inc bh
next: loop nb
mov al,bl
or al,bl
jpe dispff
mov al,00h
disp: outpa
call delay
mov al,bh
outpa
exit
dispff: mov al,0ffh
jmp disp

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
end


