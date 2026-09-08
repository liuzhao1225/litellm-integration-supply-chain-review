
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  685b20: 55                           	pushq	%rbp
  685b21: 41 57                        	pushq	%r15
  685b23: 41 56                        	pushq	%r14
  685b25: 41 54                        	pushq	%r12
  685b27: 53                           	pushq	%rbx
  685b28: 48 81 ec 80 00 00 00         	subq	$0x80, %rsp
  685b2f: 48 89 fb                     	movq	%rdi, %rbx
  685b32: 48 c7 44 24 18 00 00 00 00   	movq	$0x0, 0x18(%rsp)
  685b3b: 48 c7 44 24 10 00 00 00 00   	movq	$0x0, 0x10(%rsp)
  685b44: 48 c7 44 24 20 00 00 00 00   	movq	$0x0, 0x20(%rsp)
  685b4d: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  685b52: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  685b57: 48 8d 54 24 20               	leaq	0x20(%rsp), %rdx
  685b5c: ff 15 be ef 46 00            	callq	*0x46efbe(%rip)         # 0xaf4b20 ; ELF relocation: PyErr_Fetch
  685b62: 48 83 7c 24 18 00            	cmpq	$0x0, 0x18(%rsp)
  685b68: 0f 84 f5 00 00 00            	je	0x685c63 <PyInit__native+0x407123>
  685b6e: 4c 8d 7c 24 18               	leaq	0x18(%rsp), %r15
  685b73: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  685b78: 48 8d 54 24 20               	leaq	0x20(%rsp), %rdx
  685b7d: 4c 89 ff                     	movq	%r15, %rdi
  685b80: ff 15 a2 ef 46 00            	callq	*0x46efa2(%rip)         # 0xaf4b28 ; ELF relocation: PyErr_NormalizeException
  685b86: 4c 8b 64 24 18               	movq	0x18(%rsp), %r12
  685b8b: 4c 8b 74 24 20               	movq	0x20(%rsp), %r14
  685b90: 4d 85 f6                     	testq	%r14, %r14
  685b93: 40 0f 94 c5                  	sete	%bpl
  685b97: 48 8b 7c 24 10               	movq	0x10(%rsp), %rdi
  685b9c: 4d 85 e4                     	testq	%r12, %r12
  685b9f: 0f 84 cf 00 00 00            	je	0x685c74 <PyInit__native+0x407134>
  685ba5: 48 85 ff                     	testq	%rdi, %rdi
  685ba8: 0f 84 f4 00 00 00            	je	0x685ca2 <PyInit__native+0x407162>
  685bae: 4c 89 64 24 60               	movq	%r12, 0x60(%rsp)
  685bb3: 48 89 7c 24 68               	movq	%rdi, 0x68(%rsp)
  685bb8: 48 c7 44 24 70 00 00 00 00   	movq	$0x0, 0x70(%rsp)
  685bc1: 4c 89 74 24 78               	movq	%r14, 0x78(%rsp)
  685bc6: 4c 8b 77 08                  	movq	0x8(%rdi), %r14
  685bca: 48 8b 05 e7 1e 47 00         	movq	0x471ee7(%rip), %rax    # 0xaf7ab8
  685bd1: 48 83 f8 02                  	cmpq	$0x2, %rax
  685bd5: 0f 85 e1 00 00 00            	jne	0x685cbc <PyInit__native+0x40717c>
  685bdb: 4c 3b 35 de 1e 47 00         	cmpq	0x471ede(%rip), %r14    # 0xaf7ac0
  685be2: 0f 84 e3 00 00 00            	je	0x685ccb <PyInit__native+0x40718b>
  685be8: 0f 10 44 24 60               	movups	0x60(%rsp), %xmm0
  685bed: 0f 10 4c 24 70               	movups	0x70(%rsp), %xmm1
  685bf2: 0f 11 4c 24 48               	movups	%xmm1, 0x48(%rsp)
  685bf7: 0f 11 44 24 38               	movups	%xmm0, 0x38(%rsp)
  685bfc: c7 44 24 58 03 00 00 00      	movl	$0x3, 0x58(%rsp)
  685c04: 0f 57 c0                     	xorps	%xmm0, %xmm0
  685c07: 0f 29 44 24 20               	movaps	%xmm0, 0x20(%rsp)
  685c0c: 48 c7 44 24 30 01 00 00 00   	movq	$0x1, 0x30(%rsp)
  685c15: 8b 44 24 58                  	movl	0x58(%rsp), %eax
  685c19: 85 c0                        	testl	%eax, %eax
  685c1b: 0f 85 b4 00 00 00            	jne	0x685cd5 <PyInit__native+0x407195>
  685c21: 0f 28 44 24 20               	movaps	0x20(%rsp), %xmm0
  685c26: 48 8b 44 24 30               	movq	0x30(%rsp), %rax
  685c2b: 48 8b 4c 24 38               	movq	0x38(%rsp), %rcx
  685c30: 0f 28 4c 24 40               	movaps	0x40(%rsp), %xmm1
  685c35: 48 8b 54 24 50               	movq	0x50(%rsp), %rdx
  685c3a: 48 89 53 38                  	movq	%rdx, 0x38(%rbx)
  685c3e: 8b 54 24 58                  	movl	0x58(%rsp), %edx
  685c42: 89 53 40                     	movl	%edx, 0x40(%rbx)
  685c45: 8b 54 24 5c                  	movl	0x5c(%rsp), %edx
  685c49: 89 53 44                     	movl	%edx, 0x44(%rbx)
  685c4c: 0f 11 4b 28                  	movups	%xmm1, 0x28(%rbx)
  685c50: 48 89 43 18                  	movq	%rax, 0x18(%rbx)
  685c54: 48 89 4b 20                  	movq	%rcx, 0x20(%rbx)
  685c58: 0f 11 43 08                  	movups	%xmm0, 0x8(%rbx)
  685c5c: b8 01 00 00 00               	movl	$0x1, %eax
  685c61: eb 2c                        	jmp	0x685c8f <PyInit__native+0x40714f>
  685c63: 48 8b 7c 24 10               	movq	0x10(%rsp), %rdi
  685c68: 4c 8b 74 24 20               	movq	0x20(%rsp), %r14
  685c6d: 4d 85 f6                     	testq	%r14, %r14
  685c70: 40 0f 94 c5                  	sete	%bpl
  685c74: 48 85 ff                     	testq	%rdi, %rdi
  685c77: 74 06                        	je	0x685c7f <PyInit__native+0x40713f>
  685c79: ff 15 01 e9 46 00            	callq	*0x46e901(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  685c7f: 40 84 ed                     	testb	%bpl, %bpl
  685c82: 75 09                        	jne	0x685c8d <PyInit__native+0x40714d>
  685c84: 4c 89 f7                     	movq	%r14, %rdi
  685c87: ff 15 f3 e8 46 00            	callq	*0x46e8f3(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  685c8d: 31 c0                        	xorl	%eax, %eax
  685c8f: 48 89 03                     	movq	%rax, (%rbx)
  685c92: 48 81 c4 80 00 00 00         	addq	$0x80, %rsp
  685c99: 5b                           	popq	%rbx
  685c9a: 41 5c                        	popq	%r12
  685c9c: 41 5e                        	popq	%r14
  685c9e: 41 5f                        	popq	%r15
  685ca0: 5d                           	popq	%rbp
  685ca1: c3                           	retq
  685ca2: 48 8d 3d b8 4d a9 ff         	leaq	-0x56b248(%rip), %rdi   # 0x11aa61 ; rodata: 'normalized exception value missingThe Python interpreter is not initialized and the `auto-initialize` feature is not enabled.\n\nConsider calling `Python::initialize()` before attemp'
  685ca9: 48 8d 15 40 f9 44 00         	leaq	0x44f940(%rip), %rdx    # 0xad55f0 ; ELF relocation: local pointer 0xcfcb7
  685cb0: be 22 00 00 00               	movl	$0x22, %esi
  685cb5: e8 56 00 f1 ff               	callq	0x595d10 <PyInit__native+0x3171d0>
  685cba: 0f 0b                        	ud2
  685cbc: 48 8d 7c 24 0f               	leaq	0xf(%rsp), %rdi
  685cc1: e8 ea 0b 00 00               	callq	0x6868b0 <PyInit__native+0x407d70>
  685cc6: e9 10 ff ff ff               	jmp	0x685bdb <PyInit__native+0x40709b>
  685ccb: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  685cd0: e8 eb 0c 00 00               	callq	0x6869c0 <PyInit__native+0x407e80>
  685cd5: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  685cda: c6 44 24 18 01               	movb	$0x1, 0x18(%rsp)
  685cdf: 4c 89 7c 24 10               	movq	%r15, 0x10(%rsp)
  685ce4: 48 8d 0d 8d f7 44 00         	leaq	0x44f78d(%rip), %rcx    # 0xad5478
  685ceb: 4c 8d 05 de fb 44 00         	leaq	0x44fbde(%rip), %r8     # 0xad58d0 ; ELF relocation: local pointer 0xcfcb7
  685cf2: 48 8d 54 24 10               	leaq	0x10(%rsp), %rdx
  685cf7: 31 f6                        	xorl	%esi, %esi
  685cf9: e8 22 a6 1a 00               	callq	0x830320 <PyInit_pyo3_async_runtimes+0x19c0a0>
  685cfe: e9 1e ff ff ff               	jmp	0x685c21 <PyInit__native+0x4070e1>
  685d03: 48 89 c3                     	movq	%rax, %rbx
  685d06: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  685d0b: e8 40 0c 00 00               	callq	0x686950 <PyInit__native+0x407e10>
  685d10: eb 32                        	jmp	0x685d44 <PyInit__native+0x407204>
  685d12: e8 f5 00 f1 ff               	callq	0x595e0c <PyInit__native+0x3172cc>
  685d17: 48 89 c3                     	movq	%rax, %rbx
  685d1a: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  685d1f: e8 7c fc ff ff               	callq	0x6859a0 <PyInit__native+0x406e60>
  685d24: eb 1e                        	jmp	0x685d44 <PyInit__native+0x407204>
  685d26: e8 e1 00 f1 ff               	callq	0x595e0c <PyInit__native+0x3172cc>
  685d2b: 48 89 c3                     	movq	%rax, %rbx
  685d2e: 4c 89 e7                     	movq	%r12, %rdi
  685d31: e8 ea 25 00 00               	callq	0x688320 <PyInit__native+0x4097e0>
  685d36: 4d 85 f6                     	testq	%r14, %r14
  685d39: 74 09                        	je	0x685d44 <PyInit__native+0x407204>
  685d3b: 4c 89 f7                     	movq	%r14, %rdi
  685d3e: ff 15 3c e8 46 00            	callq	*0x46e83c(%rip)         # 0xaf4580 ; ELF relocation: _Py_DecRef
  685d44: 48 89 df                     	movq	%rbx, %rdi
  685d47: e8 84 54 43 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
  685d4c: e8 bb 00 f1 ff               	callq	0x595e0c <PyInit__native+0x3172cc>
