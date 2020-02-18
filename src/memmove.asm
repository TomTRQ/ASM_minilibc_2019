BITS 64

section .text
    global memmove:function
    ; void *memmove(void *destination, const void *source, size_t size);

memmove:
    ; rdi = destination
    ; rsi = source
    ; rdx = size

    enter 0, 0
	xor rcx, rcx                    ;Initialisation d'un compteur
    xor bl, bl
	jmp .start

.add:
	inc rcx                         ;Incrémentation du compteur
    jmp .start

.start:
	cmp rcx, rdx                    ;Si size == compteur
	jz .fill_rdi_register_reverse
    movsx rbx, BYTE [rsi + rcx]     ;On met le caractère de rsi dans le registre rbx
	push rbx                        ;On envoie rbx dans la stack
	jmp .add

.fill_rdi_register_reverse:
	cmp rcx, 0
	je .end
	dec rcx                         ;On décrémente le compteur
	pop rbx                         ;On récupère rbx depuis la stack
	mov BYTE [rdi + rcx], bl
	jmp .fill_rdi_register_reverse

.end:
	mov rax, rdi
    leave
	ret