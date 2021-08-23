        global start
        extern _printf

        section .text
start:
        mov rdi, format
        mov rsi, 10
        mov rdx, 5
        mov rcx, 5
        call _printf
        mov rax, 0x02000001
        xor rdi, rdi
        syscall
        
        section .data
format:   
        db      "sum = %d, i = %d, j = %d", 10, 0
