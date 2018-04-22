%include "io.inc"

section .data
    ;expressao  db "8 3 4 + - 6 4 2 / + * 2 $ 5 +",0; 1 - 
    ;EXPECTED OUTPUT: --> 69
    expressao  db "4 3 + 7 + 5 - 3 / 2 + 6 + 3 +",0; 2 - OK
    ;EXPECTED OUTPUT: --> 14
    ;expressao  db "199 725 148 + 902 885 + - *",0; 3 - OK
    ;EXPECTED OUTPUT: --> -181886
    ;expressao  db "879 608 + 842 - 251 43 - 906 - +",0; 4 - OK
    ;EXPECTED OUTPUT: --> -53
    ;expressao  db "484 390 -",0; 5 - OK
    ;EXPECTED OUTPUT: --> 94
    ;expressao  db "635 114 927 + 557 + +",0; 6 - OK
    ;EXPECTED OUTPUT: --> 2233
    ;expressao  db "224 18 309 + 620 683 - - -",0; 7 - OK
    ;EXPECTED OUTPUT: --> -166
    ;expressao  db "403 408 + 917 853 - 568 791 + 692 322 + + + +",0; 8 - OK
    ;EXPECTED OUTPUT: --> 3248
    ;expressao  db "782 197 -",0; 9 - OK
    ;EXPECTED OUTPUT: --> 585
    mexp_len    equ    $-expressao
    

section .bss
    digitos        resb    1
    rev_count        resb    1
exp_len resb 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    mov byte [digitos], 0
    mov byte [rev_count], 0
    mov ecx, -1
    mov eax, mexp_len
    mov byte [exp_len], al
    mov eax, 0

ler_caracter:
    inc ecx
    cmp cl, byte [exp_len]
    je fim
    PRINT_CHAR [expressao + ecx]
    mov al, [expressao + ecx]
    cmp al, " "
    je espaco
    cmp al, '0'
    je zero
    cmp al, '1'
    je um
    cmp al, '2'
    je dois
    cmp al, '3'
    je tres
    cmp al, '4'
    je quatro
    cmp al, '5'
    je cinco
    cmp al, '6'
    je seis
    cmp al, '7'
    je sete
    cmp al, '8'
    je oito
    cmp al, '9'
    je nove
    cmp al, '+'
    je soma
    cmp al, '-'
    je subtracao
    cmp al, '*'
    je multiplicacao
    cmp al, '/'
    je divisao
    cmp al, '$'
    je potencia

potencia:
    ;remover valores da pilha e operar
    
    jmp ler_caracter
divisao:
    pop ebx
    pop eax
    div ebx
    push eax
    jmp ler_caracter
multiplicacao:
    pop ebx
    pop eax
    mul ebx
    push eax
    jmp ler_caracter
subtracao:
    pop ebx
    pop eax
    sub eax, ebx
    push eax
    jmp ler_caracter
soma:
    pop ebx
    pop eax
    add eax, ebx
    push eax
    jmp ler_caracter
    
nove:
    inc byte [digitos]
    push 9
    jmp ler_caracter
oito:
    inc byte [digitos]
    push 8
    jmp ler_caracter
sete:
    inc byte [digitos]
    push 7
    jmp ler_caracter
seis:
    inc byte [digitos]
    push 6
    jmp ler_caracter
cinco:
    inc byte [digitos]
    push 5
    jmp ler_caracter
quatro:
    inc byte [digitos]
    push 4
    jmp ler_caracter
tres:
    inc byte [digitos]
    push 3
    jmp ler_caracter
dois:
    inc byte [digitos]
    push 2
    jmp ler_caracter
um:
    inc byte [digitos]
    push 1
    jmp ler_caracter
zero:
    inc byte [digitos]
    push 0
    jmp ler_caracter
espaco:
    cmp byte [digitos], 0
    jg inteiro
    jmp ler_caracter
    
    
fim:
    pop eax
    PRINT_STRING ' = '
    PRINT_DEC 4, eax
    ret


inteiro:
    dec byte [digitos]
    cmp byte [digitos], -1
    je inteiro_fim
    inc byte [rev_count]
    cmp byte [rev_count], 2
    je dezena
    cmp byte [rev_count], 3
    je centena
    jmp inteiro
    
inteiro_fim:
    mov byte [digitos], 0
    mov byte [rev_count], 0
    jmp ler_caracter

dezena:
    pop ebx
    pop eax
    mov edx, 10
mul edx
add eax, ebx
    push eax
jmp inteiro
    
centena:
    pop ebx
    pop eax
    mov edx, 100
    mul edx
    add eax, ebx
    push eax
    jmp inteiro

