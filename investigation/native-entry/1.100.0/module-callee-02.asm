
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  69d400: 41 57                        	pushq	%r15
  69d402: 41 56                        	pushq	%r14
  69d404: 41 55                        	pushq	%r13
  69d406: 41 54                        	pushq	%r12
  69d408: 53                           	pushq	%rbx
  69d409: 48 81 ec 90 00 00 00         	subq	$0x90, %rsp
  69d410: 49 89 d4                     	movq	%rdx, %r12
  69d413: 49 89 f7                     	movq	%rsi, %r15
  69d416: 48 89 fb                     	movq	%rdi, %rbx
  69d419: 48 89 f7                     	movq	%rsi, %rdi
  69d41c: ff 15 0e ab 45 00            	callq	*0x45ab0e(%rip)         # 0xaf7f30 ; ELF relocation: PyModule_GetNameObject
  69d422: 48 85 c0                     	testq	%rax, %rax
  69d425: 0f 84 a9 00 00 00            	je	0x69d4d4 <PyInit__native+0x420dd4>
  69d42b: 49 89 c6                     	movq	%rax, %r14
  69d42e: 45 31 ed                     	xorl	%r13d, %r13d
  69d431: 4c 89 e7                     	movq	%r12, %rdi
  69d434: 4c 89 fe                     	movq	%r15, %rsi
  69d437: 48 89 c2                     	movq	%rax, %rdx
  69d43a: 31 c9                        	xorl	%ecx, %ecx
  69d43c: ff 15 f6 aa 45 00            	callq	*0x45aaf6(%rip)         # 0xaf7f38 ; ELF relocation: PyCMethod_New
  69d442: 48 85 c0                     	testq	%rax, %rax
  69d445: 75 6d                        	jne	0x69d4b4 <PyInit__native+0x420db4>
  69d447: 48 8d 7c 24 48               	leaq	0x48(%rsp), %rdi
  69d44c: e8 ff 3d ff ff               	callq	0x691250 <PyInit__native+0x414b50>
  69d451: 83 7c 24 48 01               	cmpl	$0x1, 0x48(%rsp)
  69d456: 0f 85 01 01 00 00            	jne	0x69d55d <PyInit__native+0x420e5d>
  69d45c: 0f 10 44 24 50               	movups	0x50(%rsp), %xmm0
  69d461: 0f 10 4c 24 60               	movups	0x60(%rsp), %xmm1
  69d466: 0f 10 54 24 70               	movups	0x70(%rsp), %xmm2
  69d46b: 0f 10 9c 24 80 00 00 00      	movups	0x80(%rsp), %xmm3
  69d473: 0f 29 5c 24 30               	movaps	%xmm3, 0x30(%rsp)
  69d478: 0f 29 54 24 20               	movaps	%xmm2, 0x20(%rsp)
  69d47d: 0f 29 4c 24 10               	movaps	%xmm1, 0x10(%rsp)
  69d482: 0f 29 04 24                  	movaps	%xmm0, (%rsp)
  69d486: 48 8b 04 24                  	movq	(%rsp), %rax
  69d48a: 48 8b 4c 24 38               	movq	0x38(%rsp), %rcx
  69d48f: 48 89 4b 40                  	movq	%rcx, 0x40(%rbx)
  69d493: 0f 10 44 24 28               	movups	0x28(%rsp), %xmm0
  69d498: 0f 11 43 30                  	movups	%xmm0, 0x30(%rbx)
  69d49c: 0f 10 44 24 18               	movups	0x18(%rsp), %xmm0
  69d4a1: 0f 11 43 20                  	movups	%xmm0, 0x20(%rbx)
  69d4a5: 0f 10 44 24 08               	movups	0x8(%rsp), %xmm0
  69d4aa: 0f 11 43 10                  	movups	%xmm0, 0x10(%rbx)
  69d4ae: 41 bd 01 00 00 00            	movl	$0x1, %r13d
  69d4b4: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  69d4b8: 4c 89 2b                     	movq	%r13, (%rbx)
  69d4bb: 4c 89 f7                     	movq	%r14, %rdi
  69d4be: 48 81 c4 90 00 00 00         	addq	$0x90, %rsp
  69d4c5: 5b                           	popq	%rbx
  69d4c6: 41 5c                        	popq	%r12
  69d4c8: 41 5d                        	popq	%r13
  69d4ca: 41 5e                        	popq	%r14
  69d4cc: 41 5f                        	popq	%r15
  69d4ce: ff 25 d4 a3 45 00            	jmpq	*0x45a3d4(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  69d4d4: 48 8d 7c 24 48               	leaq	0x48(%rsp), %rdi
  69d4d9: e8 72 3d ff ff               	callq	0x691250 <PyInit__native+0x414b50>
  69d4de: 83 7c 24 48 01               	cmpl	$0x1, 0x48(%rsp)
  69d4e3: 75 6e                        	jne	0x69d553 <PyInit__native+0x420e53>
  69d4e5: 0f 10 44 24 50               	movups	0x50(%rsp), %xmm0
  69d4ea: 0f 10 4c 24 60               	movups	0x60(%rsp), %xmm1
  69d4ef: 0f 10 54 24 70               	movups	0x70(%rsp), %xmm2
  69d4f4: 0f 10 9c 24 80 00 00 00      	movups	0x80(%rsp), %xmm3
  69d4fc: 0f 29 5c 24 30               	movaps	%xmm3, 0x30(%rsp)
  69d501: 0f 29 54 24 20               	movaps	%xmm2, 0x20(%rsp)
  69d506: 0f 29 4c 24 10               	movaps	%xmm1, 0x10(%rsp)
  69d50b: 0f 29 04 24                  	movaps	%xmm0, (%rsp)
  69d50f: 48 8b 04 24                  	movq	(%rsp), %rax
  69d513: 48 8b 4c 24 38               	movq	0x38(%rsp), %rcx
  69d518: 48 89 4b 40                  	movq	%rcx, 0x40(%rbx)
  69d51c: 0f 10 44 24 28               	movups	0x28(%rsp), %xmm0
  69d521: 0f 11 43 30                  	movups	%xmm0, 0x30(%rbx)
  69d525: 0f 10 44 24 18               	movups	0x18(%rsp), %xmm0
  69d52a: 0f 11 43 20                  	movups	%xmm0, 0x20(%rbx)
  69d52e: 0f 10 44 24 08               	movups	0x8(%rsp), %xmm0
  69d533: 0f 11 43 10                  	movups	%xmm0, 0x10(%rbx)
  69d537: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  69d53b: 48 c7 03 01 00 00 00         	movq	$0x1, (%rbx)
  69d542: 48 81 c4 90 00 00 00         	addq	$0x90, %rsp
  69d549: 5b                           	popq	%rbx
  69d54a: 41 5c                        	popq	%r12
  69d54c: 41 5d                        	popq	%r13
  69d54e: 41 5e                        	popq	%r14
  69d550: 41 5f                        	popq	%r15
  69d552: c3                           	retq
  69d553: 48 89 e7                     	movq	%rsp, %rdi
  69d556: e8 35 3f ff ff               	callq	0x691490 <PyInit__native+0x414d90>
  69d55b: eb b2                        	jmp	0x69d50f <PyInit__native+0x420e0f>
  69d55d: 48 89 e7                     	movq	%rsp, %rdi
  69d560: e8 2b 3f ff ff               	callq	0x691490 <PyInit__native+0x414d90>
  69d565: e9 1c ff ff ff               	jmp	0x69d486 <PyInit__native+0x420d86>
  69d56a: 48 89 c3                     	movq	%rax, %rbx
  69d56d: 4c 89 f7                     	movq	%r14, %rdi
  69d570: ff 15 32 a3 45 00            	callq	*0x45a332(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  69d576: 48 89 df                     	movq	%rbx, %rdi
  69d579: e8 52 08 42 00               	callq	0xabddd0 <_Unwind_Resume@plt>
