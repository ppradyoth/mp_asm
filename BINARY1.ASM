data segment
arr db 10h,20h,30h,40h,50h
key db 20h
len db ($-arr)
msg1 db 10,13,"key not found$"
msg2 db 10,13,"key found at position$"
res db ?,"$"
data ends
printf macro msg
lea dx,msg
mov ah,9ch
int 21h
endm
code segment
assume cs:code,ds:data
begin:
mov ax,data
mov ds,ax
mov al,key
mov bl,00h
mov cl,len
mov dh,00
again:  cmp bl,cl
        ja fail
        mov dl,bl
        add dl,cl
        shr dl,1
        mov si,dx
        cmp al,arr[si]
        je success
        ja high1
low1: mov cl,dl
      dec cl
      jmp again
high1: mov bl,dl
       inc bl
       jmp again
success: add dl,1
         add dl,'0'
         mov res,dl
         printf msg2
         printf res
         jmp finish
fail: printf msg1
finish: mov ah,4ch
int 21h
code ends
end begin
