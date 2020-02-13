section .text
    global my_memcpy:function
    ; void *memcpy(void *destination, const void *source, size_t size);

my_memcpy:
    ; rdi = pointer
    ; rsi = value
    ; rdx = count

    xor rcx, rcx                                ;On initialise une valeur à 0
    xor bh, bh

.start:
    cmp rcx, rdx                                ;On compare rcx avec le count
    jz .end                                     ;Si égal on va à la fin du programme

    mov bh, BYTE [rsi + rcx]
    mov BYTE [rdi + rcx], bh      ;Sinon on ajoute le caractère
    inc rcx                                     ;On incrémente la valeur
    jmp .start                                  ;On repart au début

.end:
    mov rax, rdi                                ;On déplace notre pointer dans rax pour le renvoyer
    ret                                         ;On quitte le programme en renvoyant rax