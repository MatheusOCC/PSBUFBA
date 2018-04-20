%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    
   mov ax, 33
    
    repete:
    
   PRINT_CHAR ax
   PRINT_CHAR ' '
    
   inc ax
    
   cmp ax,127
    
    je igual
    jl repete
       
    igual:
    
    ret
    