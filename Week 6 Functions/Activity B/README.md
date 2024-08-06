# Week 6 Activity B

## Flowchart
![flowchart](https://github.com/egchung8/CISC211/blob/main/Week%206/Activity%20B/Wk6ActivityB.png)


## Code
```Assembly
;Week6 Activity B
;assign a number to a register/var, pass the num to a function
;display the result odd or even to the console
;function should check whether the number is odd or even


_evenodd:
    push ebp
    mov ebp, esp               ;ebp points to current stack of function

    sub esp, 16                ;makes space on stack

    mov eax, DWORD[ebp+16]     ;loads var into eax
    test eax, 1                ;check if even or odd
    jz even

    mov eax, DWORD[ebp+8]      ;if not even move 'odd' to eax

    mov ecx, eax               ;message will be in eax
    call output
    mov ecx, newline
    call output

    leave
    ret

even:
     mov eax, DWORD[ebp+12]    ;load 'even' to ecx

     mov ecx, eax              ;message will be in eax
     call output
     mov ecx, newline
     call output
     ret



section _start:
    global _start:

 _start:
     push DWORD[var]
     push msg_evn
     push msg_odd
     call _evenodd             ;call function

     call exit

output:
        mov edx,4              ;max output length
        mov ebx,1              ;stdout
        mov eax,4              ;system call (sys_write)
        int 0x80               ;interrupt kernel
        ret

exit:
        mov eax,1
        int 0x80


section .data
    var DD 13                  ;double word variable to check if even or odd
    msg_evn DD 'even'          ;even message
    msg_odd DD 'odd'           ;odd message
    newline DD 10              ;new line is decimal 10
```

## Challenges
Trying to keep track of where each variable was stored on the stack was confusing. I also had issues where my function was returning 'even' despite the number being odd.
This occurred because originally I had written ```push var``` instead of ```push DWORD[var]``` thinking it would yield the same result. I did not realize I still needed to specify var was a DWORD in the push instruction since I had already defined it as a double word in the data section.
