    global start
    extern maxofthree
    extern _printf
    section .text
start:
    mov rdi, 10
    mov rsi, 5
    mov rdx, 20
    call maxofthree
    mov rdi, message
    mov rsi, rax
    call _printf
    mov rax, 0x02000001
    xor rdi, rdi
    syscall
    section .data
message:    db  "The max is %d", 10, 0
