        global start
        extern _printf

        section .text
start:
        mov rdi, message
        call _printf
        mov rax, 0x02000001
        xor rdi, rdi
        syscall

        section .data
message:     
        db      "Hello sky", 10, 0
    
        
