    global start
    extern _printf
    section .text
start:
    mov rax, 10
    mov rbx, 20
    mov rcx, 30
    push rax
    push rbx
    push rcx
    mov rdi, message
    pop rsi
    pop rdx
    pop rcx
    call _printf
    mov rax, 0x02000001
    xor rdi, rdi
    syscall
    section .data
message:    db  "Numbers from the stack: %d %d %d", 10, 0
