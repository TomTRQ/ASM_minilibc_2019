BITS 64

section .text
    global strstr:function
    ; char *strstr(char *fullString, char * subString);

strstr:
    ; rdi = fullString
    ; rsi = subString

    enter 0, 0
    mov rax, rdi
    mov rbx, rsi            ;Garder tous les caractères de la string
    xor r8b, r8b            ;Registre temporaire pour le caractère
    jmp .start

.back_to_start:
    inc rax
    jmp .start

.start:
    cmp BYTE [rax], 0x0
    jz .not_found

    mov r8b, BYTE [rax]
    cmp BYTE [rsi], r8b     ;Si un caractère est égal au 1er caractère
    jz .compare_char

    inc rax
    mov rdi, rax            ;On remet rdi égal à rax
    mov rbx, rsi            ;On remet rbx à la valeur de la subString
    jmp .start

.compare_char:
    cmp BYTE [rbx], 0x0     ;On a trouvé une correspondance
    jz .end
    cmp BYTE [rdi], 0x0     ;La string restante est plus courte que la substring
    jz .not_found

    mov r8b, BYTE [rdi]
    cmp BYTE [rbx], r8b     ;On regarde si le caractère est égal
    jne .back_to_start
    inc rdi
    inc rbx
    jmp .compare_char

.not_found:
    mov rax, 0
    leave
    ret

.end:
    leave
    ret