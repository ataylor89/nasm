        global start
        extern _printf
        
        section .text
start:
        mov rdi, format
        mov rsi, 7
        xor rax, rax                
        call _printf
        mov rax, 0x02000001
        xor rdi, rdi
        syscall

        section .data
format: db "There are %d days in a week", 10, 0

   
