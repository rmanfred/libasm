; char * strdup(const char *s1);

section .text
global  _ft_strdup              ; char * strdup(const char *rdi);
extern  _ft_strlen
extern  _ft_strcpy
extern  _malloc                 

_ft_strdup:
    call    _ft_strlen          ; to find malloc size
    add     rax, 1              ; + 1 for '\0'
    push    rdi                 ; save value of rdi in stack
    mov     rdi, rax            ; set len of rdi to malloc call
    call    _malloc             ; call malloc to save in rax
    pop     r8                  ; get the value of rdi, but we need rdi further
    mov     rdi, rax            ; rdi is used further in ft_strcpy
    mov     rsi, r8             ; rsi is used further in ft_strcpy
    call    _ft_strcpy          ; call ft_strcpy
    ret

; char	*ft_strdup(const char *s)
; {
; 	int		i;
; 	char	*str;

; 	i = 0;
; 	if (!(str = (char*)malloc(sizeof(char) * (ft_strlen(s) + 1))))
; 		return (NULL);
; 	while (s[i])
; 	{
; 		str[i] = s[i];
; 		i++;
; 	}
; 	str[i] = '\0';
; 	return (str);
; }