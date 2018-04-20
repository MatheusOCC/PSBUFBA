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
    
   
    GET_DEC 2,cx 
    
   mov ax, 1
   mov bx, 1
   mov dx, bx
    
   PRINT_DEC 2, ax
   PRINT_CHAR ' '
   PRINT_DEC 2, bx 
   PRINT_CHAR ' ' 
     
    repete:
   
   add bx, ax  
   mov ax, dx
   mov dx, bx
    
   PRINT_DEC 2,bx
   PRINT_CHAR ' '
   
    dec cx 

   cmp cx,2
    
    je igual
    jg repete
       
    igual:
    
    ret
    