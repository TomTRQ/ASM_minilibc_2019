BITS 64

section .text
    global memcpy:function
    ; void *memcpy(void *destination, const void *source, size_t size);

memcpy:
    ; rdi = pointer
    ; rsi = value
    ; rdx = count

    enter 0, 0
    xor rcx, rcx                                ;On initialise une valeur à 0
    xor bh, bh                                  ;On initialise un registre tampon

.start:
    cmp rcx, rdx                                ;On compare rcx avec le count
    jz .end                                     ;Si égal on va à la fin du programme

    mov bh, BYTE [rsi + rcx]                    ;Sinon on met la valeur de l'index actuel
    mov BYTE [rdi + rcx], bh                    ;On ajoute le caractère à rdi
    inc rcx                                     ;On incrémente la valeur
    jmp .start                                  ;On repart au début

.end:
    mov rax, rdi                                ;On déplace notre registre dans rax pour le renvoyer
    leave
    ret                                         ;On quitte le programme en renvoyant rax