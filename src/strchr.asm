section .text
    global strchr:function
    ; char *strchr(char *str, char c)

strchr:
    ; rdi = str
    ; al = c
    mov rax, rdi

.start:
    cmp BYTE [rax], 0x0
    jz .end
    cmp BYTE [rax], al
    jz .end
    inc rax
    jmp .start

.end:
    ret