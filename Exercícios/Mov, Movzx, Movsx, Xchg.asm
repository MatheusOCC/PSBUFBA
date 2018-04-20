;=====================================================================================

;Code created by MATHEUS OLIVER DE CARVALHO CERQUEIRA
;Student from UNIVESIDADE FEDERAL DA BAHIA, October 3rd, 2017
;For PROGRAMMING BASIC SOFTWARE subject
;Corresponding to October 2nd, 2017
;
;=====================================================================================
;
;All classes will have code examples and corresponding slides, just downloaded.
;Intention here is to code according to the exact subject, commenting the necessary 
;and incoming things to understand perfectly this code
;
;=====================================================================================
;
;C-O-D-E - - 2
;
;=====================================================================================

%include "io.inc" ;INCLUDE LIBRARY

    ;DATA ON REGISTERS CAN BE MODIFIED BY USING DIFFERENT DATA SIZES
    
section .data      ;CREATING VARIABLES -> <name> <type> <content>
    ;M-O-V:
    OneByte DB 78h          ;78H = {(0111)(1000)}b = 120, 1BYTE NUMBER
    OneWord DW 1234h      ;1234 = {(0001)(0010)}{(0011)(0100)}, 2BYTE NUMBER
    OneDword DD 12345678h;12345678 = {(0001)(0010)}{(0011)(0100)}{(0101)(0110)}{(0111)(1000)}, 4BYTE NUMBER 
    Caractere DB 'B'        ;ASCII NUMBER REPRESENTATION FOR CHARACTER - 42h
    ;VERY IMPORTANT YOU WRITE THIS SECTION ->HERE!!!<-
    ;\\WARNING//== CALL DECLARED VARIABLES JUST LIKE YOU WROTE THEM
    ;
    ;M-O-V-Z-X
    byte1 DB 9Bh
    word1 DW 0A69Bh
    ;
    ;M-O-V-S-X
    ;byte1 DB 9Bh       ALREADY DID IT
    ;word1 DW 0A69Bh    THIS TOO

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
    ;M-O-V
    ;
    ;============================================================
    mov eax, [Caractere]     ; EAX = 00000042h 
    ;EVERY TIME YOU GET A VALUE OR CONTENT FROM A VARIABLE, YOU CODE <[Variable]>
    ;MOV al, OneByte -- THIS LINE DOESN'T WORK. IT CALLS "error: parser: instruction expected"
    ;REMEMBER CASE-SENSITIVE. IF YOU DON'T <[]>, THE MOVEMENT WILL BE FOR A REFERENCE OF MEMORY.
    mov eax, 0               ; EAX = 00000000h 
    mov al, [OneByte]        ; EAX = 00000078h 
    mov ax, [OneWord]        ; EAX = 00001234h 
    ;mov al, OneByte -- THIS LINE DOESN'T WORK. IT CALLS "error: COFF format does not support non-32-bit relocations"
    ;mov ax, OneWord -- THIS LINE DOESN'T WORK. IT CALLS "error: COFF format does not support non-32-bit relocations"    
    ;THIS MEANS COFF (Commom Object Format File)
    mov eax, [OneDword]    ; EAX = 12345678h 
    mov ax, 0              ; EAX = 12340000h 
    ;WHAT IT DID MENTION:
    ;
    ;
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    ;============================================================
    ;
    ;M-O-V-Z-X
    ;
    ;============================================================
    ;FOR "MOVZX"-> THIS INSTRUCTION MEANS: MOVE (A TO B) AND COMPLETE WITH ZEROS (IF A<B), OR, RESET REGISTER AND MOVE VALUE
    mov bl, 10001111b   ;MOVE TO BL (8BIT) CONTENT 10001111, 8F
    movzx ax, bl        ;MOVE CONTENT FROM BL TO AX, BL IS A REGISTER, NOT A VARIABLE, AX IS 16BIT
    ;SO YOU'LL DO (00000000)(10001111);
    ;REGISTER TO REGISTER:
    mov bx, 0A69Bh
    movzx eax, bx       ; EAX=0000A69Bh 
    movzx edx, bl       ; EDX=0000009Bh
    movzx cx, bl        ; CX=009Bh
    ;MEMORY TO REGISTER:
    ;movzx  eax, word1 -- THIS LINE DOESN'T WORK. IT CALLS error: invalid combination of opcode and operands
    movzx edx, [byte1]
    movzx edx, byte1    ; EDX=0000009Bh   
    movzx cx, [byte1]     ; CX = 009Bh
    ;
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    ;============================================================
    ;
    ;M-O-V-S-X
    ;
    ;============================================================
    ;FOR "MOVSX"-> THIS INSTRUCTION MEANS: MOVE (A TO B) AND COMPLETE WITH THE MSB, B FOR BIT
    ;SO, IF LAST DIGIT IS 0<=DIGIT<=7, MSB EQUALS 0 (000...INFORMATION)
    ;IF LAST DIGIT IS 8<=DIGIT<=F, MSB EQUALS 1 (111...INFORMATION)
    ;REGISTER TO REGISTER
    mov bx, 0A69Bh    ; WE PUT "0" BEFORE A HEX NUMBER STARTING WITH A,B,C,D,E,F, FOR SASM RECOGNIZING THIS IS NOT A VARIABLE
    Movzx eax, bx     ; EAX=0000A69Bh 
    Movzx edx, bl     ; EDX=0000009Bh 
    Movzx cx, bl      ; CX=009Bh
    ;
    ret