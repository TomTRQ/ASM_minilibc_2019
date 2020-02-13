section .text
    global my_strlen:function
    ; size_t strlen(const char *str);

my_strlen:
    ; rdi = s
    mov rax, rdi                    ;On bouge le 1er argument de strlen dans le registre rax

.start:
    cmp BYTE [rax], 0x0             ;On compare le 1er caractere de rax avec \0
    jz .end                         ;Si égal on va au label end
    inc rax                         ;Sinon on incrémente le pointeur de rax
    jmp .start                      ;On repart dans la boucle
.end:
    sub rax, rdi                    ;On soustrait l'adresse de rax à celle de notre 1er argument
    ret                             ;On renvoie rax, la valeur de retour