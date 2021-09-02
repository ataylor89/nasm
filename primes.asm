        global start
        extern _printf
        section .text
start:
        mov r9, primes          ; address of primes array, which stores the sieve of Eratosthenes for n primes
        mov byte [r9], 0        ; 0 is not a prime
        mov byte [r9+1], 0      ; 1 is not a prime
        mov r10, 1              ; index = 1
L:  
        inc r10
        cmp r10, 100            ; when index equals 100 jump to print
        je print                         
        mov r11, r10            ; r11 will store a secondary index for multiples of primes
LL:
        add r11, r10            
        cmp r11, 100            ; our primes array has size 100
        jge L
        mov r12, primes         ; r12 will point to a multiple of a prime
        add r12, r11            ; r12 points to a multiple of a prime
        mov byte [r12], 0       ; the multiple of a prime is not a prime
        jmp LL
print:
        xor r10, r10
        mov r10, 1
printloop:
        inc r10
        cmp r10, 100             ; print the first 100 elements in our array
        je summary
        xor rdx, rdx
        mov rdi, primesmsg
        mov rsi, r10
        mov dl, [r9+r10]
        push r9
        push r10
        sub rsp, 8
        call _printf
        add rsp, 8
        pop r10
        pop r9
        jmp printloop
summary:
        sub rsp, 8
        mov rdi, summarymsg
        mov rsi, 100
        call _printf
        mov rax, 0x02000001
        xor rdi, rdi
        syscall        

        section .data
primes  times   100     db      1
primesmsg:              db      "P(%d): %d",10,0    
summarymsg:             db      "Printed the first %d primes", 10, 0
