	.file	"main.cpp"
	.text
	.section .rdata,"dr"
.LC3:
	.ascii "BYG Space Survival\0"
.LC7:
	.ascii "vector::_M_realloc_append\0"
.LC16:
	.ascii "TIME: %.1f\0"
.LC17:
	.ascii "SHIP DESTROYED\0"
.LC18:
	.ascii "Press R to restart\0"
	.section	.text.startup,"x"
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB1289:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$200, %rsp
	.seh_stackalloc	200
	movaps	%xmm6, 64(%rsp)
	.seh_savexmm	%xmm6, 64
	movaps	%xmm7, 80(%rsp)
	.seh_savexmm	%xmm7, 80
	movaps	%xmm8, 96(%rsp)
	.seh_savexmm	%xmm8, 96
	movaps	%xmm9, 112(%rsp)
	.seh_savexmm	%xmm9, 112
	movaps	%xmm10, 128(%rsp)
	.seh_savexmm	%xmm10, 128
	movaps	%xmm11, 144(%rsp)
	.seh_savexmm	%xmm11, 144
	movaps	%xmm12, 160(%rsp)
	.seh_savexmm	%xmm12, 160
	movaps	%xmm13, 176(%rsp)
	.seh_savexmm	%xmm13, 176
	.seh_endprologue
	xorps	%xmm9, %xmm9
	xorl	%ebp, %ebp
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	movaps	%xmm9, %xmm8
	call	__main
	movl	$600, %edx
	movl	$800, %ecx
	leaq	.LC3(%rip), %r8
.LEHB0:
	call	InitWindow
	movl	$60, %ecx
	call	SetTargetFPS
.LEHE0:
	movss	.LC1(%rip), %xmm7
	movss	.LC2(%rip), %xmm6
	movss	.LC8(%rip), %xmm10
.L2:
.LEHB1:
	call	WindowShouldClose
	testb	%al, %al
	jne	.L72
	call	GetFrameTime
	movaps	%xmm0, %xmm11
	testb	%r12b, %r12b
	jne	.L3
	movl	$263, %ecx
	call	IsKeyDown
	testb	%al, %al
	je	.L4
	movss	.LC4(%rip), %xmm0
	mulss	%xmm11, %xmm0
	subss	%xmm0, %xmm6
.L4:
	movl	$262, %ecx
	call	IsKeyDown
	testb	%al, %al
	je	.L5
	movss	.LC4(%rip), %xmm0
	mulss	%xmm11, %xmm0
	addss	%xmm0, %xmm6
.L5:
	movl	$265, %ecx
	call	IsKeyDown
	testb	%al, %al
	je	.L6
	movss	.LC4(%rip), %xmm0
	mulss	%xmm11, %xmm0
	subss	%xmm0, %xmm7
.L6:
	movl	$264, %ecx
	call	IsKeyDown
	testb	%al, %al
	je	.L7
	movss	.LC4(%rip), %xmm0
	mulss	%xmm11, %xmm0
	addss	%xmm0, %xmm7
.L7:
	addss	%xmm11, %xmm8
	comiss	.LC5(%rip), %xmm8
	jb	.L8
	movl	$790, %edx
	movl	$10, %ecx
	call	GetRandomValue
	movl	$300, %edx
	cvtsi2ssl	%eax, %xmm13
	movl	$150, %ecx
	call	GetRandomValue
	movl	$22, %edx
	cvtsi2ssl	%eax, %xmm12
	movl	$10, %ecx
	call	GetRandomValue
	cvtsi2ssl	%eax, %xmm8
	cmpq	%rsi, %rbp
	je	.L10
	movl	$0xc1a00000, 4(%rsi)
	movq	%rbx, %r14
	addq	$16, %rsi
	movss	%xmm13, -16(%rsi)
	movss	%xmm12, -8(%rsi)
	movss	%xmm8, -4(%rsi)
	jmp	.L11
.L10:
	movabsq	$576460752303423487, %rdx
	movq	%rbp, %r15
	subq	%rbx, %r15
	movq	%r15, %rax
	sarq	$4, %rax
	cmpq	%rdx, %rax
	jne	.L12
	leaq	.LC7(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L12:
	testq	%rax, %rax
	movl	$1, %r13d
	cmovne	%rax, %r13
	addq	%rax, %r13
	movabsq	$576460752303423487, %rax
	cmpq	%rax, %r13
	cmova	%rax, %r13
	salq	$4, %r13
	movq	%r13, %rcx
	call	_Znwy
	movl	$0xc1a00000, 4(%rax,%r15)
	movq	%rax, %r14
	movss	%xmm13, (%rax,%r15)
	movss	%xmm12, 8(%rax,%r15)
	movss	%xmm8, 12(%rax,%r15)
	testq	%r15, %r15
	je	.L13
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rcx
	rep movsb
.L13:
	leaq	16(%r14,%r15), %rsi
	testq	%rbx, %rbx
	je	.L14
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	subq	%rbx, %rdx
	call	_ZdlPvy
.L14:
	leaq	(%r14,%r13), %rbp
.L11:
	movq	%r14, %rbx
	xorps	%xmm8, %xmm8
.L8:
	movaps	%xmm10, %xmm1
	movss	.LC9(%rip), %xmm0
	movq	%rbx, %r13
	maxss	%xmm6, %xmm1
	movaps	%xmm0, %xmm6
	cmpltss	%xmm1, %xmm6
	andps	%xmm6, %xmm0
	andnps	%xmm1, %xmm6
	movaps	%xmm10, %xmm1
	maxss	%xmm7, %xmm1
	orps	%xmm0, %xmm6
	movss	.LC10(%rip), %xmm0
	movaps	%xmm0, %xmm7
	cmpltss	%xmm1, %xmm7
	andps	%xmm7, %xmm0
	andnps	%xmm1, %xmm7
	orps	%xmm0, %xmm7
.L19:
	cmpq	%rsi, %r13
	je	.L73
	movss	8(%r13), %xmm0
	movd	%xmm7, %eax
	movd	%xmm6, %ecx
	movss	12(%r13), %xmm3
	salq	$32, %rax
	movss	.LC11(%rip), %xmm1
	mulss	%xmm11, %xmm0
	orq	%rax, %rcx
	addss	4(%r13), %xmm0
	movss	%xmm0, 4(%r13)
	movq	0(%r13), %r8
	call	CheckCollisionCircles
	orl	%eax, %r12d
	addq	$16, %r13
	jmp	.L19
.L73:
	movq	%rsi, %rdx
	addss	%xmm11, %xmm9
	subq	%rbx, %rdx
	sarq	$4, %rdx
	leal	-1(%rdx), %edi
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rbx, %rdx
.L21:
	testl	%edi, %edi
	js	.L27
	movss	-12(%rdx), %xmm0
	comiss	.LC12(%rip), %xmm0
	leaq	-16(%rdx), %rcx
	jbe	.L22
	cmpq	%rdx, %rsi
	je	.L24
	movq	%rsi, %r8
	subq	%rdx, %r8
	cmpq	$16, %r8
	jle	.L25
	call	memmove
	movq	%rax, %rcx
	jmp	.L24
.L25:
	jne	.L24
	movups	(%rdx), %xmm4
	movups	%xmm4, -16(%rdx)
.L24:
	subq	$16, %rsi
.L22:
	decl	%edi
	movq	%rcx, %rdx
	jmp	.L21
.L3:
	movl	$82, %ecx
	call	IsKeyPressed
	testb	%al, %al
	je	.L27
	xorps	%xmm9, %xmm9
	movss	.LC1(%rip), %xmm7
	movq	%rbx, %rsi
	xorl	%r12d, %r12d
	movss	.LC2(%rip), %xmm6
	movaps	%xmm9, %xmm8
.L27:
	call	BeginDrawing
	movl	$-14939643, %ecx
	call	ClearBackground
	movl	$71, %edi
	movl	$37, %r15d
	movl	$600, %r13d
	movl	$800, %r14d
.L28:
	movl	%edi, %eax
	movl	$-1259946346, %r8d
	cltd
	idivl	%r13d
	movl	%r15d, %eax
	movl	%edx, %r9d
	cltd
	idivl	%r14d
	movl	%edx, %ecx
	movl	%r9d, %edx
	call	DrawPixel
	addl	$127, %r15d
	addl	$193, %edi
	cmpl	$12737, %r15d
	jne	.L28
	movq	%rbx, %r13
.L29:
	cmpq	%r13, %rsi
	je	.L74
	movss	12(%r13), %xmm2
	movq	0(%r13), %rcx
	movl	$-11513776, %r8d
	movss	0(%r13), %xmm11
	movss	4(%r13), %xmm12
	movaps	%xmm2, %xmm1
	movss	%xmm2, 60(%rsp)
	call	DrawCircleV
	cvttss2sil	%xmm12, %edx
	movss	60(%rsp), %xmm2
	movl	$-3618616, %r9d
	cvttss2sil	%xmm11, %ecx
	call	DrawCircleLines
	addq	$16, %r13
	jmp	.L29
.L74:
	movd	%xmm7, %eax
	movd	%xmm6, %r13d
	movl	$-16538, 32(%rsp)
	movss	.LC13(%rip), %xmm3
	salq	$32, %rax
	movss	.LC14(%rip), %xmm2
	movl	$3, %edx
	orq	%rax, %r13
	movq	%r13, %rcx
	call	DrawPoly
	movss	.LC15(%rip), %xmm1
	movl	$-1, %r8d
	movq	%r13, %rcx
	call	DrawCircleV
	cvtss2sd	%xmm9, %xmm5
	leaq	.LC16(%rip), %rcx
	movq	%xmm5, %rdx
	movaps	%xmm5, %xmm1
	call	TextFormat
	movl	$-1, 32(%rsp)
	movl	$24, %r9d
	movl	$20, %edx
	movq	%rax, %rcx
	movl	$20, %r8d
	call	DrawText
	testb	%r12b, %r12b
	jne	.L31
.L32:
	call	EndDrawing
	jmp	.L2
.L31:
	movl	$600, %r9d
	movl	$800, %r8d
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movl	$-1442840576, 32(%rsp)
	call	DrawRectangle
	movl	$-13162010, 32(%rsp)
	movl	$40, %r9d
	movl	$240, %r8d
	movl	$220, %edx
	leaq	.LC17(%rip), %rcx
	call	DrawText
	movl	$-1, 32(%rsp)
	movl	$20, %r9d
	movl	$310, %r8d
	movl	$290, %edx
	leaq	.LC18(%rip), %rcx
	call	DrawText
	jmp	.L32
.L72:
	call	CloseWindow
.LEHE1:
	testq	%rbx, %rbx
	je	.L49
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	subq	%rbx, %rdx
	call	_ZdlPvy
	jmp	.L49
.L37:
	movq	%rax, %rsi
.L35:
	testq	%rbx, %rbx
	je	.L36
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	subq	%rbx, %rdx
	call	_ZdlPvy
.L36:
	movq	%rsi, %rcx
.LEHB2:
	call	_Unwind_Resume
	nop
.LEHE2:
.L49:
	movaps	64(%rsp), %xmm6
	movaps	80(%rsp), %xmm7
	xorl	%eax, %eax
	movaps	96(%rsp), %xmm8
	movaps	112(%rsp), %xmm9
	movaps	128(%rsp), %xmm10
	movaps	144(%rsp), %xmm11
	movaps	160(%rsp), %xmm12
	movaps	176(%rsp), %xmm13
	addq	$200, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA1289:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1289-.LLSDACSB1289
.LLSDACSB1289:
	.uleb128 .LEHB0-.LFB1289
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB1289
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L37-.LFB1289
	.uleb128 0
	.uleb128 .LEHB2-.LFB1289
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSE1289:
	.section	.text.startup,"x"
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC1:
	.long	1140457472
	.align 4
.LC2:
	.long	1137180672
	.align 4
.LC4:
	.long	1133903872
	.align 4
.LC5:
	.long	1055286886
	.align 4
.LC8:
	.long	1097859072
	.align 4
.LC9:
	.long	1145323520
	.align 4
.LC10:
	.long	1142046720
	.align 4
.LC11:
	.long	1094713344
	.align 4
.LC12:
	.long	1143111680
	.align 4
.LC13:
	.long	-1028390912
	.align 4
.LC14:
	.long	1099956224
	.align 4
.LC15:
	.long	1084227584
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (MinGW-W64 x86_64-msvcrt-posix-seh, built by Brecht Sanders, r1) 15.2.0"
	.def	InitWindow;	.scl	2;	.type	32;	.endef
	.def	SetTargetFPS;	.scl	2;	.type	32;	.endef
	.def	WindowShouldClose;	.scl	2;	.type	32;	.endef
	.def	GetFrameTime;	.scl	2;	.type	32;	.endef
	.def	IsKeyDown;	.scl	2;	.type	32;	.endef
	.def	GetRandomValue;	.scl	2;	.type	32;	.endef
	.def	_ZSt20__throw_length_errorPKc;	.scl	2;	.type	32;	.endef
	.def	_Znwy;	.scl	2;	.type	32;	.endef
	.def	_ZdlPvy;	.scl	2;	.type	32;	.endef
	.def	CheckCollisionCircles;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	IsKeyPressed;	.scl	2;	.type	32;	.endef
	.def	BeginDrawing;	.scl	2;	.type	32;	.endef
	.def	ClearBackground;	.scl	2;	.type	32;	.endef
	.def	DrawPixel;	.scl	2;	.type	32;	.endef
	.def	DrawCircleV;	.scl	2;	.type	32;	.endef
	.def	DrawCircleLines;	.scl	2;	.type	32;	.endef
	.def	DrawPoly;	.scl	2;	.type	32;	.endef
	.def	TextFormat;	.scl	2;	.type	32;	.endef
	.def	DrawText;	.scl	2;	.type	32;	.endef
	.def	EndDrawing;	.scl	2;	.type	32;	.endef
	.def	DrawRectangle;	.scl	2;	.type	32;	.endef
	.def	CloseWindow;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
