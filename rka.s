section .data
    num1 dd 10
    num2 dd 20
    result_msg db "The result is: ", 0
    newline db 10, 0

section .bss
    result_buffer resb 10

section .text
    global _start

_start:
    mov eax, [num1]
    add eax, [num2]
    
    mov edi, result_buffer
    call int_to_string

    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 14
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, result_buffer
    mov edx, 10
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    
    mov eax, 1
    xor ebx, ebx
    int 0x80

int_to_string:
    add edi, 9
    mov byte [edi], 0
    mov ebx, 10
    
.convert_loop:
    dec edi
    xor edx, edx
    div ebx
    add dl, '0'
    mov [edi], dl
    test eax, eax
    jnz .convert_loop
    ret
