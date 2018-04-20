%include "io.inc"


section .data

string1 db "quem parte e reparte fica com a maior parte", 0ah 
strlen equ $-string1

string2 db "parte", 0ah

strlen2 equ $-string2
   
string3 db "parcela", 0ah 

section .bss

string4 resb 80 


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
    ;mov ecx, strlen
    
    mov ecx, strlen2
    ;add esi, ecx

    ;    mov ecx, strlen2
            
    repete:
    
    mov ecx, strlen2 
    mov  edi, string2
      
    cmp byte [esi], 0ah
    je fim
   
   ; cld 
   ; stosb
    repe cmpsb
    cmp ecx,0 
    je encontrou
    jne repete
   
   
   encontrou:
  
    mov ecx, strlen2
     mov ebx, edi
    sub ebx, ecx
     mov  edi, string2
    jmp repete  
    
   fim:
   
   
   
    mov  esi, string1
   
   
   
   
    mov esi, ebx
     
    mov edi, string4
    
   continua: 
   
      mov  esi, ebx
 
    
    movsb
    
    cmp ebx, esi
    je altera
    
    
    altera:
    
    mov ebx, esi
    
    mov  esi, string3
    
    rep movsb
    
    jmp continua
    
    PRINT_STRING string4
    
    ret
    
   