%include "io.inc"

section .data

test_marks dd 20,30,40,50,10

nalunos EQU ($-test_marks)/4

soma db "A soma e:", 0ah

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
    
    
    mov ecx, nalunos
    adiciona: 
    
    mov ebx, [test_marks+esi*4]
    add edx, ebx
    inc esi
    loop adiciona
    
    
    PRINT_DEC 4,edx
  
   ret 
    