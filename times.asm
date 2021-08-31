        global start
        extern _printf
        section .text
start:
        xor r9, r9
        mov r9, 0           ; array index
L:
        cmp r9, 10
        je summary
        mov r10, arr
        add r10, r9         ; address in array
        xor r11, r11
        mov byte r11b, [r10]
        mov rdi, format
        mov rsi, r11
        push r9
        call _printf
        pop r9
        inc r9
        jmp L        
summary:
        sub rsp, 8
        mov rdi, summarymsg
        call _printf
        add rsp, 8
        mov rax, 0x02000001
        xor rdi, rdi
        syscall

        section .data
arr         times   10    db    1
format      db      "%d", 10, 0 
summarymsg  db      "Finished printing the array", 10, 0           
