# Activity B

## Task 1
```
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


## Task 2
```
;Week 5 Activity A Task #2
;ths program generates a sequence of even numbers up to 20

section .text
    global _start

 _start:
     mov eax, 0     ;start from 0

 increase_even:
     add eax, 2
     mov [evennum], eax      ;load value into evennum
     cmp eax, 20             ;check if number is <20
     jl increase_even        ;if <20 start over

     mov eax, 1              ;sys_exit
     int 0x80



segment .bss
    evennum resb 1
```

## Task 3
```
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
