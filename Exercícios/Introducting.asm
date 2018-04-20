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


%include "io.inc";INCLUDE LIBRARY

section .text    ;WRITE YOUR CODE

global CMAIN     ;GLOBAL->ACCESS
CMAIN:
    mov ebp, esp ;for correct debugging
    ;write your code here
    xor eax, eax ;MAKE A COMPARISON (N XOR N = 0), RESET REGISTER EAX (32BITS, 4 BYTES)
    xor ebx, ebx ;MAKE A COMPARISON (N XOR N = 0), RESET REGISTER EBX (32BITS, 4 BYTES)
    xor ecx, ecx ;MAKE A COMPARISON (N XOR N = 0), RESET REGISTER ECX (32BITS, 4 BYTES)
    xor edx, edx ;MAKE A COMPARISON (N XOR N = 0), RESET REGISTER EDX (32BITS, 4 BYTES)
    
    mov ax, 5   ;MOVE, TO REGISTER AX, VALUE 5  (0000000000000101)
    mov bx, 10  ;MOVE, TO REGISTER BX, VALUE 10 (0000000000001010)
    
    add ax, bx  ;ADD CONTENTS FROM AX AND BX, AND KEEP IT ON AX (5+10=15)
    add bx, ax  ;ADD CONTENTS FROM AX AND BX, AND KEEP IT ON BX (15+10=25)
    
    PRINT_DEC 2, ax ;SHOW CONTENT FROM AX IN OUTPUT LOG, PRINT_DEC HOW MANY BYTES REGISTER SUPPORTS, REGISTER
    NEWLINE ;SKIP LINE IN OUTPUT LOG
    PRINT_DEC 2, bx ;SHOW CONTENT FROM BX IN OUTPUT LOG
    
    ;TO SEE WHAT HAPPENS:
    ;PRESS "Debug" ON TOP MENU (OR, F5)
    ;PRESS F8 TO SEE REGISTER'S CONTENTS
    ;PRESS F10 AND LOOK TO OUTPUT LOG
    ;KEEP PRESSING TO SEE CHENGES
    
    ;EXTRA================================================================================
    
    xor al, al ;RESET EAX's 8 LSBs (TURNS ...00000101 TO ...00000000)
    xor bl, bl ;RESET EBX's 8 LSBs (TURNS ...00001010 TO ...00000000)
    
    mov al, 300 ;300>255, MORE THAN THE BIGGEST VALUE AL COULD HANDLE
    
    NEWLINE ;AGAIN
    PRINT_DEC 2, al ;SHOW AL'S CONTENT
    
    ;DEBUGGING, IT BECAMES STRANGE, AL SHOULD KEEP 300, BUT LOG SHOWS 44.
    ;THIS HAPPENS BECAUSE AL IS 1 BYTE LONG (8BIT) AND 300 IS 9BIT LONG (1.00101100)
    ;THIS CAUSES A RED MESSAGE RIGHT ON THE DEBUG LOG (BYTE VALUE EXCEEDS BOUNDS)
    ;SO, THE NEXT BIT (256) BELONGS TO AH (8MSB FROM AX), THE LSB OF IT.
    ;ALTOUGH 256 IS FOR AH, AL KEEPS 300-256=44 (00101100), THE EXACT CONTENT SHOWN (COMPARE TO 300 JUST AHEAD)
    
    ret     ;RETURN, END CODE