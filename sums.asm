        global start
        section .text
start: 
        mov r15, output
        mov r9, 0
L:
        mov r10, r9
LL:
        inc r10
        mov r11, arr
        mov r12, arr
        add r11, r9
        add r12, r10
        mov r13, [r11]
        add r13, [r12]
        mov r14, letters
        add r14, r13
        mov r14, [r14]
        mov [r15], r14
        inc r15
        cmp r9, 2
        je print
        cmp r10, 3
        je L
        jmp LL
print:
        mov rax, 0x02000004
        mov rdi, 1
        mov rsi, output
        mov rdx, 100
        syscall
        mov rax, 0x02000001
        xor rdi, rdi
        syscall       

        section .data
arr:
            db           1
            db           3
            db           4
            db           2
letters:
            db          '1'
            db          '2'
            db          '3'
            db          '4' 
            db          '5'
            db          '6'
            db          '7'
            db          '8'
            db          '9'
        section .bss
output  resb    100    
