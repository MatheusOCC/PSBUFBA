%include "io.inc"


section .data

string1 db "Roberto de Cerqueira", 0ah 
strlen equ $-string1

string2 db "Roberto de Cerqueir", 0ah

section .bss

 


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor ecx, ecx

    xor esi, esi
    xor edi, edi

;GET_STRING string2, 32
    mov edi, string1
    mov al, 'e'
    diferente:
    
    cmp byte [edi], 0ah
    
    je fim
    
    
    inc edi
    
    cmp byte [edi], al
  
    je igual
    jne diferente
    
    
    igual: 
    
    inc cx
    
    jmp diferente
    
    fim:
    
    PRINT_DEC 1, cx
    
    ret
    