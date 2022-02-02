initds macro
mov ax,@data
mov ds,ax
endm
init8255 macro
mov al,cw
mov dx,cr
out dx,al
endm
inpa macro
mov ax,pa
in al,dx
endm
outpc macro
mov dx,pc
out dx,al
endm
disp_msg macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.stack
.data
pa equ 0dc50h
pb equ 0dc51h
pc equ 0dc52h
cr equ 0dc53h
cw db 90h
m1 db 10,13,"ENTERED KEY IS $"
m2 db 10,13,"ROW NO IS $"
m3 db 10,13,"COL NO IS$"
m4 db 10,13,"press any key from kb interface$"
row db ?
col db ?
.code
initds
init8255
disp_msg m4
start: mov al,80h
mov row,1
mov col,1
mov ch,0
mov bl,3
nextrow: rol al,1
mov bh,al
outpc
mov cl,8
inpa
nextcol: ror al,1
jc display
inc ch
inc col
dec cl
jnz nextcol
mov col,1
inc row
mov al,bh
dec bl
jnz nextrow
start1:jmp start
display: disp_msg m1
mov dl,ch
cmp dl,0ah
jc digit
add dl,07h

digit: add dl,30h
call disp_char
add row,30
add col,30
disp_msg m2
mov dl,row
call disp_char
disp_msg m3
mov dl,col
call disp_char

mov ah,4ch
int 21h

disp_char proc
mov ah,02h
int 21h
ret
disp_char endp
end
