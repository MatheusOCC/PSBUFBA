%include "io.inc"

section .data
  
    Express1  db "8 3 4 + - 6 4 2 / + * 2 $ 5 +",0
    ;EXPECTED OUTPUT: --> 69
    Express2  db "4 3 + 7 + 5 - 3 / 2 + 6 + 3 +",0
    ;EXPECTED OUTPUT: --> 14
    Express3  db "199 725 148 + 902 885 + - *",0
    ;EXPECTED OUTPUT: --> -181886
    Express4  db "879 608 + 842 - 251 43 – 906 - +",0
    ;EXPECTED OUTPUT: --> -53
    Express5  db "484 390 -",0
    ;EXPECTED OUTPUT: --> 94
    Express6  db "635 114 927 + 557 + +",0
    ;EXPECTED OUTPUT: --> 2223
    Express7  db "224 18 309 + 620 683 - - -",0
    ;EXPECTED OUTPUT: --> -166
    Express8  db "403 408 + 917 853 - 568 791 + 692 322 + + +",0
    ;EXPECTED OUTPUT: --> 3248
    Express9  db "782 197 -",0
    ;EXPECTED OUTPUT: --> 585

section .text
global CMAIN
CMAIN:

    mov ebp, esp; for correct debugging
;---RESET REGISTERS
    xor eax, eax;   RESET EAX
    xor ebx, ebx;   RESET EBX
    xor ecx, ecx;   RESET ECX
    xor edx, edx;   RESET EDX
    xor esi, esi;   RESET ESI
    xor edi, edi;   RESET EDI
;
;--------------------------------------
    mov esi , Express5
    PRINT_STRING [esi]
    NEWLINE
    PRINT_CHAR [esi];
    NEWLINE
;
    mov eax, 10
    mov bl, [esi]
    mul bl
    PRINT_CHAR bl

    NEXTDigit:
    add esi,1
    NEWLINE
    PRINT_STRING [esi]
    
    ret
    