        global start
        section .text
start:
        mov r9, 0
L:
        cmp r9, n
        je sum
        mov r10, r9
L2:
        inc r10
        mov rbx, digits
        mov rcx, digits
        add rbx, r9
        add rcx, r10
        mov r11, [rbx]
        add r11, [rcx]
        mov r12, '1'
        cmp r11, s
        je sum
        mov r12, '0'
        cmp r10, n
        jne L2
        inc r9
        jmp L
sum:
        mov rbx, letters
        mov rcx, letters
        add rbx, r9
        add rcx, r10
        mov rbx, [rbx]
        mov rcx, [rcx]
        mov rsi, output
        mov byte [rsi], bl
        mov byte [rsi+1], cl
        mov byte [rsi+2], r12b
        mov byte [rsi+3], 10
        mov rax, 0x02000004
        mov rdi, 1
        mov rdx, 10
        syscall
        mov rax, 0x02000001
        xor rdi, rdi
        syscall        
    
        section .data
digits:     db      0,
            db      1,
            db      2,
            db      3,
            db      4,
            db      5,
            db      6,
            db      7,
            db      8,
            db      9
letters:    db      '0',
            db      '1',
            db      '2',
            db      '3',
            db      '4',
            db      '5',
            db      '6',
            db      '7',
            db      '8',
            db      '9'
        section .bss
s           equ     9
n           equ     10 
output      resb    10
