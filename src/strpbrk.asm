BITS 64

section .text
    global strpbrk:function
    ; char *strpbrk(const char *s, const char *accept);

strpbrk:
        ; rdi = s
        ; rsi = accept

    mov rax, rdi                ;On met le premier argument dans le registre de retour
    mov rbx, rsi                ;On met le second argument dans un registre temporaire

.start:
    xor ch, ch
    mov rsi, rbx                ;On remet le registre rsi à sa valeur de départ
    cmp BYTE [rax], 0x0
    jz .not_found
    inc rax
    jmp .check_loop
    
.check_loop:
    cmp BYTE [rsi], 0x0
    jz .start
    mov ch, BYTE [rsi]
    cmp BYTE [rax], ch
    jz .end
    inc rsi
    jmp .check_loop

.not_found:
    mov rax, 0
    ret

.end:
    ret