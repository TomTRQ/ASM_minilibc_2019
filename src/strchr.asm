BITS 64

section .text
    global strchr:function
    ; char *strchr(char *str, char c)

strchr:
    ; rdi = str
    ; sil = c
    mov rax, rdi

.start:
    cmp BYTE [rax], 0x0
    jz .null_end
    cmp BYTE [rax], sil
    jz .end
    inc rax
    jmp .start

.null_end:
    mov rax, 0x0
    ret

.end:
    ret