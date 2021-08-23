        global start
        section .text
start:
        mov r9, 0
        mov r10, letters
        mov r11, output
L:
        mov r12b, [r10]
        mov [r11], r12b
        inc r9
        inc r10
        inc r11
        cmp r9, 10
        je print
        jmp L
print:
        mov byte [r11], 10
        mov rax, 0x02000004
        mov rdi, 1
        mov rsi, output
        mov rdx, 20
        syscall
        mov rax, 0x02000001
        xor rdi, rdi
        syscall
 
        section .data
letters:
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
