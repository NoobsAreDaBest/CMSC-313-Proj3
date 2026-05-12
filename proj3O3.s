        .file   "proj3.c"
        .text
        .section        .rodata.str1.1,"aMS",@progbits,1
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
        .section        .text.startup,"ax",@progbits
        .p2align 4
        .globl  main
        .type   main, @function
main:
.LFB22:
        .cfi_startproc
        pushq   %r15
        .cfi_def_cfa_offset 16
        .cfi_offset 15, -16
        movl    $.LC0, %esi
        movl    $.LC1, %edi
        pushq   %r14
        .cfi_def_cfa_offset 24
        .cfi_offset 14, -24
        pushq   %r13
        .cfi_def_cfa_offset 32
        .cfi_offset 13, -32
        pushq   %r12
        .cfi_def_cfa_offset 40
        .cfi_offset 12, -40
        pushq   %rbp
        .cfi_def_cfa_offset 48
        .cfi_offset 6, -48
        pushq   %rbx
        .cfi_def_cfa_offset 56
        .cfi_offset 3, -56
        subq    $24, %rsp
        .cfi_def_cfa_offset 80
        call    fopen
        testq   %rax, %rax
        je      .L17
        movq    %rax, %r15
        xorl    %r14d, %r14d
        leaq    16(%rsp), %r12
        .p2align 4,,10
        .p2align 3
.L2:
        movq    %r15, %rcx
        movl    $16, %edx
        movl    $1, %esi
        movq    %rsp, %rdi
        call    fread
        movq    %rax, %r13
        testq   %rax, %rax
        je      .L18
        movl    %r14d, %esi
        movl    $.LC2, %edi
        xorl    %eax, %eax
        addl    %r13d, %r14d
        call    printf
        movq    %rsp, %rbp
        movq    %rsp, %rbx
        .p2align 4,,10
        .p2align 3
.L4:
        movzbl  (%rbx), %esi
        movl    $.LC3, %edi
        xorl    %eax, %eax
        addq    $1, %rbx
        call    printf
        movl    $32, %edi
        call    putchar
        cmpq    %r12, %rbx
        jne     .L4
        movl    $124, %edi
        addq    %rsp, %r13
        call    putchar
        .p2align 4,,10
        .p2align 3
.L7:
        movsbl  0(%rbp), %edi
        leal    -32(%rdi), %eax
        cmpb    $94, %al
        jbe     .L15
        movl    $46, %edi
.L15:
        call    putchar
        addq    $1, %rbp
        cmpq    %rbp, %r13
        jne     .L7
        movl    $10, %edi
        call    putchar
        jmp     .L2
.L18:
        movq    %r15, %rdi
        call    fclose
.L9:
        addq    $24, %rsp
        .cfi_remember_state
        .cfi_def_cfa_offset 56
        xorl    %eax, %eax
        popq    %rbx
        .cfi_def_cfa_offset 48
        popq    %rbp
        .cfi_def_cfa_offset 40
        popq    %r12
        .cfi_def_cfa_offset 32
        popq    %r13
        .cfi_def_cfa_offset 24
        popq    %r14
        .cfi_def_cfa_offset 16
        popq    %r15
        .cfi_def_cfa_offset 8
        ret
.L17:
        .cfi_restore_state
        movl    $.LC4, %edi
        xorl    %eax, %eax
        call    printf
        jmp     .L9
        .cfi_endproc
.LFE22:
        .size   main, .-main
        .ident  "GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
        .section        .note.GNU-stack,"",@progbits