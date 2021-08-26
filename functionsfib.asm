        global start
        global func
        extern _printf
start:
        call func
fib:
        mov rdi, fibnum
        mov rsi, 0,
        mov rdx, 1
        call _printf
        mov rdi, fibnum
        mov rsi, 1
        mov rdx, 1
        call _printf
        xor rax, rax
        xor rbx, rbx
        xor rcx, rcx
        xor r9, r9
        mov rax, 1
        mov rbx, 1
        mov r9, 2
L:
        cmp r9, 10
        je func2
        mov rcx, rax
        add rcx, rbx
        mov rdi, fibnum
        mov rsi, r9
        mov rdx, rcx
        push rax
        push rbx
        push rcx
        push r9
        call _printf
        pop r9
        pop rcx
        pop rbx
        pop rax
        mov rax, rbx
        mov rbx, rcx
        inc r9
        jmp L        
func:    
        sub rsp, 8 
        mov rdi, message
        call _printf
        add rsp, 8
        ret
func2:
        mov rdi, fibmsg
        call _printf
        mov rax, 0x02000001
        xor rdi, rdi
        syscall

        section .data
message: db     "hello world", 10, 0 
fibmsg:  db     "printed fibonacci numbers", 10, 0
fibnum:  db     "F(%d) = %d", 10, 0
