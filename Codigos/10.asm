%include "io.inc"


section .data

string1 db "OSSO", 0ah 
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
    mov ecx, strlen
    
    
    mov edx, edi
    
    dec ecx
    add esi, ecx
    inc ecx
    
    repete:
    
    std
    lodsb
    cld 
    stosb
   
    
    dec ecx
    
    cmp ecx,0 
    
    jne repete
   
   
   PRINT_STRING string2
   NEWLINE
    PRINT_STRING string1
    
    mov ecx, strlen
    
    dec ecx
    
    mov esi, string1
    mov edi, edx
    add edi,1
    
    PRINT_CHAR [esi]
    PRINT_CHAR [edi]
    
    repe cmpsb
    
    cmp ecx,0
    je igual
    jne diferente
    
    
    igual: 
    
    PRINT_STRING "Palindromo"
    
    ret
    
    diferente:
    
   
    PRINT_STRING "Nao palindromo"
   
    ret