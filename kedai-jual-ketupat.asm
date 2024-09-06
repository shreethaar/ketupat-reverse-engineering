section .data
ketupatBarang db 10
flag db "CTF{K3tup4t_S3l4lu_Cukup}", 0
section .bss
bayarKetupat resb 1
jualKetupat resb 1
inputBuffer resb 2

section .text
global _start

_start:
    mov rdi, menu
    call displayString
    
    mov rdi, prompt
    call displayString
    
    call getInput
    movzx rax, byte [inputBuffer]
    
    cmp al, '1'
    je beliKetupat
    cmp al, '2'
    je jualKetupat
    jmp _exit

beliKetupat:
    mov rdi, pilihBeli
    call displayString
    call getInput
    call stringtoInt
    mov [bayarKetupat], al
    
    cmp al, 10
    jg takCukupStock
    
    mov rdi, transaksiBeli
    call displayString
    jmp _exit

takCukupStock:
    mov rdi, flag
    call displayString
    jmp _exit

jualKetupat:
    mov rdi, pilihJual
    call displayString
    call getInput
    call stringtoInt
    mov [jualKetupat], al
    
    mov rdi, transaksiJual
    call displayString
    jmp _exit

_exit:
    mov rax, 60
    xor edi, edi
    syscall

displayString:
    push rdi
    mov rax, 1
    mov rsi, rdi
    mov rdx, 0
    .countLoop:
        inc rdx
        inc rsi
        cmp byte [rsi], 0
        jne .countLoop
    pop rsi
    mov rdi, 1
    syscall
    ret

getInput:
    mov rax, 0
    mov rdi, 0
    mov rsi, inputBuffer
    mov rdx, 2
    syscall
    ret

stringtoInt:
    xor rax, rax
    xor rcx, rcx
    mov cl, [inputBuffer]
    sub cl, '0'
    mov al, cl
    .done:
    ret

section .data
menu db "Selamat Datang ke Kedai Ketupat!",0xa,"1.Nk beli ketupat",0xa,"2.Jual Ketupat",0xa,"Pilihan mu: ",0
prompt db "Sila beri pilihan ikuti nombor:",0
pilihBeli db "Berapakah nk beli:",0
pilihJual db "Berapakah nk jual:",0
transaksiBeli db "Ketupat dibeli!",0
transaksiJual db "Ketupat dijual!",0
