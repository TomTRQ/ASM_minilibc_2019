BITS 64

section .text
    global my_strcspn:function
    ; size_t strcspn(const char *string, const char *rejectedCharacters);

my_strcspn:
        ;rdi = string
        ;rsi = rejectedCharacters

.start:


.end:
    ret