BITS 64

section .text
    global rindex:function
    ; char *rindex(const char *s, int c);

rindex:
        ; rdi = s
        ; sil = c

    enter 0, 0
    mov rax, 0
.start:
    cmp BYTE [rdi], sil
    jz .add
    cmp BYTE [rdi], 0
    jz .end

    inc rdi
    jmp .start

.add:
    mov rax, rdi
    inc rdi
    jmp .start

.end:
    leave
    ret