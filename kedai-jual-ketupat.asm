section .data
ketupatBarang db 10;

section .bss
bayarKetupat resb 1;
jualKetupat resb 1;

section .text
global _start:

_start:

mov rdi, menu
call display
mov rdi, prompt
call display
mov getInput
movzrx rax, byte [inputBuffer]

beliKetupat:


takCukupStock:


jualKetupat:


_exit:

mov rax, 60
xor edi, edi
syscall

displayString:


getInput:


stringtoInt:
xor rax, rax
xor rcx, rcx


.done:
ret





section .data
menu db "Selamat Datang ke Kedai Ketupat!",0xa,"1.Nk beli ketupat",0xa,"2.Jual Ketupat",0xa,"Pilihan mu: ",0xa
prompt db "Sila beri pilihan ikuti nombor:",0
pilihBeli db "Berapakah nk beli:",0
pilihJual db "Berapakah nk jual:",0
transaksiBeli db "Ketupat dibeli!",0
transaksiJual db "Ketupat dijual!",0

