        global start
        global func
        extern _printf
        section .text
start:
        mov rcx, message
        push rcx
func:
        pop rdi
        sub rsp, 8
        call _printf
        mov rax, 0x02000001
        xor rdi, rdi
        syscall
        
        section .data
message: db "hello world, peace be unto you", 10, 0
