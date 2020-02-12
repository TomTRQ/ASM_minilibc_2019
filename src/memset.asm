section .data
    text db "TEST"

section .text
    global memset:function
    ; void *memset(void *pointer, int value, size_t count)

memset:
    ; rdi = pointer
    ; oui = value
    ; non = count
    mov rcx, 0

.start:
    cmp rcx, non
    jz .end

    mov BYTE [rdi], oui
    inc rcx
    inc rdi
    jmp .start

.end:
    ret