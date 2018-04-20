PMOV: 

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

ret