section .text
    global memset:function
    ; void *memset(void *pointer, int value, size_t count)

memset:
    ; rdi = pointer
    ; rsi = value
    ; rdx = count
    xor rcx, rcx

.start:
    cmp rcx, rdx
    jz .end

    ;mov BYTE [rdi + rcx], rsi
    inc rcx
    jmp .start

.end:
    mov rax, rdi
    ret