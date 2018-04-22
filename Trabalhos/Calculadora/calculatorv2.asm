%include "io.inc"

section .data
    msg     db 'Postfix Polish Calculator'
    msg1    db "92-",0
    len     equ $-msg1

section .bss
    string: resb 400

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
;---PROCEDURES FOR COMPARISONS 
    getString:
    GET_DEC 2, bx
    NEWLINE
    PRINT_DEC 2, bx
    
    testAdd:
    cmp bx, "+"
    jne testSub
    je addition
    
    testSub:
    cmp bx, "-"
    jne testMul
    je subtraction
    
    testMul:
    cmp bx, "*"
    jne testDiv
    je multiplication
    
    testDiv:
    cmp bx, "/"
    jne testExp
    je division
    
    testExp:
    cmp bx, "$"
    jne testSpace
    je exponentiation
    
    testSpace:
    cmp bx, " "
    jne checkOver
    jmp getString
    
    checkOver:
    cmp bx, "Q"
    jne queue
    je end
;
;---ACT PROCEDURES
;   
;   ARITHMETIC OPERATIONS
    addition:
    mov dx, [ESP]
    add esp, 2
    mov ax, [ESP]
    add ax, dx
    PRINT_DEC 4, ax
    NEWLINE
    jmp dequeue
    
    subtraction:
    mov dx, [ESP]
    add esp, 2
    mov ax, [ESP]
    sub ax, dx
    PRINT_DEC 4, ax
    NEWLINE
    jmp dequeue
    
    multiplication:
    mov dx, [ESP]
    add esp, 2
    mov ax, [ESP]
    mul dx
    PRINT_DEC 4, ax
    NEWLINE
    jmp dequeue
    
    division:
    mov cx, [ESP]
    add esp, 2
    mov ax, [ESP]
    div cx
    PRINT_DEC 4, ax
    NEWLINE
    jmp dequeue
    
    exponentiation:    

;   INTERNAL OPERATIONS    
    queue:
    sub bx, 48
    ;PRINT_DEC 4, bx ; -IF ON< PRINTS 2x EACH QUEUED NUMBER
    push bx
    PRINT_DEC 2,[ESP]
    NEWLINE
    jmp getString    
    
    dequeue:
    pop bx
    add esp, 2
    pop bx
    push ax
    jmp getString
    
    end:
    ret
    