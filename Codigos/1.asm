;Recebe dois números no input, testa se são diferentes e diz qual o maior e o menor

%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
   ; xor eax, eax
   ; xor ebx, ebx
   ; xor ecx, ecx
   ; xor edx, edx
    
    
    read_char:
    
    mov dl, 0
    
    GET_DEC 1, al
    
    GET_DEC 1, bl
    
    cmp al,bl
    
    je igual
    jg maior
    jl menor
       
    igual:
    
    
    PRINT_STRING "IGUAL"
    NEWLINE
    
    ret
    
    maior:
    
    PRINT_STRING "MAIOR:"
    NEWLINE
    PRINT_DEC 2, al
    NEWLINE
    PRINT_STRING "MENOR:"
    NEWLINE
    PRINT_DEC 2, bl
    NEWLINE
    
    ret

    menor:
    
    PRINT_STRING "MAIOR:"
    NEWLINE
    PRINT_DEC 2, bl
    NEWLINE
    PRINT_STRING "MENOR:"
    NEWLINE
    PRINT_DEC 2, al
    NEWLINE

    ret