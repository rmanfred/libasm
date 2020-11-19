; ssize_t ft_write(int fildes, const void *buf, size_t nbyte);

section .text
global  _ft_write
extern  ___error           ; extern int * __error(void);

_ft_write:                 ; ssize_t ft_write(int rdi, const void *rsi, size_t rdx);
    mov     rax, 0x2000004 ; system call for write
    syscall                ; invoke operating system to do the write
    jc      _err           ; jump to error if CF = 1 (carry flag)
    ret                    ; return value is located in rax
_err:
    push    rax            ; save value in stack
    call    ___error       ; call extern function
    pop     r8             ; get the value saved in stack
    mov     [rax], r8      ; move the value to the value of ___error
    mov     rax, -1        ; return appropriate value if error appears
    ret
