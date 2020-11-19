; int strcmp(const char *s1, const char *s2);

section .text
global  _ft_strcmp               ; int strcmp(const char *rdi, const char *rsi);

_ft_strcmp:
    xor     rcx, rcx             ; i = 0
_loop_cmp:
    mov     dl, BYTE[rdi + rcx]  ; res1 = *s1
    mov     bl, BYTE[rsi + rcx]  ; res2 = *s2
    cmp     BYTE[rdi + rcx], 0   ; res1[i] == '\0'
    je      _return               ; res1[i] != '\0'
    cmp     BYTE[rsi + rcx], 0   ; res2[i] == '\0'
    je      _return               ; res2[i] != '\0'
    cmp     dl, bl               ; res1[i] ?= res2[i]
    jnz     _return               ; res1[i] != res2[i]
    inc     rcx                  ; i++
    jmp     _loop_cmp             ; again
_return:
    movzx   rax, dl              ; mov res1 to rax (move zero extension)
    movzx   rbx, bl              ; mov res2 to rbx (copy byte to reg)
    sub     rax, rbx             ; sub res1 - res2
    ret

; int	ft_strncmp(const char *s1, const char *s2)
; {
; 	unsigned char	*res1;
; 	unsigned char	*res2;
; 	unsigned int	i;

; 	res1 = (unsigned char *)s1;
; 	res2 = (unsigned char *)s2;
; 	i = 0;
; 	while (res1[i] != '\0' || res2[i] != '\0')
; 	{
; 		if (res1[i] != res2[i])
; 			return (res1[i] - res2[i]);
; 		i++;
; 	}
; 	return (res1[i] - res2[i]);
; }