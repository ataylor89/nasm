        global start
        extern _puts
        
        section .text
start:
        sub rsp, 8              ; the call function doesn't know how much to adjust the stack pointer, because it doesn't know how much data is on the stack
        mov rdi, message        ; move the address of our message to register rdi
        call _puts              
        add rsp, 8
        mov rax, 0x02000001
        xor rdi, rdi
        syscall

        section .data
message:
        db  "This is a call to puts", 0
