
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  691c10: 41 57                        	pushq	%r15
  691c12: 41 56                        	pushq	%r14
  691c14: 41 55                        	pushq	%r13
  691c16: 41 54                        	pushq	%r12
  691c18: 53                           	pushq	%rbx
  691c19: 48 81 ec 90 00 00 00         	subq	$0x90, %rsp
  691c20: 49 89 d4                     	movq	%rdx, %r12
  691c23: 49 89 f7                     	movq	%rsi, %r15
  691c26: 48 89 fb                     	movq	%rdi, %rbx
  691c29: 48 89 f7                     	movq	%rsi, %rdi
  691c2c: ff 15 de 2f 46 00            	callq	*0x462fde(%rip)         # 0xaf4c10 ; ELF relocation: PyModule_GetNameObject
  691c32: 48 85 c0                     	testq	%rax, %rax
  691c35: 0f 84 a9 00 00 00            	je	0x691ce4 <PyInit__native+0x4131a4>
  691c3b: 49 89 c6                     	movq	%rax, %r14
  691c3e: 45 31 ed                     	xorl	%r13d, %r13d
  691c41: 4c 89 e7                     	movq	%r12, %rdi
  691c44: 4c 89 fe                     	movq	%r15, %rsi
  691c47: 48 89 c2                     	movq	%rax, %rdx
  691c4a: 31 c9                        	xorl	%ecx, %ecx
  691c4c: ff 15 c6 2f 46 00            	callq	*0x462fc6(%rip)         # 0xaf4c18 ; ELF relocation: PyCMethod_New
  691c52: 48 85 c0                     	testq	%rax, %rax
  691c55: 75 6d                        	jne	0x691cc4 <PyInit__native+0x413184>
  691c57: 48 8d 7c 24 48               	leaq	0x48(%rsp), %rdi
  691c5c: e8 bf 3e ff ff               	callq	0x685b20 <PyInit__native+0x406fe0>
  691c61: 83 7c 24 48 01               	cmpl	$0x1, 0x48(%rsp)
  691c66: 0f 85 01 01 00 00            	jne	0x691d6d <PyInit__native+0x41322d>
  691c6c: 0f 10 44 24 50               	movups	0x50(%rsp), %xmm0
  691c71: 0f 10 4c 24 60               	movups	0x60(%rsp), %xmm1
  691c76: 0f 10 54 24 70               	movups	0x70(%rsp), %xmm2
  691c7b: 0f 10 9c 24 80 00 00 00      	movups	0x80(%rsp), %xmm3
  691c83: 0f 29 5c 24 30               	movaps	%xmm3, 0x30(%rsp)
  691c88: 0f 29 54 24 20               	movaps	%xmm2, 0x20(%rsp)
  691c8d: 0f 29 4c 24 10               	movaps	%xmm1, 0x10(%rsp)
  691c92: 0f 29 04 24                  	movaps	%xmm0, (%rsp)
  691c96: 48 8b 04 24                  	movq	(%rsp), %rax
  691c9a: 48 8b 4c 24 38               	movq	0x38(%rsp), %rcx
  691c9f: 48 89 4b 40                  	movq	%rcx, 0x40(%rbx)
  691ca3: 0f 10 44 24 28               	movups	0x28(%rsp), %xmm0
  691ca8: 0f 11 43 30                  	movups	%xmm0, 0x30(%rbx)
  691cac: 0f 10 44 24 18               	movups	0x18(%rsp), %xmm0
  691cb1: 0f 11 43 20                  	movups	%xmm0, 0x20(%rbx)
  691cb5: 0f 10 44 24 08               	movups	0x8(%rsp), %xmm0
  691cba: 0f 11 43 10                  	movups	%xmm0, 0x10(%rbx)
  691cbe: 41 bd 01 00 00 00            	movl	$0x1, %r13d
  691cc4: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  691cc8: 4c 89 2b                     	movq	%r13, (%rbx)
  691ccb: 4c 89 f7                     	movq	%r14, %rdi
  691cce: 48 81 c4 90 00 00 00         	addq	$0x90, %rsp
  691cd5: 5b                           	popq	%rbx
  691cd6: 41 5c                        	popq	%r12
  691cd8: 41 5d                        	popq	%r13
  691cda: 41 5e                        	popq	%r14
  691cdc: 41 5f                        	popq	%r15
  691cde: ff 25 9c 28 46 00            	jmpq	*0x46289c(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  691ce4: 48 8d 7c 24 48               	leaq	0x48(%rsp), %rdi
  691ce9: e8 32 3e ff ff               	callq	0x685b20 <PyInit__native+0x406fe0>
  691cee: 83 7c 24 48 01               	cmpl	$0x1, 0x48(%rsp)
  691cf3: 75 6e                        	jne	0x691d63 <PyInit__native+0x413223>
  691cf5: 0f 10 44 24 50               	movups	0x50(%rsp), %xmm0
  691cfa: 0f 10 4c 24 60               	movups	0x60(%rsp), %xmm1
  691cff: 0f 10 54 24 70               	movups	0x70(%rsp), %xmm2
  691d04: 0f 10 9c 24 80 00 00 00      	movups	0x80(%rsp), %xmm3
  691d0c: 0f 29 5c 24 30               	movaps	%xmm3, 0x30(%rsp)
  691d11: 0f 29 54 24 20               	movaps	%xmm2, 0x20(%rsp)
  691d16: 0f 29 4c 24 10               	movaps	%xmm1, 0x10(%rsp)
  691d1b: 0f 29 04 24                  	movaps	%xmm0, (%rsp)
  691d1f: 48 8b 04 24                  	movq	(%rsp), %rax
  691d23: 48 8b 4c 24 38               	movq	0x38(%rsp), %rcx
  691d28: 48 89 4b 40                  	movq	%rcx, 0x40(%rbx)
  691d2c: 0f 10 44 24 28               	movups	0x28(%rsp), %xmm0
  691d31: 0f 11 43 30                  	movups	%xmm0, 0x30(%rbx)
  691d35: 0f 10 44 24 18               	movups	0x18(%rsp), %xmm0
  691d3a: 0f 11 43 20                  	movups	%xmm0, 0x20(%rbx)
  691d3e: 0f 10 44 24 08               	movups	0x8(%rsp), %xmm0
  691d43: 0f 11 43 10                  	movups	%xmm0, 0x10(%rbx)
  691d47: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  691d4b: 48 c7 03 01 00 00 00         	movq	$0x1, (%rbx)
  691d52: 48 81 c4 90 00 00 00         	addq	$0x90, %rsp
  691d59: 5b                           	popq	%rbx
  691d5a: 41 5c                        	popq	%r12
  691d5c: 41 5d                        	popq	%r13
  691d5e: 41 5e                        	popq	%r14
  691d60: 41 5f                        	popq	%r15
  691d62: c3                           	retq
  691d63: 48 89 e7                     	movq	%rsp, %rdi
  691d66: e8 f5 3f ff ff               	callq	0x685d60 <PyInit__native+0x407220>
  691d6b: eb b2                        	jmp	0x691d1f <PyInit__native+0x4131df>
  691d6d: 48 89 e7                     	movq	%rsp, %rdi
  691d70: e8 eb 3f ff ff               	callq	0x685d60 <PyInit__native+0x407220>
  691d75: e9 1c ff ff ff               	jmp	0x691c96 <PyInit__native+0x413156>
  691d7a: 48 89 c3                     	movq	%rax, %rbx
  691d7d: 4c 89 f7                     	movq	%r14, %rdi
  691d80: ff 15 fa 27 46 00            	callq	*0x4627fa(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  691d86: 48 89 df                     	movq	%rbx, %rdi
  691d89: e8 42 94 42 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
