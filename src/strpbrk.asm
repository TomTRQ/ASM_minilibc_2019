section .text
    global strpbrk:function
    ; char *strpbrk(const char *s, const char *accept);

strpbrk:
        ; rdi = s
        ; rsi = accept

    mov rax, rdi                ;On met le premier argument dans le registre de retour
    mov rbx, rsi                ;On met le second argument dans un registre temporaire

.start:
    xor dil, dil
    mov rsi, rbx                ;On remet le registre rsi à sa valeur de départ
    cmp BYTE [rax], 0x0
    jz .end
    inc rax
    jmp .check_loop
    
.check_loop:
    cmp BYTE [rsi], 0x0
    jz .start
    mov dil, BYTE [rsi]
    cmp BYTE [rax], dil
    jz .end
    inc rsi
    jmp .check_loop

.end:
    ret