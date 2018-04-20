%include "io.inc"

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


    GET_DEC 1, dl
    
    
    
    
    mov bl,dl
    sub bl,1
    
    
    
    modificado:
    
    mov bh, bl
    
    
    repete:
    
    sub bh, 1 
     
    PRINT_DEC 1,dl 
    PRINT_CHAR ' '
    PRINT_DEC 1,bl
    PRINT_CHAR ' '
    PRINT_DEC 1,bh
     
    mov al, dl
    mul dl
    mov dh, al
    
    
     mov al, bl
     mul bl
     mov cl, al
     
     
     
     mov al, bh
     mul bh
     mov ch, al
                
     add cl, ch
     
     cmp cl, dh
     
     je imprimaS
     jne imprimaN
     
     imprimaS:
     PRINT_CHAR ' ' 
     PRINT_CHAR "S"
     NEWLINE
     cmp bh, 1
     jne repete
     je  modificaTermo2
       ret
     
     imprimaN:
     PRINT_CHAR ' ' 
     PRINT_CHAR "N"
     NEWLINE
     cmp bh, 1
     jne repete
     je  modificaTermo2
     
     
     
     modificaTermo2:
     
     sub bl,1
     cmp bl,1
     jne modificado
     
     
     ret                                                                                

