[org 0x7c00]

mov bp, 0x7c00
mov sp, bp

mov bx, TestString
call PrintString

jmp $
PrintString:
	push ax
	push bx

	mov ah, 0x0e
	.loop:
	cmp [bx], byte 0
	je .Exit
		mov al, [bx]
		int 0x10
		inc bx
		jmp .loop
	.Exit:
	ret

TestString:
	db 'The Quick Brown Fox Jumped Over the Lazy Dog 1234567890!?.'




times 510-($-$$) db 0

dw 0xaa55
