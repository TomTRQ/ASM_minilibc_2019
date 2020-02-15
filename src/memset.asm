BITS 64

section .text
    global memset:function
    ; void *memset(void *pointer, int value, size_t count)

memset:
    ; rdi = pointer
    ; sil = value
    ; rdx = count

    xor rcx, rcx                    ;On initialise une valeur à 0

.start:
    cmp rcx, rdx                    ;On compare rcx avec le count
    jz .end                         ;Si égal on va à la fin du programme

    mov BYTE [rdi + rcx], sil       ;Sinon on ajoute le caractère
    inc rcx                         ;On incrémente la valeur
    jmp .start                      ;On repart au début

.end:
    mov rax, rdi                    ;On déplace notre pointer dans rax pour le renvoyer
    ret                             ;On quitte le programme en renvoyant rax