;copia a string e imprime, caractere a caractere

%include "io.inc"


section .data

string1 db "software livre", 0ah 
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
   
    mov esi, string1
    mov edi, string2
 
    diferente:
    
    cmp byte [esi], 0ah
    je fim
    
    
    cmp byte [esi], 20h
    jne proximo
    je semascii
     proximo:
     
     lodsb
    sub ax, 32
    stosb 
  jmp diferente
  
  semascii:
  
  lodsb
  stosb
   ; PRINT_CHAR al
    
   ; mov [edi], al
  
    ;inc esi
    ;inc edi
   
    jmp diferente
    
    fim:
    
    mov al, 0ah
    stosb
     mov edi, string2
     
     novofim:
     
    PRINT_CHAR [edi]
    
    inc edi
    
    cmp byte [edi] , 0ah
    je termina
    jne novofim
    
    
    PRINT_STRING string2
    
    termina:
    
    
    
    ret
    