%include "io.inc"


section .data

;string1 db "software livre", 0ah 
;strlen equ $-string1



section .bss

string1 resb 80
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
 
   
    mov esi, string1
    mov edi, string2
 
    GET_STRING string1,8
    
    
    
 
    diferente:
    
   ; cmp byte [esi], 0ah
   ; je fim
    
    mov cx,7
    cmp byte [esi], 3
    
    je proximo
    jne altera
     
     proximo:
     
     movsb
     loop proximo
     
     jmp fim
  
    altera:
  
    mov ax,'3'
    stosb
    ;dec esi
    ;PRINT_CHAR [edi]
   
    jmp proximo
    
    fim:
    
   PRINT_STRING string2
    
    
    
    ret
    