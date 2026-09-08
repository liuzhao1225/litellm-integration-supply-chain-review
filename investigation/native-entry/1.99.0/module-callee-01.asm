
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  68c530: 41 57                        	pushq	%r15
  68c532: 41 56                        	pushq	%r14
  68c534: 41 55                        	pushq	%r13
  68c536: 41 54                        	pushq	%r12
  68c538: 53                           	pushq	%rbx
  68c539: 48 83 ec 10                  	subq	$0x10, %rsp
  68c53d: b9 01 00 00 00               	movl	$0x1, %ecx
  68c542: 31 c0                        	xorl	%eax, %eax
  68c544: f0                           	lock
  68c545: 0f b1 0d 84 4e 46 00         	cmpxchgl	%ecx, 0x464e84(%rip)    # 0xaf13d0
  68c54c: 0f 85 0c 01 00 00            	jne	0x68c65e <PyInit__native+0x411b5e>
  68c552: 48 8b 05 e7 5e 46 00         	movq	0x465ee7(%rip), %rax    # 0xaf2440
  68c559: 48 d1 e0                     	shlq	%rax
  68c55c: 48 85 c0                     	testq	%rax, %rax
  68c55f: 0f 85 18 01 00 00            	jne	0x68c67d <PyInit__native+0x411b7d>
  68c565: 31 c0                        	xorl	%eax, %eax
  68c567: 0f b6 0d 66 4e 46 00         	movzbl	0x464e66(%rip), %ecx    # 0xaf13d4
  68c56e: 84 c9                        	testb	%cl, %cl
  68c570: 0f 85 1d 01 00 00            	jne	0x68c693 <PyInit__native+0x411b93>
  68c576: 48 b9 ff ff ff ff ff ff ff 7f	movabsq	$0x7fffffffffffffff, %rcx # imm = 0x7FFFFFFFFFFFFFFF
  68c580: 4c 8b 35 61 4e 46 00         	movq	0x464e61(%rip), %r14    # 0xaf13e8
  68c587: 4d 85 f6                     	testq	%r14, %r14
  68c58a: 0f 84 9b 00 00 00            	je	0x68c62b <PyInit__native+0x411b2b>
  68c590: 4c 8b 3d 41 4e 46 00         	movq	0x464e41(%rip), %r15    # 0xaf13d8
  68c597: 48 8b 1d 42 4e 46 00         	movq	0x464e42(%rip), %rbx    # 0xaf13e0
  68c59e: 48 c7 05 2f 4e 46 00 00 00 00 00     	movq	$0x0, 0x464e2f(%rip) # 0xaf13d8
  68c5a9: 48 c7 05 2c 4e 46 00 08 00 00 00     	movq	$0x8, 0x464e2c(%rip) # 0xaf13e0
  68c5b4: 48 c7 05 29 4e 46 00 00 00 00 00     	movq	$0x0, 0x464e29(%rip) # 0xaf13e8
  68c5bf: 84 c0                        	testb	%al, %al
  68c5c1: 75 10                        	jne	0x68c5d3 <PyInit__native+0x411ad3>
  68c5c3: 48 8b 05 76 5e 46 00         	movq	0x465e76(%rip), %rax    # 0xaf2440
  68c5ca: 48 85 c8                     	testq	%rcx, %rax
  68c5cd: 0f 85 41 01 00 00            	jne	0x68c714 <PyInit__native+0x411c14>
  68c5d3: 31 c0                        	xorl	%eax, %eax
  68c5d5: 87 05 f5 4d 46 00            	xchgl	%eax, 0x464df5(%rip)    # 0xaf13d0
  68c5db: 83 f8 02                     	cmpl	$0x2, %eax
  68c5de: 0f 84 e2 00 00 00            	je	0x68c6c6 <PyInit__native+0x411bc6>
  68c5e4: 49 c1 e6 03                  	shlq	$0x3, %r14
  68c5e8: 45 31 e4                     	xorl	%r12d, %r12d
  68c5eb: 4c 8b 2d b6 29 46 00         	movq	0x4629b6(%rip), %r13    # 0xaeefa8 ; ELF relocation: _Py_DecRef
  68c5f2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
  68c600: 4a 8b 3c 23                  	movq	(%rbx,%r12), %rdi
  68c604: 41 ff d5                     	callq	*%r13
  68c607: 49 83 c4 08                  	addq	$0x8, %r12
  68c60b: 4d 39 e6                     	cmpq	%r12, %r14
  68c60e: 75 f0                        	jne	0x68c600 <PyInit__native+0x411b00>
  68c610: 4d 85 ff                     	testq	%r15, %r15
  68c613: 74 3b                        	je	0x68c650 <PyInit__native+0x411b50>
  68c615: 48 89 df                     	movq	%rbx, %rdi
  68c618: 48 83 c4 10                  	addq	$0x10, %rsp
  68c61c: 5b                           	popq	%rbx
  68c61d: 41 5c                        	popq	%r12
  68c61f: 41 5d                        	popq	%r13
  68c621: 41 5e                        	popq	%r14
  68c623: 41 5f                        	popq	%r15
  68c625: ff 25 45 29 46 00            	jmpq	*0x462945(%rip)         # 0xaeef70 ; ELF relocation: free
  68c62b: 84 c0                        	testb	%al, %al
  68c62d: 75 10                        	jne	0x68c63f <PyInit__native+0x411b3f>
  68c62f: 48 8b 05 0a 5e 46 00         	movq	0x465e0a(%rip), %rax    # 0xaf2440
  68c636: 48 85 c8                     	testq	%rcx, %rax
  68c639: 0f 85 ee 00 00 00            	jne	0x68c72d <PyInit__native+0x411c2d>
  68c63f: 31 c0                        	xorl	%eax, %eax
  68c641: 87 05 89 4d 46 00            	xchgl	%eax, 0x464d89(%rip)    # 0xaf13d0
  68c647: 83 f8 02                     	cmpl	$0x2, %eax
  68c64a: 0f 84 99 00 00 00            	je	0x68c6e9 <PyInit__native+0x411be9>
  68c650: 48 83 c4 10                  	addq	$0x10, %rsp
  68c654: 5b                           	popq	%rbx
  68c655: 41 5c                        	popq	%r12
  68c657: 41 5d                        	popq	%r13
  68c659: 41 5e                        	popq	%r14
  68c65b: 41 5f                        	popq	%r15
  68c65d: c3                           	retq
  68c65e: 48 8d 3d 6b 4d 46 00         	leaq	0x464d6b(%rip), %rdi    # 0xaf13d0
  68c665: e8 b6 5b 17 00               	callq	0x802220 <PyInit_pyo3_async_runtimes+0x168bc0>
  68c66a: 48 8b 05 cf 5d 46 00         	movq	0x465dcf(%rip), %rax    # 0xaf2440
  68c671: 48 d1 e0                     	shlq	%rax
  68c674: 48 85 c0                     	testq	%rax, %rax
  68c677: 0f 84 e8 fe ff ff            	je	0x68c565 <PyInit__native+0x411a65>
  68c67d: e8 ae 59 17 00               	callq	0x802030 <PyInit_pyo3_async_runtimes+0x1689d0>
  68c682: 34 01                        	xorb	$0x1, %al
  68c684: 0f b6 0d 49 4d 46 00         	movzbl	0x464d49(%rip), %ecx    # 0xaf13d4
  68c68b: 84 c9                        	testb	%cl, %cl
  68c68d: 0f 84 e3 fe ff ff            	je	0x68c576 <PyInit__native+0x411a76>
  68c693: 48 8d 0d 36 4d 46 00         	leaq	0x464d36(%rip), %rcx    # 0xaf13d0
  68c69a: 48 89 0c 24                  	movq	%rcx, (%rsp)
  68c69e: 88 44 24 08                  	movb	%al, 0x8(%rsp)
  68c6a2: 48 8d 3d b9 9d aa ff         	leaq	-0x556247(%rip), %rdi   # 0x136462 ; rodata: "called `Result::unwrap()` on an `Err` value]<standaloneyes', 'no--version1.[>unexpected end of streaminvalid name tokenexpected , invalid referenceinvalid ExternalID'--' is not all"
  68c6a9: 48 8d 0d 50 3d 44 00         	leaq	0x443d50(%rip), %rcx    # 0xad0400 ; ELF relocation: local pointer 0x68e550
  68c6b0: 4c 8d 05 41 3f 44 00         	leaq	0x443f41(%rip), %r8     # 0xad05f8 ; ELF relocation: local pointer 0xc2168
  68c6b7: 48 89 e2                     	movq	%rsp, %rdx
  68c6ba: be 2b 00 00 00               	movl	$0x2b, %esi
  68c6bf: e8 2c e0 ec ff               	callq	0x55a6f0 <PyInit__native+0x2dfbf0>
  68c6c4: 0f 0b                        	ud2
  68c6c6: 48 8d 35 03 4d 46 00         	leaq	0x464d03(%rip), %rsi    # 0xaf13d0
  68c6cd: bf ca 00 00 00               	movl	$0xca, %edi
  68c6d2: ba 81 00 00 00               	movl	$0x81, %edx
  68c6d7: b9 01 00 00 00               	movl	$0x1, %ecx
  68c6dc: 31 c0                        	xorl	%eax, %eax
  68c6de: ff 15 64 29 46 00            	callq	*0x462964(%rip)         # 0xaef048 ; ELF relocation: syscall
  68c6e4: e9 fb fe ff ff               	jmp	0x68c5e4 <PyInit__native+0x411ae4>
  68c6e9: 48 8d 35 e0 4c 46 00         	leaq	0x464ce0(%rip), %rsi    # 0xaf13d0
  68c6f0: bf ca 00 00 00               	movl	$0xca, %edi
  68c6f5: ba 81 00 00 00               	movl	$0x81, %edx
  68c6fa: b9 01 00 00 00               	movl	$0x1, %ecx
  68c6ff: 31 c0                        	xorl	%eax, %eax
  68c701: 48 83 c4 10                  	addq	$0x10, %rsp
  68c705: 5b                           	popq	%rbx
  68c706: 41 5c                        	popq	%r12
  68c708: 41 5d                        	popq	%r13
  68c70a: 41 5e                        	popq	%r14
  68c70c: 41 5f                        	popq	%r15
  68c70e: ff 25 34 29 46 00            	jmpq	*0x462934(%rip)         # 0xaef048 ; ELF relocation: syscall
  68c714: e8 17 59 17 00               	callq	0x802030 <PyInit_pyo3_async_runtimes+0x1689d0>
  68c719: 84 c0                        	testb	%al, %al
  68c71b: 0f 85 b2 fe ff ff            	jne	0x68c5d3 <PyInit__native+0x411ad3>
  68c721: c6 05 ac 4c 46 00 01         	movb	$0x1, 0x464cac(%rip)    # 0xaf13d4
  68c728: e9 a6 fe ff ff               	jmp	0x68c5d3 <PyInit__native+0x411ad3>
  68c72d: e8 fe 58 17 00               	callq	0x802030 <PyInit_pyo3_async_runtimes+0x1689d0>
  68c732: 84 c0                        	testb	%al, %al
  68c734: 0f 85 05 ff ff ff            	jne	0x68c63f <PyInit__native+0x411b3f>
  68c73a: c6 05 93 4c 46 00 01         	movb	$0x1, 0x464c93(%rip)    # 0xaf13d4
  68c741: e9 f9 fe ff ff               	jmp	0x68c63f <PyInit__native+0x411b3f>
  68c746: 48 89 c3                     	movq	%rax, %rbx
  68c749: 48 89 e7                     	movq	%rsp, %rdi
  68c74c: e8 ff 1d 00 00               	callq	0x68e550 <PyInit__native+0x413a50>
  68c751: 48 89 df                     	movq	%rbx, %rdi
  68c754: e8 37 8f 42 00               	callq	0xab5690 <_Unwind_Resume@plt>
