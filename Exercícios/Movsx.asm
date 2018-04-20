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
;C-O-D-E - - 2. MOVSX
;
;=====================================================================================

%include "io.inc" ;INCLUDE LIBRARY

    ;DATA ON REGISTERS CAN BE MODIFIED BY USING DIFFERENT DATA SIZES
    
section .data      ;CREATING VARIABLES -> <name> <type> <content>
    ;M-O-V-S-X
    byte1 DB 9Bh
    word1 DW 0A69Bh

section .text

global CMAIN ; GLOBAL->ACSSESS
global REGREG

REGREG:
    mov bx, 0A69Bh
    Movzx eax, bx ; EAX=0000A69Bh
    Movzx edx, bl ; EDX=0000009Bh
    Movzx cx, bl ; CX=009Bh
    ret
    
MEMREG:
    Movzx eax, WORD [word1] ; EAX = 0000A69B
    Movzx edx, BYTE[byte1] ; EDX=0000009Bh
    Movzx cx, BYTE [byte1] ; CX = 009Bh
    ret
    
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax ;MAKE A COMPARISON (0 XOR 0 = 0), RESET REGISTER EAX (32BITS, 4 BYTES)
    xor ebx, ebx ;MAKE A COMPARISON (0 XOR 0 = 0), RESET REGISTER EBX (32BITS, 4 BYTES)
    xor ecx, ecx ;MAKE A COMPARISON (0 XOR 0 = 0), RESET REGISTER ECX (32BITS, 4 BYTES)
    xor edx, edx ;MAKE A COMPARISON (0 XOR 0 = 0), RESET REGISTER EDX (32BITS, 4 BYTES)
    ;============================================================
    ;
    ;M-O-V-S-X
    ;
    ;============================================================
    ;FOR "MOVSX"-> THIS INSTRUCTION MEANS: MOVE (A TO B) AND COMPLETE WITH THE MSB, B FOR BIT
    ;SO, IF LAST DIGIT IS 0<=DIGIT<=7, MSB EQUALS 0 (000...INFORMATION)
    ;IF LAST DIGIT IS 8<=DIGIT<=F, MSB EQUALS 1 (111...INFORMATION)
    ;REGISTER TO REGISTER
    CALL REGREG
    
    ;MEMORY TO REGISTER
    CALL MEMREG
    
    ;MOVSX AND MOVZX DON'T WORK WHEN REGISTERS HAVE THE SAME SIZE (CAN'T COMPLETE A LACKLESS REGISTER)
    ret