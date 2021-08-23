        global start
        extern _puts
        
        section .text
start:
        sub rsp, 8
        mov rdi, message
        call _puts
        add rsp, 8
        mov rax, 0x02000001
        xor rdi, rdi
        syscall

        section .data
message:
        db  "This is a call to puts", 0
