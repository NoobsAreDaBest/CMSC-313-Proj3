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
        .text
        .globl  main
        .type   main, @function
main:
.LFB22:
        .cfi_startproc
        pushq   %r15
        .cfi_def_cfa_offset 16
        .cfi_offset 15, -16
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
        movl    $.LC0, %esi
        movl    $.LC1, %edi
        call    fopen
        testq   %rax, %rax
        je      .L15
        movq    %rax, %r15
        movl    $0, %r14d
        jmp     .L2
.L5:
        movl    $46, %edi
        call    putchar
.L6:
        addq    $1, %rbp
        cmpq    %r13, %rbp
        je      .L16
.L7:
        movzbl  0(%rbp), %edi
        leal    -32(%rdi), %eax
        cmpb    $94, %al
        ja      .L5
        movsbl  %dil, %edi
        call    putchar
        jmp     .L6
.L16:
        movl    $10, %edi
        call    putchar
.L2:
        movq    %r15, %rcx
        movl    $16, %edx
        movl    $1, %esi
        movq    %rsp, %rdi
        call    fread
        movq    %rax, %r13
        testq   %rax, %rax
        je      .L17
        movl    %r14d, %esi
        movl    $.LC2, %edi
        movl    $0, %eax
        call    printf
        addl    %r13d, %r14d
        movq    %rsp, %rbp
        leaq    16(%rsp), %r12
        movq    %rbp, %rbx
.L4:
        movzbl  (%rbx), %esi
        movl    $.LC3, %edi
        movl    $0, %eax
        call    printf
        movl    $32, %edi
        call    putchar
        addq    $1, %rbx
        cmpq    %r12, %rbx
        jne     .L4
        movl    $124, %edi
        call    putchar
        addq    %rbp, %r13
        jmp     .L7
.L17:
        movq    %r15, %rdi
        call    fclose
.L9:
        movl    $0, %eax
        addq    $24, %rsp
        .cfi_remember_state
        .cfi_def_cfa_offset 56
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
.L15:
        .cfi_restore_state
        movl    $.LC4, %edi
        movl    $0, %eax
        call    printf
        jmp     .L9
        .cfi_endproc
.LFE22:
        .size   main, .-main
        .ident  "GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
        .section        .note.GNU-stack,"",@progbits