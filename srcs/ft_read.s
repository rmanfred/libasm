; ssize_t read(int fildes, void *buf, size_t nbyte);

section .text
global  _ft_read
extern  ___error            ; extern int * __error(void);

_ft_read:                   ; ssize_t read(int rdi, void *rsi, size_t rdx);
    mov     rax, 0x2000003  ; system call for read
    syscall                 ; invoke operating system to do the read
    jc      _err            ; jump to error if CF = 1 (carry flag)
    ret                     ; return value is located in rax
_err:  
    push    rax             ; save the value of rax
    call    ___error        ; call error
    pop     r8              ; pop rax
    mov     [rax], r8       ; what was before in rax goes back to rax
    mov     rax, -1         ; return appropriate value if error appears 
    ret