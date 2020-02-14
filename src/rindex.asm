section .text
    global my_rindex:function
    ; char *rindex(const char *s, int c);

my_rindex:
        ; rdi = s
        ; sil = c

.start:
    cmp BYTE [rdi], 0
    jz .end
    cmp BYTE [rdi], sil
    jz .add

    inc rdi
    jmp .start

.add:
    mov rax, rdi
    inc rdi
    jmp .start

.end:
    ret