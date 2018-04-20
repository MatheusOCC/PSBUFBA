%include "io.inc"


section .data

string1 db "Roberto de Cerqueira", 0ah 
strlen equ $-string1



section .bss

 string2 resb 80


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
    mov esi, string1
    mov edi, string2
    mov al, ' '
    diferente:
    
    cmp byte [esi], 0ah
    
    je fim
    
    movsb 
   
    cmp byte [esi], al
  
    je igual
    jne diferente
    
    
    igual: 
    
    inc esi
    
    jmp diferente
    
    fim:
    
    PRINT_STRING string2
    
    ret
    