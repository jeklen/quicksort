# my quicksort
data segment
    a   DW 0003H, 0002H, 0009H, 0001H
ends

stack segment stack
    ST  DB  100 DUP(0)  
    TOP EQU 300
ends

code segment   
    assume cs:code, ds:data, ss:stack
start:
    mov ax, data
    mov ds, ax
    mov ax, stack
    mov ss, ax
    mov sp, TOP
    
	mov si, offset a
	mov di, 6
    call quicksort
mov ax, 4c00h
int 21h   
    
quicksort proc near
	;partition ==> q
	cmp si, di
	jnb end_quicksort
	push si
	push di
	call partition
	pop di
	pop si
	
	cmp bx, 0
	je quick2
	push di
	push bx
	push si
	mov di, bx
	sub di, 2
	call quicksort
	pop si
	pop bx
	pop di   
	
  quick2:
	push si
	push bx
	push di
	mov si, bx
	add si, 2
	call quicksort
	pop di
	pop bx
	pop si
	
	end_quicksort:
		RET
quicksort endp

partition proc near
	; a, si, di
	push ax
	push si
	
	
	mov bx, si
	mov cx, di
	sub cx, si
	SHR cx, 1
  s:	
    mov ax, [di]
	cmp ax, [bx]
	jb exchange
	mov ax, [bx]
	push [si]
	pop [bx]
	mov [si], ax
	add si, 2
	;change [bx] with [si]
  exchange:	
	add bx, 2 
	loop s 
	;exchange [si] with [di]
	mov ax, [di]
	push [si]
	pop [di]
	mov [si], ax	;now si is the place of the partition place
	mov bx, si
	
	
	pop si
	pop ax
	RET
partition endp

ends

end start
