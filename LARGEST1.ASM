data segment
array db 10h,40h,30h,69h,20h
cnt db $-array
msg db 10,13,"the largest is"
large db ?
largest db ?,"$"
data ends
code segment
assume cs:code,ds:data
begin:
mov ax,data
mov ds,ax
lea si,array
mov cl,cnt
mov al,array[si]
repeat: inc si
        cmp al,array[si]
        ja largest1
        mov al,array[si]
largest1: mov large,al
          loop repeat
lea dx,msg
mov ah,9h
int 21h
mov dl,large
add dl,'0'
lea dx,largest
mov ah,9h
int 21h
mov ah,4ch
int 21h
code ends
end begin




