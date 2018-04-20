%include "io.inc"


section .data

string1 db "10/01/2017", 0ah 
strlen equ $-string1

string3 db "janeiro", 0ah
str3 EQU $-string3
string4 db " de ", 0ah
str4 EQU $-string4


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
    xor edx, edx

    xor esi, esi
    xor edi, edi
   
    mov esi, string1
    mov edi, string2
 
    
    repete:
    
    cmp byte [esi], '/'   
    je barra
    jne dia
     
     dia:
     movsb
     jmp repete
     
     barra:
   
       inc esi
       
         
     mov edx, esi
     
    ; xor esi, esi
     mov esi, string4
     
     
     mov bx, str4
 
     sub bx, 1
     mov cx, bx 
     rep movsb  
     
     PRINT_STRING string2
     NEWLINE
     
     xor esi,esi
     mov esi, edx
   
     
     jmp proximo
  
     proximo:
    
     cmp byte [esi], '0'  
     je proximomes
     jne ano
    
     proximomes:
     
     inc esi 
     cmp byte [esi], '1'
     je mesjaneiro
    
    mesjaneiro:
    
        
     inc esi
    ; inc esi
      
     xor edx, edx
     mov edx, esi
     xor esi, esi
     
     mov esi, string3
     
     mov bx, str3
     sub bx, 1
     xor ecx,ecx
     mov cx, bx
     
     PRINT_DEC 1,cx
     
     rep movsb  
    
    PRINT_STRING string2
     NEWLINE
    mov esi, edx
   
    
   cmp byte [esi], '/'
   je barra
     
    ano:
    
    movsb
   ; inc esi
    
    cmp byte [esi], 0ah
    je fim
    jne ano
    
    
    
    fim:
    
   PRINT_STRING string2
    
    
    
    ret
    