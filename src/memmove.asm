BITS 64

section .text
    global my_memmove:function
    ; void *memmove(void *destination, const void *source, size_t size);

my_memmove:
        ;rdi = destination
        ;rsi = source
        ;edx = value

.start:

.end:
    ret