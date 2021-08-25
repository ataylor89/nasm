        global start
        extern _printf        

        section .text
start:
        mov r8, 5
        mov r9, 1
factorial:
        imul r9, r8
        dec r8
        cmp r8, 1
        je print
        jne factorial
print:
        sub rsp, 8
        mov rdi, message
        mov rsi, 10
        mov rdx, r9
        call _printf
        mov rax, 0x02000001
        xor rdi, rdi
        syscall

        section .data
message:
        db  "%d! = %d", 10, 0    
