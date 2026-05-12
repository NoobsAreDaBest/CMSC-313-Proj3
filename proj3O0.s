        .file   "proj3.c"
        .text
        .section        .rodata
.LC0:
        .string "r"
.LC1:
        .string "binary.out"
.LC2:
        .string "%08x "
.LC3:
        .string "%02x"
.LC4:
        .string "The file could not be opened"
        .text
        .globl  main
        .type   main, @function
main:
.LFB6:
        .cfi_startproc
        pushq   %rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        movq    %rsp, %rbp
        .cfi_def_cfa_register 6
        subq    $48, %rsp
        movq    $0, -24(%rbp)
        movl    $.LC0, %esi
        movl    $.LC1, %edi
        call    fopen
        movq    %rax, -24(%rbp)
        cmpq    $0, -24(%rbp)
        je      .L2
        movl    $0, -4(%rbp)
        jmp     .L3
.L10:
        movl    -4(%rbp), %eax
        movl    %eax, %esi
        movl    $.LC2, %edi
        movl    $0, %eax
        call    printf
        movq    -32(%rbp), %rax
        movl    %eax, %edx
        movl    -4(%rbp), %eax
        addl    %edx, %eax
        movl    %eax, -4(%rbp)
        movl    $0, -8(%rbp)
        jmp     .L4
.L5:
        movl    -8(%rbp), %eax
        cltq
        movzbl  -48(%rbp,%rax), %eax
        movzbl  %al, %eax
        movl    %eax, %esi
        movl    $.LC3, %edi
        movl    $0, %eax
        call    printf
        movl    $32, %edi
        call    putchar
        addl    $1, -8(%rbp)
.L4:
        cmpl    $15, -8(%rbp)
        jle     .L5
        movl    $124, %edi
        call    putchar
        movl    $0, -12(%rbp)
        jmp     .L6
.L9:
        movl    -12(%rbp), %eax
        cltq
        movzbl  -48(%rbp,%rax), %eax
        cmpb    $31, %al
        jle     .L7
        movl    -12(%rbp), %eax
        cltq
        movzbl  -48(%rbp,%rax), %eax
        cmpb    $127, %al
        je      .L7
        movl    -12(%rbp), %eax
        cltq
        movzbl  -48(%rbp,%rax), %eax
        movsbl  %al, %eax
        movl    %eax, %edi
        call    putchar
        jmp     .L8
.L7:
        movl    $46, %edi
        call    putchar
.L8:
        addl    $1, -12(%rbp)
.L6:
        movl    -12(%rbp), %eax
        cltq
        cmpq    %rax, -32(%rbp)
        ja      .L9
        movl    $10, %edi
        call    putchar
.L3:
        movq    -24(%rbp), %rdx
        leaq    -48(%rbp), %rax
        movq    %rdx, %rcx
        movl    $16, %edx
        movl    $1, %esi
        movq    %rax, %rdi
        call    fread
        movq    %rax, -32(%rbp)
        cmpq    $0, -32(%rbp)
        jne     .L10
        movq    -24(%rbp), %rax
        movq    %rax, %rdi
        call    fclose
        movq    $0, -24(%rbp)
        jmp     .L11
.L2:
        movl    $.LC4, %edi
        movl    $0, %eax
        call    printf
.L11:
        movl    $0, %eax
        leave
        .cfi_def_cfa 7, 8
        ret
        .cfi_endproc
.LFE6:
        .size   main, .-main
        .ident  "GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
        .section        .note.GNU-stack,"",@progbits