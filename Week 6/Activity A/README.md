# Weekk 6 Activity A
## Flowchart
![flowchart](https://github.com/egchung8/CISC211/blob/main/Week%206/Activity%20A/Wk6_%20ActivityA.png)
## Code
```Assembly
;Week 6 Activity A
; generate English uppercase letters A - Z

section .text
    global _start:
    
_start:
    mov eax, 65         ;65 is A in ASCII Dec

increase: 
    mov [res], eax      ;load eax into res for output
    push eax            ;push eax value to save for later
    mov ecx, res        ;load res into ecx for sys_write
    
    call output         ;print letter to console
    mov ecx, newline    ;print new line
    call output
    
    pop eax              ;restore eax value with letter
    inc eax
    cmp eax, 90          ;check that eax is <= 90 (Z)
    jle increase
    call exit            ;if eax is greater than 90 (Z) exit
    
    
output:
        mov edx,1       ;output length
        mov ebx,1       ;stdout
        mov eax,4       ;system call (sys_write)
        int 0x80        ;interrupt kernel
        ret
      
exit:
        mov eax,1
        int 0x80

segment .bss
        res resb 1
        
section .data
        newline dd 10        ;in ASCII, the new line is decimal 10
```
## Challenges
  The challenges I had doing this lab was figuring out at what step I should start the loop and if I should use the condition jl or jle. 
  I had originally used jl since the value in eax should stop at 90 but noticed that the loop did not complete and Y was the last letter printed.
