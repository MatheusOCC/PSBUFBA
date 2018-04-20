;=====================================================================================

;Code created by MATHEUS OLIVER DE CARVALHO CERQUEIRA
;Student from UNIVESIDADE FEDERAL DA BAHIA, October 11th, 2017
;For PROGRAMMING BASIC SOFTWARE subject
;Corresponding to October 9th, 2017
;
;=====================================================================================
;
;All classes will have code examples and corresponding slides, just downloaded.
;Intention here is to code according to the exact subject, commenting the necessary 
;and incoming things to understand perfectly this code
;
;=====================================================================================
;
;C-O-D-E - - 2. XCHG
;
;=====================================================================================

%include "io.inc" ;INCLUDE LIBRARY

    ;DATA ON REGISTERS CAN BE MODIFIED BY USING DIFFERENT DATA SIZES
    
section .data      ;CREATING VARIABLES -> <name> <type> <content>
    ;X-C-H-G
    val1 DW 1000h
    val2 DW 2000h


section .text

global CMAIN ; GLOBAL->ACSSESS

    
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax ;MAKE A COMPARISON (0 XOR 0 = 0), RESET REGISTER EAX (32BITS, 4 BYTES)
    xor ebx, ebx ;MAKE A COMPARISON (0 XOR 0 = 0), RESET REGISTER EBX (32BITS, 4 BYTES)
    xor ecx, ecx ;MAKE A COMPARISON (0 XOR 0 = 0), RESET REGISTER ECX (32BITS, 4 BYTES)
    xor edx, edx ;MAKE A COMPARISON (0 XOR 0 = 0), RESET REGISTER EDX (32BITS, 4 BYTES)
    ;============================================================
    ;
    ;X-C-H-G
    ;
    ;============================================================
    ;FOR "MOVSX"-> THIS INSTRUCTION MEANS: SWAP (A TO B, B TO A) WITHOUT A AUX VARIABLE
    
    mov edx, 0ED45h
    mov ecx, 0FFFFh
    mov ebx, 0x72
    mov eax, 0x00D   
    XCHG ax, dx ; SWAP CONTENTS OF AX AND DX
    XCHG bl, ch ; SWAP CONTENTS OF BL AND CH
    
    PRINT_DEC 2, ax
    NEWLINE
    PRINT_DEC 2, bl
    NEWLINE
    PRINT_DEC 2, ch
    NEWLINE
    PRINT_DEC 2, dx
    NEWLINE
    
    ;MOVSX AND MOVZX DON'T WORK WHEN REGISTERS HAVE THE SAME SIZE (CAN'T COMPLETE A LACKLESS REGISTER)
    ret