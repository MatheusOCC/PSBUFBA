%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
        ;write your code here
     xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    
   
    GET_DEC 2,ax 
    mov cx, ax
   
   
   mov bx, ax
    repete:
   
   dec  bx
   mul bx
   dec cx 
   cmp cx,1
    
    je igual
    jg repete
       
    igual:
    
    
   PRINT_DEC 4, eax
    ret