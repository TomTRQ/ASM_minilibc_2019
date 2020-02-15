BITS 64

section .text
    global strcspn:function
    ; size_t strcspn(const char *string, const char *rejectedCharacters);

strcspn:
        ;rdi = string
        ;rsi = rejectedCharacters

    xor rax, rax
    mov rbx, rsi
    jmp .start

.start:
    xor ch, ch
    mov rsi, rbx
    cmp BYTE [rdi], 0x0
    jz .end
    jmp .check_loop

.char_not_found:
    inc rax
    inc rdi
    jmp .start

.check_loop:
    cmp BYTE [rsi], 0x0
    jz .char_not_found
    
    mov ch, BYTE [rsi]
    cmp BYTE [rdi], ch
    jz .end
    inc rsi
    jmp .check_loop

.end:
    ret