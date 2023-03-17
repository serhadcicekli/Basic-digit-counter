global _start
section .data
    msg db "Starting to count...", 0x0a
    len equ $ - msg
    endm db "Count ended!!", 0x0a
    eln equ $ - endm
    nlch db 0x0a
    n0 db "0"
    n1 db "1"
    n2 db "2"
    n3 db "3"
    n4 db "4"
    n5 db "5"
    n6 db "6"
    n7 db "7"
    n8 db "8"
    n9 db "9"
section .text
    newl:
        pushad
        mov eax, 4
        mov ebx, 1
        mov ecx, nlch
        mov edx, 1
        int 0x80
        popad
        ret
    print_digit:
        pushad
        cmp eax, 0
        je .d0
        cmp eax, 1
        je .d1
        cmp eax, 2
        je .d2
        cmp eax, 3
        je .d3
        cmp eax, 4
        je .d4
        cmp eax, 5
        je .d5
        cmp eax, 6
        je .d6
        cmp eax, 7
        je .d7
        cmp eax, 8
        je .d8
        cmp eax, 9
        je .d9
        jmp .d0
        .d0:
            mov ecx, n0
            jmp .lstlab
        .d1:
            mov ecx, n1
            jmp .lstlab
        .d2:
            mov ecx, n2
            jmp .lstlab
        .d3:
            mov ecx, n3
            jmp .lstlab
        .d4:
            mov ecx, n4
            jmp .lstlab
        .d5:
            mov ecx, n5
            jmp .lstlab
        .d6:
            mov ecx, n6
            jmp .lstlab
        .d7:
            mov ecx, n7
            jmp .lstlab
        .d8:
            mov ecx, n8
            jmp .lstlab
        .d9:
            mov ecx, n9
        .lstlab:
        mov eax, 4
        mov ebx, 1
        mov edx, 1
        int 0x80
        popad
        ret
    _start:
        mov eax, 4
        mov ebx, 1
        mov ecx, msg
        mov edx, len
        int 0x80
        mov eax, 0
        mov ebx, 10
    .ls:
        call print_digit
        call newl
        push ecx
        mov ecx, 1
        add eax, ecx
        pop ecx
        cmp eax, ebx
        jne .ls
        mov eax, 4
        mov ebx, 1
        mov ecx, endm
        mov edx, eln
        int 0x80
        mov eax, 1
        mov ebx, 0
        int 0x80
