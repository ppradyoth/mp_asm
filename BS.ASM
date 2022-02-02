printf macro msg
lea dx,msg
mov ah,09h
int 21h
endm

data segment
arr dB 10h,20h,40h,81h
len db ($-arr)
key equ 20h
msg1 db 10,13,"key not found$"
msg2 db 10,13,"key found at $"
res db ?,"$"
data ends
code segment
assume cs:code,ds:data
begin:
mov ax,data
mov ds,ax
lea si,arr
mov al,key
mov bl,00h
mov dh,00h
mov cl,len

;dec cl
again: cmp bl,cl
ja fail
mov dl,bl
add dl,cl
shr dl,1
mov si,dx
cmp al,arr[si]
je found
ja high1

low1: mov cl,dl
dec cl
jmp again

high1: mov bl,dl
inc bl
jmp again

found: add dl,1
add dl,'0'
mov res,dl
printf msg2
printf res
jmp finish

fail: printf msg1

finish:mov ah,4ch
int 21h
code ends
end begin
