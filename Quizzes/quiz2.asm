section .text
        global _start

_start:
    ;x = (a * b) + (c * d)
    mov eax,[a]
    mov ebx,[b]
    mul ebx
    mov ecx,eax  ;store a*b in ecx to use later
    
    mov eax,[c]
    mov ebx,[d]
    mul ebx      ;c*d stored in eax
    
    add eax,ecx  ;add ecx to eax
    mov [x],eax  ;move answer to x variable
    
    mov eax,1
    int 0x80     ;sys_exit call
    
        
section .data   ;initalized variables
    a DD 1   ;assign 1 to variable a
    b DD 2   ;assign 2 to variable b
    c DD 3   ;assign 3 to variable c
    d DD 4   ;assign 4 to variable d

segment .bss
        x resb 1