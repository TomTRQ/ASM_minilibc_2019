BITS 64

section .text
    global strncmp:function
    ; int strcmp(const char *first, const char *second, int value);

strncmp:
        ; rdi = first
        ; rsi = second
        ; edx = value

    xor cl, cl
    xor r8b, r8b
.start:
    cmp BYTE [rdi], 0                   ;On regarde si l'index de la première string est nulle
    jz .end
    cmp BYTE [rsi], 0                   ;On regarde si l'index de la 2eme string est nulle
    jz .end
    cmp edx, 0                          ;On regarde si notre value est égale à 0
    jz .end
    cmp r8b, cl                         ;On regarde si les deux caractères sont égaux                 
    jne .end                            ;Si non on renvoie la différence dans .end

    add r8b, BYTE [rdi]                 ;On ajoute à notre valeur r8b le caractere
    add cl, BYTE [rsi]                  ;On ajoute à notre valeur cl le caractere
    inc rdi                             ;On incrémente l'index de notre string 1          
    inc rsi                             ;On incrémente l'index de notre string 2
    sub edx, 1                          ;value = value -1
    jmp .start                          ;Rappel de la fonction .start

.end:
    sub r8b, cl                         ;On soustrait les deux valeurs
    movsx rax, r8b                      ;On bouge le résultat dans le registre de retour
    ret