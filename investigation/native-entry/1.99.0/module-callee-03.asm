
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  68b270: 55                           	pushq	%rbp
  68b271: 41 57                        	pushq	%r15
  68b273: 41 56                        	pushq	%r14
  68b275: 41 54                        	pushq	%r12
  68b277: 53                           	pushq	%rbx
  68b278: 48 81 ec 80 00 00 00         	subq	$0x80, %rsp
  68b27f: 48 89 fb                     	movq	%rdi, %rbx
  68b282: 48 c7 44 24 18 00 00 00 00   	movq	$0x0, 0x18(%rsp)
  68b28b: 48 c7 44 24 10 00 00 00 00   	movq	$0x0, 0x10(%rsp)
  68b294: 48 c7 44 24 20 00 00 00 00   	movq	$0x0, 0x20(%rsp)
  68b29d: 48 8d 7c 24 18               	leaq	0x18(%rsp), %rdi
  68b2a2: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  68b2a7: 48 8d 54 24 20               	leaq	0x20(%rsp), %rdx
  68b2ac: ff 15 66 41 46 00            	callq	*0x464166(%rip)         # 0xaef418 ; ELF relocation: PyErr_Fetch
  68b2b2: 48 83 7c 24 18 00            	cmpq	$0x0, 0x18(%rsp)
  68b2b8: 0f 84 f5 00 00 00            	je	0x68b3b3 <PyInit__native+0x4108b3>
  68b2be: 4c 8d 7c 24 18               	leaq	0x18(%rsp), %r15
  68b2c3: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  68b2c8: 48 8d 54 24 20               	leaq	0x20(%rsp), %rdx
  68b2cd: 4c 89 ff                     	movq	%r15, %rdi
  68b2d0: ff 15 4a 41 46 00            	callq	*0x46414a(%rip)         # 0xaef420 ; ELF relocation: PyErr_NormalizeException
  68b2d6: 4c 8b 64 24 18               	movq	0x18(%rsp), %r12
  68b2db: 4c 8b 74 24 20               	movq	0x20(%rsp), %r14
  68b2e0: 4d 85 f6                     	testq	%r14, %r14
  68b2e3: 40 0f 94 c5                  	sete	%bpl
  68b2e7: 48 8b 7c 24 10               	movq	0x10(%rsp), %rdi
  68b2ec: 4d 85 e4                     	testq	%r12, %r12
  68b2ef: 0f 84 cf 00 00 00            	je	0x68b3c4 <PyInit__native+0x4108c4>
  68b2f5: 48 85 ff                     	testq	%rdi, %rdi
  68b2f8: 0f 84 f4 00 00 00            	je	0x68b3f2 <PyInit__native+0x4108f2>
  68b2fe: 4c 89 64 24 60               	movq	%r12, 0x60(%rsp)
  68b303: 48 89 7c 24 68               	movq	%rdi, 0x68(%rsp)
  68b308: 48 c7 44 24 70 00 00 00 00   	movq	$0x0, 0x70(%rsp)
  68b311: 4c 89 74 24 78               	movq	%r14, 0x78(%rsp)
  68b316: 4c 8b 77 08                  	movq	0x8(%rdi), %r14
  68b31a: 48 8b 05 37 70 46 00         	movq	0x467037(%rip), %rax    # 0xaf2358
  68b321: 48 83 f8 02                  	cmpq	$0x2, %rax
  68b325: 0f 85 e1 00 00 00            	jne	0x68b40c <PyInit__native+0x41090c>
  68b32b: 4c 3b 35 2e 70 46 00         	cmpq	0x46702e(%rip), %r14    # 0xaf2360
  68b332: 0f 84 e3 00 00 00            	je	0x68b41b <PyInit__native+0x41091b>
  68b338: 0f 10 44 24 60               	movups	0x60(%rsp), %xmm0
  68b33d: 0f 10 4c 24 70               	movups	0x70(%rsp), %xmm1
  68b342: 0f 11 4c 24 48               	movups	%xmm1, 0x48(%rsp)
  68b347: 0f 11 44 24 38               	movups	%xmm0, 0x38(%rsp)
  68b34c: c7 44 24 58 03 00 00 00      	movl	$0x3, 0x58(%rsp)
  68b354: 0f 57 c0                     	xorps	%xmm0, %xmm0
  68b357: 0f 29 44 24 20               	movaps	%xmm0, 0x20(%rsp)
  68b35c: 48 c7 44 24 30 01 00 00 00   	movq	$0x1, 0x30(%rsp)
  68b365: 8b 44 24 58                  	movl	0x58(%rsp), %eax
  68b369: 85 c0                        	testl	%eax, %eax
  68b36b: 0f 85 b4 00 00 00            	jne	0x68b425 <PyInit__native+0x410925>
  68b371: 0f 28 44 24 20               	movaps	0x20(%rsp), %xmm0
  68b376: 48 8b 44 24 30               	movq	0x30(%rsp), %rax
  68b37b: 48 8b 4c 24 38               	movq	0x38(%rsp), %rcx
  68b380: 0f 28 4c 24 40               	movaps	0x40(%rsp), %xmm1
  68b385: 48 8b 54 24 50               	movq	0x50(%rsp), %rdx
  68b38a: 48 89 53 38                  	movq	%rdx, 0x38(%rbx)
  68b38e: 8b 54 24 58                  	movl	0x58(%rsp), %edx
  68b392: 89 53 40                     	movl	%edx, 0x40(%rbx)
  68b395: 8b 54 24 5c                  	movl	0x5c(%rsp), %edx
  68b399: 89 53 44                     	movl	%edx, 0x44(%rbx)
  68b39c: 0f 11 4b 28                  	movups	%xmm1, 0x28(%rbx)
  68b3a0: 48 89 43 18                  	movq	%rax, 0x18(%rbx)
  68b3a4: 48 89 4b 20                  	movq	%rcx, 0x20(%rbx)
  68b3a8: 0f 11 43 08                  	movups	%xmm0, 0x8(%rbx)
  68b3ac: b8 01 00 00 00               	movl	$0x1, %eax
  68b3b1: eb 2c                        	jmp	0x68b3df <PyInit__native+0x4108df>
  68b3b3: 48 8b 7c 24 10               	movq	0x10(%rsp), %rdi
  68b3b8: 4c 8b 74 24 20               	movq	0x20(%rsp), %r14
  68b3bd: 4d 85 f6                     	testq	%r14, %r14
  68b3c0: 40 0f 94 c5                  	sete	%bpl
  68b3c4: 48 85 ff                     	testq	%rdi, %rdi
  68b3c7: 74 06                        	je	0x68b3cf <PyInit__native+0x4108cf>
  68b3c9: ff 15 d9 3b 46 00            	callq	*0x463bd9(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  68b3cf: 40 84 ed                     	testb	%bpl, %bpl
  68b3d2: 75 09                        	jne	0x68b3dd <PyInit__native+0x4108dd>
  68b3d4: 4c 89 f7                     	movq	%r14, %rdi
  68b3d7: ff 15 cb 3b 46 00            	callq	*0x463bcb(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  68b3dd: 31 c0                        	xorl	%eax, %eax
  68b3df: 48 89 03                     	movq	%rax, (%rbx)
  68b3e2: 48 81 c4 80 00 00 00         	addq	$0x80, %rsp
  68b3e9: 5b                           	popq	%rbx
  68b3ea: 41 5c                        	popq	%r12
  68b3ec: 41 5e                        	popq	%r14
  68b3ee: 41 5f                        	popq	%r15
  68b3f0: 5d                           	popq	%rbp
  68b3f1: c3                           	retq
  68b3f2: 48 8d 3d 20 fa a8 ff         	leaq	-0x5705e0(%rip), %rdi   # 0x11ae19 ; rodata: 'normalized exception value missingThe Python interpreter is not initialized and the `auto-initialize` feature is not enabled.\n\nConsider calling `Python::initialize()` before attemp'
  68b3f9: 48 8d 15 70 4e 44 00         	leaq	0x444e70(%rip), %rdx    # 0xad0270 ; ELF relocation: local pointer 0xce9a5
  68b400: be 22 00 00 00               	movl	$0x22, %esi
  68b405: e8 a6 f2 ec ff               	callq	0x55a6b0 <PyInit__native+0x2dfbb0>
  68b40a: 0f 0b                        	ud2
  68b40c: 48 8d 7c 24 0f               	leaq	0xf(%rsp), %rdi
  68b411: e8 ea 0b 00 00               	callq	0x68c000 <PyInit__native+0x411500>
  68b416: e9 10 ff ff ff               	jmp	0x68b32b <PyInit__native+0x41082b>
  68b41b: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  68b420: e8 eb 0c 00 00               	callq	0x68c110 <PyInit__native+0x411610>
  68b425: 48 8d 7c 24 58               	leaq	0x58(%rsp), %rdi
  68b42a: c6 44 24 18 01               	movb	$0x1, 0x18(%rsp)
  68b42f: 4c 89 7c 24 10               	movq	%r15, 0x10(%rsp)
  68b434: 48 8d 0d dd 4c 44 00         	leaq	0x444cdd(%rip), %rcx    # 0xad0118
  68b43b: 4c 8d 05 0e 51 44 00         	leaq	0x44510e(%rip), %r8     # 0xad0550 ; ELF relocation: local pointer 0xce9a5
  68b442: 48 8d 54 24 10               	leaq	0x10(%rsp), %rdx
  68b447: 31 f6                        	xorl	%esi, %esi
  68b449: e8 82 fc 19 00               	callq	0x82b0d0 <PyInit_pyo3_async_runtimes+0x191a70>
  68b44e: e9 1e ff ff ff               	jmp	0x68b371 <PyInit__native+0x410871>
  68b453: 48 89 c3                     	movq	%rax, %rbx
  68b456: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  68b45b: e8 40 0c 00 00               	callq	0x68c0a0 <PyInit__native+0x4115a0>
  68b460: eb 32                        	jmp	0x68b494 <PyInit__native+0x410994>
  68b462: e8 45 f3 ec ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  68b467: 48 89 c3                     	movq	%rax, %rbx
  68b46a: 48 8d 7c 24 60               	leaq	0x60(%rsp), %rdi
  68b46f: e8 7c fc ff ff               	callq	0x68b0f0 <PyInit__native+0x4105f0>
  68b474: eb 1e                        	jmp	0x68b494 <PyInit__native+0x410994>
  68b476: e8 31 f3 ec ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  68b47b: 48 89 c3                     	movq	%rax, %rbx
  68b47e: 4c 89 e7                     	movq	%r12, %rdi
  68b481: e8 ea 25 00 00               	callq	0x68da70 <PyInit__native+0x412f70>
  68b486: 4d 85 f6                     	testq	%r14, %r14
  68b489: 74 09                        	je	0x68b494 <PyInit__native+0x410994>
  68b48b: 4c 89 f7                     	movq	%r14, %rdi
  68b48e: ff 15 14 3b 46 00            	callq	*0x463b14(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  68b494: 48 89 df                     	movq	%rbx, %rdi
  68b497: e8 f4 a1 42 00               	callq	0xab5690 <_Unwind_Resume@plt>
  68b49c: e8 0b f3 ec ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
