        global start
        section .text
start:
        mov r8b, 0
        mov rdx, output
L:
        mov byte [rdx], '*'
        inc rdx
        inc r8b
        cmp r8b, n
        jne L
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

        section .bss
n       equ     10
size    equ     20
output  resb    20
