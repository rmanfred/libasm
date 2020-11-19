; size_t strlen(const char *s);

section .text
global  _ft_strlen

_ft_strlen:                     ; size_t strlen(const char *rdi);
    xor     rax, rax            ; index = 0
_loop_len:
    cmp     BYTE[rdi + rax], 0  ; compare str[index] == '\0'
    je      _return              ; jump to return - return rax
    inc     rax                 ; index++
    jmp     _loop_len            ; do the loop again
_return:
    ret

; int		ft_strlen(char *str)
; {
; 	int	index;

; 	index = 0;
; 	while (str[index] != '\0')
; 		index++;
; 	return (index);
; }