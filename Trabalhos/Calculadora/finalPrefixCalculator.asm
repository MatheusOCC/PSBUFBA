%include "io.inc"

section .data
    expressao  db "\* 199 - + 725 148 + 902 885",0; 1 - OK
    ;EXPECTED OUTPUT: --> -181886
    ;expressao  db "\+ - + 879 608 842 - - 251 43 906",0; 2 - OK
    ;EXPECTED OUTPUT: --> -53
    ;expressao  db "\- 484 390",0; 3 - OK
    ;EXPECTED OUTPUT: --> 94
    ;expressao  db "\+ 635 + + 114 927 557",0; 4 - OK
    ;EXPECTED OUTPUT: --> 2233
    ;expressao  db "\- 224 - + 18 309 - 620 683",0; 5 - OK
    ;EXPECTED OUTPUT: --> -166
    ;expressao  db "\+ + + 403 408 - 917 853 + + 568 791 + 692 322",0; 6 - OK
    ;EXPECTED OUTPUT: --> 3248
    ;expressao  db "\- 782 197",0; 7 - OK
    ;EXPECTED OUTPUT: --> 585
    exp_len equ $-expressao
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp                  ; for correct debugging 
    xor eax, eax                 
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx    
    mov esi,expressao + exp_len -1   
    PRINT_STRING expressao + 1 
    
menu:
    std                 ;; DF=1
    lodsb               ;;;;;;;;;;LEITURA DE BYTE DA STRING
    cmp eax,'\'
    je finaliza
    cmp eax,' '         ;;verifica se é espaço vazio
    je condicao
    cmp eax, '-'        ;;verifica se é sinal negativo ( vem antes do espaço vazio para que se possa gerar Flag de numero negativo EBX
    je subtracao    
    cmp eax ,'+'
    je soma
    cmp eax ,'*'
    je multipli
    cmp eax ,'/'
    je divisao
    cmp eax,'$'
    je potencia
    cmp eax,48          ;;se eax for menor que 0 ASCII, volta pro menu
    jl menu
    cmp eax,59          ;;Se eax for maior que 9 ASCII, volta pro menu
    jg menu
    
empilha:    
    sub eax,48          ;; EAX é número, então ele é subtraido de 48 e empilhado em seguida
    push eax            ;; empilha o valor decimal equivalente
    inc ecx             ;; ECX é incrementado para indicar quantos algarismos formam o número
    jmp menu            ;; Retorna ao menu


soma_proc:
    push ebp            ;; salva valor de EBP para que seja possível se mover pelos índices da pilha usando o registrador EBP
    mov ebp, esp        ;; Move o índice atual do topo da pilha para o registrador EBP (frame da pilha)
    mov eax, [ebp+8]    ;; Move o 1o numero da pilha para EAX
    mov ebx, [ebp+12]   ;; Move o 2o numero
    add eax, ebx        ;; Realiza a soma e armazena em EAX
    pop ebp             ;; Após o uso de EBP para "navegar" pelos índices, retorna o valor original do mesmo para seu registrador
    ret

subtracao_proc:
    push ebp 
    mov ebp, esp
    mov eax, [ebp+8]
    mov ebx, [ebp+12]
    sub eax, ebx
    pop ebp
    ret

multipli_proc:
    push ebp 
    mov ebp, esp
    mov eax, [ebp+8]
    mov ebx, [ebp+12]
    imul ebx
    pop ebp
    ret

divisao_proc:
    push ebp 
    mov ebp, esp
    mov eax, [ebp+8]       
    mov ebx, [ebp+12]
    cdq                 ;;Para divisão de dividendos com sinal, deve-se usar CDQ para extender sinal(convert double to quad word)
    idiv ebx
    pop ebp
    ret

potencia_proc:          ;;essa funcao pode ser repetidas vezes a funcao multipli
    push ebp
    mov ebp, esp
    mov eax ,[ebp+8]
    mov ebx ,[ebp+12]
    mov ecx, eax
    PRINT_DEC 4,EAX
    NEWLINE
    PRINT_DEC 4,EBX
    repeticao:
        imul ecx
        dec ebx
        cmp ebx,1
        jg repeticao
        pop ebp
        ret
    
condicao:
    cmp ecx, 0
    je limpar
    jmp tratamento
    
limpar:
    xor edx,edx     ;Limpa o registrador acumulador edx
    jmp menu
    
tratamento:
     cmp ecx, 0
     je empilhar
     mov ebx, 10    ;para multiplicar
     pop eax        ;Retira o valor mais alto da pilha 
     xchg eax, edx  ; troca os valores entre eax e edx
     push edx
     mul ebx        ;multiplica eax por 10 (ebx=10)
     pop edx        ;retorno o 
     add edx,eax    ;Acumula o valor de eax multiplicado por 10 no edx (edx é o acumulador
     xor eax,eax    ;Limpa eax
     dec ecx        ;decrementa ecx
     jmp tratamento ;Retorna ao inicio do tratamento
    
empilhar:
      push edx      ;Empilha o numero convertido na pilha de cálculos
      xor edx,edx   ;Limpa os registradores gerais
      xor ebx,ebx
      xor ecx, ecx
      xor eax,eax
      jmp menu      ;Retorna ao menu
    
soma:
    call soma_proc  ; Chama o procedimento de soma
    pop ebx         ; Quando retorna de soma_proc, a pilha está: Numero1-Numero2. Entao, é desempilhado
    pop ebx         ; O numero2 e numero1  e empilhado o resultado do calculo armazenado em EAX(abaixo)
    push eax        ; empilha o resultado calculado no procedimento soma
    xor eax,eax
    xor ebx,ebx     ; Limpa ECX
    jmp menu        ; retorna obrigatoriamente ao menu principal
        
subtracao:
    call subtracao_proc
    pop ebx
    pop ebx
    push eax
    xor eax,eax
    xor ebx,ebx
    jmp menu
    
multipli:
    call multipli_proc   ; Chama o procedimento 
    pop ebx             
    pop ebx
    push eax
    xor eax,eax
    xor ebx,ebx
    jmp menu
    
divisao:
    call divisao_proc
    pop ebx 
    pop ebx
    push eax
    xor eax,eax
    xor ebx,ebx
    jmp menu
    
potencia:
    call potencia_proc
    pop ebx
    pop ebx
    push eax 
    xor eax,eax
    xor ebx,ebx    
    xor ecx,ecx
    jmp menu    
    
finaliza:       ; Trecho para exibição de resultado
    pop eax         ; Retira a resposta da pilha e põe no registrador eax
    PRINT_DEC 4,EAX ; Exibe resultado da expressão
    cld             ; Seta Direction flag para zero
    ret
    
salto_push:
    push edx
    xor edx,edx
    xor ebx,ebx
    jmp menu 
    
salto:
    cmp ebx, 1      ; Flag EBX =1 indica que tem um número pronto para ser empilhado, então desvia
    je salto_push   ; para salto_push
    xor EDX,EDX     ; Caso flag EBX seja diferente de 1, limpa o registrador de acúmulo EDX
    jmp menu        ; e retorna ao menu