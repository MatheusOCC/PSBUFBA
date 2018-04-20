;Compara se duas strings são iguais

%include "io.inc"


section .data

string1 db "Roberto de Cerqueira", 0ah 
strlen equ $-string1

string2 db "Roberto de Cerqueira", 0ah

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
    mov esi, string1
    mov edi, string2
    mov ecx, strlen
    
    repe cmpsb
    
    je igual
    jne diferente
    
    
    igual: 
    
    PRINT_STRING "Sao iguais"
    
    ret
    
    diferente:
    
   
    PRINT_STRING "Sao diferentes"
   
    ret