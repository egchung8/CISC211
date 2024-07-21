# Activity B

## Flowcharts

![Flowcharts-ActB drawio](https://github.com/user-attachments/assets/f5539d05-dc35-40f7-a4cb-945445c40952)


## Task 1
```assembly
;generate a counter using ebx register

section .text
        global _start

_start:
        mov ebx, 10  ;ebx is a counter register

label:
    inc eax
    dec ebx
    cmp ebx, 0
    jg label

    mov eax,1
    int 0x80
```
In the example counter code using loops, I noticed that as EAX is being increased by 1 in each loop, ECX is decreasing by 1. If I tried to use this code but just change ECX to EBX it will not work as ECX will be the register's whose counter value is decreasing and not EBX. This results in an infinite loop since ebx will never reach 0. This is because loop instructions only use ECX as the counter register.


## Task 2
```assembly
;calculate final number of the first 10 fibonacci numbers starting from 0
; 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55
; Fib Sequence: F(N) = F(N-1) + F(N-2)


section .text
    global _start
    
 _start:
     mov ecx, 9       ;loop counter 
                      ;counter starts at 9 since first 2 num is accounted for
     mov eax, 0       ;start from 0 (first num in seq)
     mov ebx, 1       ;load second number in fib seq to ebx
     
fib_loop:
     add eax, ebx
     mov edx, eax     ;store current number in edx
     mov eax, ebx     ;move ebx to eax
     mov ebx, edx     ;move curr val in edx to ebx
     loop fib_loop
    
     mov [result],edx ;move curr value to final result
     
    mov eax,1         ;sys_exit
    int 0x80
     
segment .bss
    result  resb 2      ;final result
```

## Task 3
```assembly
;Question 3: define array with length 4 and type integer, find the largest element in the array

section .text
    global _start

_start:
        mov eax,3       ;index counter = array size -1
        mov ecx,array   ;move array's address from the memory to the register
        mov ebx,[ecx]   ;add content of the array's first element to ebx


search:
        add ecx,4       ;fetch the next element in array
        cmp ebx,[ecx]   ;compare current value to next value in ecx
        jge greater     ;if ebx > ecx jump to greater
        mov ebx,[ecx]   ;store larger value in ebx, if ecx>ebx replace current value in ebx

greater:
        dec eax         ;if ebx currently holds largest value continue through array
        jnz search

exit:
        mov [largest], ebx
        mov eax,1
        int 0x80

segment .bss
        largest resb 4

section .data
        array dd 5,10,15,1
```

## Challenges 
For Activity B, I found it difficult to grasp how to iterate through an array. I had trouble figuring out if I should make the jump condition based on if the number was greater
or less than the current value in the array.
