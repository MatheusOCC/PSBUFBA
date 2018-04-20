;Retorna o tamanho de uma string

%include "io.inc"


section .data

string1 db "Roberto de Cerqueira", 0ah 




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


    mov edi, string1
  
    diferente:
    
    cmp byte [edi], 0ah
    
    je fim
    
    inc cx
    inc edi
    
    jmp diferente
    
    fim:
    
    PRINT_DEC 1, cx
    
    ret
    