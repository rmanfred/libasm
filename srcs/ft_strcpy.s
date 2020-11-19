; char *strcpy(char * dst, const char * src);

section .text
global  _ft_strcpy              ; char *strcpy(char * rdi, const char * rsi);

_ft_strcpy:
    xor     rcx, rcx            ; i = 0;
_loop_cpy:
    cmp     BYTE[rsi + rcx], 0  ; src[i] == 0
    je      _return              ; if src[i] == 0 -> return
    mov     dl, BYTE[rsi + rcx] ; tmp = src[i]
    mov     BYTE[rdi + rcx], dl ; dst[i] = tmp
    inc     rcx                 ;i++
    jmp     _loop_cpy            ; again
_return: 
    mov     BYTE[rdi + rcx], 0  ; dst[i] = '\0'
    mov     rax, rdi            ; return rdi by moving to rax
    ret
; char	*ft_strcpy(char *dst, const char *src)
; {
; 	unsigned int i;

; 	i = 0;
; 	while (src[i] != '\0')
; 	{
; 		dst[i] = src[i];
; 		i++;
; 	}
;   dst[i] = '\0'
; 	return (dst);
; }