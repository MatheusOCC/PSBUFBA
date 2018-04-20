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
;C-O-D-E - - 2. MOVZX
;
;=====================================================================================

%include "io.inc" ;INCLUDE LIBRARY

    ;DATA ON REGISTERS CAN BE MODIFIED BY USING DIFFERENT DATA SIZES
    
section .data      ;CREATING VARIABLES -> <name> <type> <content>
    
    ;M-O-V-Z-X
    ;Byte1 BYTE 9Bh -- THIS LINE DOESN'T WORK. IT CALLS "error: parser: instruction expected"
    ;Byteee DB 9Bh -- VALID, BUT FOLLOWING CODE ON MOVZX CONTINUES ON "error: operation size not specified
    Byte1 DB 9Bh
    Word1 DW 0A69Bh
    
section .text

global CMAIN ; GLOBAL->ACSSESS
global REGREG; CREATED PROCEDURE

REGREG:
    ;REGISTER TO REGISTER:-------------
    mov bx, 0A69Bh
    movzx eax, bx       ; EAX=0000A69Bh 
    movzx edx, bl       ; EDX=0000009Bh
    movzx cx, bl        ; CX=009Bh
    ret
    
MEMREG:
    ;movzx  eax, Word1 -- THIS LINE DOESN'T WORK. IT CALLS error: invalid combination of opcode and operands
    ;movzx eax, [Word1]-- THIS LINE DOESN'T WORK. IT CALLS error: operation size not specified SOLVE WITH "WORD" -> CAN'T MOVE MEMORY TO REGISTE
    movzx eax, WORD [Word1]
    movzx edx, BYTE [Byte1]    ; EDX=0000009Bh   
    movzx cx,  BYTE[Byte1]     ; CX = 009Bh
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
    ;M-O-V-Z-X
    ;
    ;============================================================
    ;FOR "MOVZX"-> THIS INSTRUCTION MEANS: MOVE (A TO B) AND COMPLETE WITH ZEROS (IF A<B), OR, RESET REGISTER AND MOVE VALUE
    mov bl, 10001111b   ;MOVE TO BL (8BIT) CONTENT 10001111, 8F
    movzx ax, bl        ;MOVE CONTENT FROM BL TO AX, BL IS A REGISTER, NOT A VARIABLE, AX IS 16BIT
    ;SO YOU'LL DO (00000000)(10001111);
    
    ;REGISTER TO REGISTER
    CALL REGREG
    
    ;MEMORY TO REGISTER:---------------
    CALL MEMREG
    ;
    
    ret