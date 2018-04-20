;Conta as repetições dos caracteres " ", "a" e "e"

%include "io.inc"


section .data

string1 db "Roberto de Cerqueira Figueiredo", 0ah 
strlen equ $-string1

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
    
    mov ecx, strlen
    
    repete:
    
    cmp ecx, 0   
    je fimEspaco
   
    mov al, ' '
    repne scasb
    je incrementaespaco
    jne repete
    
    incrementaespaco:
    inc dx
    jmp repete
     
     fimEspaco:
     
     PRINT_DEC 2,dx
     
     mov edi, string1
     mov ecx, strlen
     xor edx, edx
     
     repetea:
     
     cmp ecx, 0
     je fima
     mov al, 'a'
     repne scasb
     je incrementaa
     jne repetea
     
     incrementaa:
     inc dx
     jmp repetea
     
     
     fima:
     
     NEWLINE
     PRINT_DEC 2, dx
     
     mov edi, string1
     mov ecx, strlen
     xor edx, edx
     
     repetee:
     
     cmp ecx, 0
     je fime
     mov al, 'e'
     repne scasb
     je incrementae
     jne repetee
     
     incrementae:
     inc dx
     jmp repetee
     
     
     fime:
     
     
     NEWLINE
     PRINT_DEC 2, dx
     
     
     
     ret
    
     
     
     
    