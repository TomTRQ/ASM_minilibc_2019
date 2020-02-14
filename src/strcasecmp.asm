section .text
    global my_strcasecmp:function
    ; int strcasecmp(const char *s1, const char *s2);

my_strcasecmp:
        ; rsi = s1
        ; rdi = s2
	xor rcx, rcx            ;On initialise un compteur
	jmp .start

.add:
	cmp bl, 0
	je .end
	inc rcx

.start:
	mov bl, BYTE [rdi + rcx]
	mov dl, BYTE [rsi + rcx]
	cmp bl, 'A'         ;Si bl plus petit que 'A'
	jl .not_upper
	cmp bl, 'Z'         ;Si bl plus grand que 'Z'
	jg .not_upper
	add bl, 32
    jmp .start

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