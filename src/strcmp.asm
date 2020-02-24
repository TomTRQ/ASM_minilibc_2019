BITS 64

section .text
    global strcmp:function
    ; int strcmp(const char *first, const char *second);

strcmp:
        ; rdi = first
        ; rsi = second

    enter 0, 0
    xor cl, cl
    xor dl, dl
.start:
    cmp dl, cl
    jne .end
    add dl, BYTE [rdi]
    add cl, BYTE [rsi]
    cmp BYTE [rdi], 0
    jz .end
    cmp BYTE [rsi], 0
    jz .end
    inc rdi
    inc rsi
    jmp .start

.end:
    sub dl, cl
    movsx rax, dl
    leave
    ret