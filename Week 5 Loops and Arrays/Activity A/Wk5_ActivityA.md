# Activity A

## Flowchart
![Flowcharts-ActA](https://github.com/user-attachments/assets/6a6ae1a7-798c-4d8a-9559-e1a5ab6cd3b3)

## Task 1
```assembly
;Week 5 Activity A Task #1
;ths program generates a sequence of even numbers up to 20

section .text
    global _start

 _start:
     mov eax, 0     ;start from 0

 increase_even:
     add eax, 2
     mov [evennum], eax      ;load value into evennum
     cmp eax, 20             ;compare values
     jl increase_even        ;if <20 start over

     mov eax, 1              ;sys_exit
     int 0x80



segment .bss
    evennum resb 1

```

## Task 2

```assembly
;Week 5 Activity A Task #2
;find the largest number among 5 integers

section .text
    global _start

_start:
    mov eax, [num1]      ;set eax as num1
    cmp eax, [num2]      ;compare num1 with num2
    jge compare_num3       ;if value in eax is greater jump to eax_greater
    mov eax, [num2]       ;if num2 greater load into eax


compare_num3:
    cmp eax, [num3]    ;set largest value to eax
    jg compare_num4    ;if eax > num3 move on to compare to num4
    mov eax, [num3]    ;seat eax to num3

compare_num4:
    cmp eax, [num4]
    jg compare_num5
    mov eax, [num4]

compare_num5:
    cmp eax, [num5]
    jg exit
    mov eax, [num5]

exit:
    mov [largest], eax   ;set largest value to largest var
    mov eax, 1
    int 0x80

segment .bss
    largest resb 2

section .data
    num1 dd 10
    num2 dd 15
    num3 dd 50
    num4 dd 5
    num5 dd 1

```

## Challenges
I found it challenging to determine which conditional jump to use and at which point they should be used. It took a lot of trial and error dwbugging with gdb for Task #2.
