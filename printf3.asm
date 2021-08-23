        global start
        extern _printf

        section .text
start:
        mov rdi, format
        mov rsi, 3
        mov rdx, 3
        mov rcx, 6
        call _printf
        mov rax, 0x02000001
        xor rdi, rdi
        syscall
    
        section .data
format:     db      "%d + %d = %d", 10, 0
