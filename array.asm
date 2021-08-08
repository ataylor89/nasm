        global start
        section .text
start:
        mov al, 0
        mov rdx, output
        mov rcx, arr
L:
        mov r8b, [rcx]
        mov [rdx], r8b
        inc al
        inc rdx
        inc rcx
        cmp al, 10
        jl L 
newline:
        mov byte [rdx], 10
        inc rdx        
write:
        mov rax, 0x02000004
        mov rdi, 1
        mov rsi, output
        mov rdx, size
        syscall
        mov rax, 0x02000001
        xor rdi, rdi
        syscall

        section .data
arr:
        db      '0'
        db      '1'
        db      '2'
        db      '3'
        db      '4'
        db      '5'
        db      '6'
        db      '7'
        db      '8'
        db      '9'
    
        section .bss
output  resb    20
size    equ     20
