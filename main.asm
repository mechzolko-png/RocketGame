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
	.section	.text.unlikely,"x"
.LCOLDB19:
	.section	.text.startup,"x"
.LHOTB19:
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB1289:
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
	subq	$216, %rsp
	.seh_stackalloc	216
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
	movaps	%xmm14, 192(%rsp)
	.seh_savexmm	%xmm14, 192
	.seh_endprologue
	call	__main
	movl	$600, %edx
	movl	$800, %ecx
	leaq	.LC3(%rip), %r8
.LEHB0:
	call	InitWindow
	movl	$60, %ecx
	call	SetTargetFPS
.LEHE0:
.LEHB1:
	call	WindowShouldClose
.LEHE1:
	testb	%al, %al
	jne	.L91
.LEHB2:
	call	GetFrameTime
.LEHE2:
	pxor	%xmm8, %xmm8
	movaps	%xmm0, %xmm12
	xorl	%ebp, %ebp
	xorl	%edi, %edi
	movss	.LC0(%rip), %xmm7
	xorl	%ebx, %ebx
	movaps	%xmm8, %xmm9
	movss	.LC1(%rip), %xmm6
	movss	.LC4(%rip), %xmm11
	movss	.LC8(%rip), %xmm10
.L34:
	movl	$263, %ecx
.LEHB3:
	call	IsKeyDown
	testb	%al, %al
	je	.L5
	movaps	%xmm12, %xmm0
	mulss	%xmm11, %xmm0
	subss	%xmm0, %xmm6
.L5:
	movl	$262, %ecx
	call	IsKeyDown
	testb	%al, %al
	je	.L6
	movaps	%xmm12, %xmm0
	mulss	%xmm11, %xmm0
	addss	%xmm0, %xmm6
.L6:
	movl	$265, %ecx
	call	IsKeyDown
	testb	%al, %al
	je	.L7
	movss	.LC4(%rip), %xmm0
	mulss	%xmm12, %xmm0
	subss	%xmm0, %xmm7
.L7:
	movl	$264, %ecx
	call	IsKeyDown
	testb	%al, %al
	je	.L8
	movss	.LC4(%rip), %xmm0
	mulss	%xmm12, %xmm0
	addss	%xmm0, %xmm7
.L8:
	addss	%xmm12, %xmm9
	comiss	.LC5(%rip), %xmm9
	jnb	.L92
.L9:
	movaps	%xmm10, %xmm1
	movss	.LC9(%rip), %xmm0
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
	cmpq	%rdi, %rbx
	je	.L44
	movss	.LC11(%rip), %xmm13
	movq	%rdi, %r12
	xorl	%esi, %esi
	.p2align 4
	.p2align 3
.L21:
	movss	8(%r12), %xmm0
	movd	%xmm7, %eax
	movd	%xmm6, %ecx
	movss	12(%r12), %xmm3
	salq	$32, %rax
	movaps	%xmm13, %xmm1
	mulss	%xmm12, %xmm0
	orq	%rax, %rcx
	addss	4(%r12), %xmm0
	movss	%xmm0, 4(%r12)
	movq	(%r12), %r8
	call	CheckCollisionCircles
	addq	$16, %r12
	orl	%eax, %esi
	cmpq	%r12, %rbx
	jne	.L21
	movq	%rbx, %rax
	subq	%rdi, %rax
	sarq	$4, %rax
	testl	%eax, %eax
	jle	.L20
	movslq	%eax, %rdx
	subl	$1, %eax
	salq	$4, %rdx
	salq	$4, %rax
	leaq	-16(%rdi,%rdx), %r12
	leaq	(%rdi,%rdx), %rcx
	subq	%rax, %r12
	jmp	.L26
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L22:
	cmpq	%rcx, %r12
	je	.L20
.L26:
	movq	%rcx, %rdx
	subq	$16, %rcx
	movss	-12(%rdx), %xmm0
	comiss	.LC12(%rip), %xmm0
	jbe	.L22
	cmpq	%rbx, %rdx
	je	.L24
	movq	%rbx, %r8
	subq	%rdx, %r8
	cmpq	$16, %r8
	jle	.L25
	call	memmove
	movq	%rax, %rcx
.L24:
	subq	$16, %rbx
	cmpq	%rcx, %r12
	jne	.L26
.L20:
	movss	.LC15(%rip), %xmm14
	addss	%xmm12, %xmm8
.L43:
	call	BeginDrawing
	movl	$-14939643, %ecx
	call	ClearBackground
	movl	$71, %r12d
	movl	$37, %r13d
	.p2align 4
	.p2align 3
.L28:
	movl	%r12d, %eax
	movl	%r12d, %edx
	movl	%r13d, %ecx
	movl	$-1259946346, %r8d
	imulq	$458129845, %rax, %rax
	shrq	$38, %rax
	imull	$600, %eax, %eax
	subl	%eax, %edx
	movl	%r13d, %eax
	imulq	$1374389535, %rax, %rax
	shrq	$40, %rax
	imull	$800, %eax, %eax
	subl	%eax, %ecx
	call	DrawPixel
	addl	$193, %r12d
	addl	$127, %r13d
	cmpl	$19371, %r12d
	jne	.L28
	cmpq	%rdi, %rbx
	je	.L29
	movq	%rdi, %r12
	.p2align 4
	.p2align 3
.L30:
	movq	(%r12), %rcx
	movss	12(%r12), %xmm2
	movl	$-11513776, %r8d
	movss	(%r12), %xmm12
	movss	4(%r12), %xmm13
	movaps	%xmm2, %xmm1
	movss	%xmm2, 56(%rsp)
	call	DrawCircleV
	cvttss2sil	%xmm13, %edx
	movss	56(%rsp), %xmm2
	movl	$-3618616, %r9d
	cvttss2sil	%xmm12, %ecx
	call	DrawCircleLines
	addq	$16, %r12
	cmpq	%r12, %rbx
	jne	.L30
.L29:
	movaps	%xmm6, %xmm4
	movl	$-16538, 32(%rsp)
	movss	.LC13(%rip), %xmm3
	movl	$3, %edx
	unpcklps	%xmm7, %xmm4
	movss	.LC14(%rip), %xmm2
	movq	%xmm4, %rcx
	movq	%xmm4, 56(%rsp)
	call	DrawPoly
	movq	56(%rsp), %rcx
	movl	$-1, %r8d
	movaps	%xmm14, %xmm1
	call	DrawCircleV
	pxor	%xmm1, %xmm1
	leaq	.LC16(%rip), %rcx
	cvtss2sd	%xmm8, %xmm1
	movq	%xmm1, %rdx
	call	TextFormat
	movl	$-1, 32(%rsp)
	movl	$24, %r9d
	movl	$20, %edx
	movq	%rax, %rcx
	movl	$20, %r8d
	call	DrawText
	testb	%sil, %sil
	jne	.L31
	call	EndDrawing
	call	WindowShouldClose
	testb	%al, %al
	jne	.L33
	call	GetFrameTime
	movaps	%xmm0, %xmm12
	jmp	.L34
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
	call	EndDrawing
	call	WindowShouldClose
	testb	%al, %al
	jne	.L33
	call	GetFrameTime
	movl	$82, %ecx
	call	IsKeyPressed
	testb	%al, %al
	je	.L43
	pxor	%xmm8, %xmm8
	movss	.LC0(%rip), %xmm7
	movq	%rdi, %rbx
	xorl	%esi, %esi
	movss	.LC1(%rip), %xmm6
	movaps	%xmm8, %xmm9
	jmp	.L43
.L92:
	movl	$790, %edx
	movl	$10, %ecx
	call	GetRandomValue
	pxor	%xmm9, %xmm9
	movl	$300, %edx
	movl	$150, %ecx
	cvtsi2ssl	%eax, %xmm9
	call	GetRandomValue
	pxor	%xmm13, %xmm13
	movl	$22, %edx
	movl	$10, %ecx
	cvtsi2ssl	%eax, %xmm13
	call	GetRandomValue
	pxor	%xmm14, %xmm14
	cvtsi2ssl	%eax, %xmm14
	cmpq	%rbx, %rbp
	je	.L11
	movss	.LC6(%rip), %xmm0
	unpcklps	%xmm14, %xmm13
	addq	$16, %rbx
	unpcklps	%xmm0, %xmm9
	movlhps	%xmm13, %xmm9
	movups	%xmm9, -16(%rbx)
.L12:
	pxor	%xmm9, %xmm9
	jmp	.L9
.L91:
	xorl	%ebp, %ebp
	xorl	%edi, %edi
.L33:
	call	CloseWindow
	testq	%rdi, %rdi
	je	.L59
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	subq	%rdi, %rdx
	call	_ZdlPvy
	nop
.L59:
	movaps	64(%rsp), %xmm6
	movaps	80(%rsp), %xmm7
	xorl	%eax, %eax
	movaps	96(%rsp), %xmm8
	movaps	112(%rsp), %xmm9
	movaps	128(%rsp), %xmm10
	movaps	144(%rsp), %xmm11
	movaps	160(%rsp), %xmm12
	movaps	176(%rsp), %xmm13
	movaps	192(%rsp), %xmm14
	addq	$216, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L25:
	jne	.L24
	movdqu	(%rdx), %xmm5
	movups	%xmm5, -16(%rdx)
	jmp	.L24
.L44:
	xorl	%esi, %esi
	jmp	.L20
.L11:
	movabsq	$576460752303423487, %rax
	movq	%rbp, %rbx
	subq	%rdi, %rbx
	movq	%rbx, %rdx
	sarq	$4, %rdx
	cmpq	%rax, %rdx
	je	.L84
	testq	%rdx, %rdx
	movl	$1, %eax
	cmovne	%rdx, %rax
	addq	%rdx, %rax
	movabsq	$576460752303423487, %rdx
	cmpq	%rdx, %rax
	cmova	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rcx
	movq	%rax, %rsi
	call	_Znwy
.LEHE3:
	movss	.LC6(%rip), %xmm0
	unpcklps	%xmm14, %xmm13
	movq	%rax, %r12
	unpcklps	%xmm0, %xmm9
	movlhps	%xmm13, %xmm9
	movups	%xmm9, (%rax,%rbx)
	testq	%rbx, %rbx
	jne	.L93
.L14:
	leaq	16(%r12,%rbx), %rbx
	testq	%rdi, %rdi
	je	.L15
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	subq	%rdi, %rdx
	call	_ZdlPvy
.L15:
	leaq	(%r12,%rsi), %rbp
	movq	%r12, %rdi
	jmp	.L12
.L93:
	movq	%rbx, %r8
	movq	%rdi, %rdx
	movq	%rax, %rcx
	call	memcpy
	jmp	.L14
.L82:
	jmp	.L83
.L47:
.L89:
	movq	%rax, %rbx
	jmp	.L42
.L48:
	jmp	.L89
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
	.uleb128 .L48-.LFB1289
	.uleb128 0
	.uleb128 .LEHB2-.LFB1289
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L47-.LFB1289
	.uleb128 0
	.uleb128 .LEHB3-.LFB1289
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L82-.LFB1289
	.uleb128 0
.LLSDACSE1289:
	.section	.text.startup,"x"
	.seh_endproc
	.section	.text.unlikely,"x"
	.def	main.cold;	.scl	3;	.type	32;	.endef
	.seh_proc	main.cold
	.seh_stackalloc	264
	.seh_savereg	%rbx, 216
	.seh_savereg	%rsi, 224
	.seh_savereg	%rdi, 232
	.seh_savereg	%rbp, 240
	.seh_savexmm	%xmm6, 64
	.seh_savexmm	%xmm7, 80
	.seh_savereg	%r12, 248
	.seh_savereg	%r13, 256
	.seh_savexmm	%xmm8, 96
	.seh_savexmm	%xmm9, 112
	.seh_savexmm	%xmm10, 128
	.seh_savexmm	%xmm11, 144
	.seh_savexmm	%xmm12, 160
	.seh_savexmm	%xmm13, 176
	.seh_savexmm	%xmm14, 192
	.seh_endprologue
main.cold:
.L84:
	leaq	.LC7(%rip), %rcx
.LEHB4:
	call	_ZSt20__throw_length_errorPKc
.LEHE4:
.L46:
.L83:
	movq	%rax, %rbx
	testq	%rdi, %rdi
	je	.L42
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	subq	%rdi, %rdx
	call	_ZdlPvy
.L42:
	movq	%rbx, %rcx
.LEHB5:
	call	_Unwind_Resume
	nop
.LEHE5:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDAC1289:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC1289-.LLSDACSBC1289
.LLSDACSBC1289:
	.uleb128 .LEHB4-.LCOLDB19
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L46-.LCOLDB19
	.uleb128 0
	.uleb128 .LEHB5-.LCOLDB19
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSEC1289:
	.section	.text.unlikely,"x"
	.section	.text.startup,"x"
	.section	.text.unlikely,"x"
	.seh_endproc
.LCOLDE19:
	.section	.text.startup,"x"
.LHOTE19:
	.section .rdata,"dr"
	.align 4
.LC0:
	.long	1140457472
	.align 4
.LC1:
	.long	1137180672
	.align 4
.LC4:
	.long	1133903872
	.align 4
.LC5:
	.long	1055286886
	.align 4
.LC6:
	.long	-1046478848
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
	.def	CheckCollisionCircles;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
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
	.def	IsKeyPressed;	.scl	2;	.type	32;	.endef
	.def	GetRandomValue;	.scl	2;	.type	32;	.endef
	.def	CloseWindow;	.scl	2;	.type	32;	.endef
	.def	_ZdlPvy;	.scl	2;	.type	32;	.endef
	.def	_Znwy;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	_ZSt20__throw_length_errorPKc;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
