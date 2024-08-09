# Project 
## Task 1: Encryption and Decryption

### Output.txt
```
Plain text: HELLO
Key: world
Encrypted text: ?*> +
Decrypted text: HELLO
```

### Code
```assembly
;Project Task #1: Encryption and Decryption

section	 .text
   global _start
	
_start:
    ;print line 1 with secret message
    mov eax, 4                       ;sys_write  
    mov ebx, 1                       ;stdout
    mov ecx, plaintext           
    mov edx, plaintext_len 
    int 0x80        

    mov eax, 4       
    mov ebx, 1         
    mov ecx, msg           
    mov edx, msg_len 
    int 0x80 

    call print_newline


    ;print line 2 with key word
    mov eax, 4       
    mov ebx, 1         
    mov ecx, keytext           
    mov edx, keytext_len 
    int 0x80        

    mov eax, 4       
    mov ebx, 1         
    mov ecx, key           
    mov edx, msg_len                   ;key should have the same length as msg 
    int 0x80    

    call print_newline

    ;print line 3 with enycrption
    mov eax, 4       
    mov ebx, 1         
    mov ecx, encryptext           
    mov edx, encryptext_len 
    int 0x80

    ;loop to iterate through each letter or "byte" in the string to do bit-wise xor operation between msg and key
    mov ecx, msg_len                   ;initialzie string length in ecx register as loop counter
    mov edx, 0                         ;initialize index (iterate from 0 to msg_len) for iteration through string
   
_xorEncryp:
    mov eax, [msg + edx]               ;loads each byte (character) from msg string into eax 
    mov ebx, [key + edx]               ;loads each byte (character) from key string into ebx
    xor eax, ebx                       ;bitwise xor operation
    mov [encryption + edx], eax        ;saves indexed byte into same byte for encryption variable
    inc edx                            ;increase counter for indexing through string
    loop _xorEncryp

    ;print line 3 with enycrption
    mov eax, 4       
    mov ebx, 1         
    mov ecx, encryption          
    mov edx, msg_len 
    int 0x80

    call print_newline

    ;print line 4 with decrypted message
    mov eax, 4       
    mov ebx, 1         
    mov ecx, decrypt           
    mov edx, decrypt_len 
    int 0x80

    ;loop to iterate again through encrypted message to decrypt message
    mov ecx, msg_len                   ;initialzie string length in ecx register as loop counter
    mov edx, 0                         ;initialize index (iterate from 0 to msg_len) edx is the index register

_xorDecryp:
    mov eax, [encryption + edx]        ;loads each byte (character) from msg string into eax 
    mov ebx, [key + edx]               ;loads each byte (character) from key string into ebx
    xor eax, ebx                       ;bitwise xor operation
    mov [decryption + edx], eax        ;saves indexed byte into same byte for encryption variable
    inc edx                            ;increase counter for indexing through string
    loop _xorDecryp

    ;print line 3 with enycrption
    mov eax, 4       
    mov ebx, 1         
    mov ecx, decryption          
    mov edx, msg_len 
    int 0x80

    call print_newline
    call exit

    
print_newline:
    mov eax, 4       
    mov ebx, 1         
    mov ecx, newline           
    mov edx, 1 
    int 0x80
    ret

exit:
    mov eax,1            ;system call number (sys_exit)
    int 0x80            ;call kernel

segment .bss
    encryption resb 16
    decryption resb 16

section	 .data
    msg db	'HELLO'                         ;declare a byte for each character in string
    msg_len equ $ - msg			

    key db 'world'

    plaintext db 'Plain text: '
    plaintext_len equ $ - plaintext

    keytext db 'Key: '
    keytext_len equ $ - keytext

    encryptext db 'Encrypted text: '
    encryptext_len equ $ - encryptext

    decrypt db 'Decrypted text: '
    decrypt_len equ $-decrypt

    newline dd 10
```
