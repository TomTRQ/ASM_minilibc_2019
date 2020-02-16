BITS 64

section .text
    global strcasecmp:function
    ; int strcasecmp(const char *s1, const char *s2);

strcasecmp:
        ; rsi = s1
        ; rdi = s2
	jmp .start

.add:
	inc rdi
	inc rsi

.start:
	mov bl, BYTE [rdi]
	mov dl, BYTE [rsi]

	cmp bl, 0x0
	je .end
	cmp bl, 0x0
	je .end

	cmp bl, 'A'         ;Si bl plus petit que 'A'
	jl .not_upper
	cmp bl, 'Z'         ;Si bl plus grand que 'Z'
	jg .not_upper
	add bl, 32			;bl en minuscule

.not_upper:
	cmp dl, 'A'         ;Si dl plus petit que 'A'
	jl .check_if_end
	cmp dl, 'Z'         ;Si dl plus grand que 'Z'
	jg .check_if_end
	add dl, 32

.check_if_end:
	cmp bl, dl          ;Si bl égal à dl
	je .add
    jmp .end

.end:
    sub bl, dl 
    movsx rax, bl
	ret