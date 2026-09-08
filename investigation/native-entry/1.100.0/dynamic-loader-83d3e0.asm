
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000069f890 <PyInit_pyo3_async_runtimes>:
  83d3e0: 55                           	pushq	%rbp
  83d3e1: 41 57                        	pushq	%r15
  83d3e3: 41 56                        	pushq	%r14
  83d3e5: 41 55                        	pushq	%r13
  83d3e7: 41 54                        	pushq	%r12
  83d3e9: 53                           	pushq	%rbx
  83d3ea: 48 81 ec 48 01 00 00         	subq	$0x148, %rsp            # imm = 0x148
  83d3f1: 49 89 d4                     	movq	%rdx, %r12
  83d3f4: 49 89 f7                     	movq	%rsi, %r15
  83d3f7: 49 89 fe                     	movq	%rdi, %r14
  83d3fa: 48 8d 6f 40                  	leaq	0x40(%rdi), %rbp
  83d3fe: b9 01 00 00 00               	movl	$0x1, %ecx
  83d403: 31 c0                        	xorl	%eax, %eax
  83d405: f0                           	lock
  83d406: 0f b1 4f 40                  	cmpxchgl	%ecx, 0x40(%rdi)
  83d40a: 0f 85 89 00 00 00            	jne	0x83d499 <PyInit_pyo3_async_runtimes+0x19dc09>
  83d410: 48 8b 05 a9 da 2b 00         	movq	0x2bdaa9(%rip), %rax    # 0xafaec0
  83d417: 48 d1 e0                     	shlq	%rax
  83d41a: 48 85 c0                     	testq	%rax, %rax
  83d41d: 0f 85 91 00 00 00            	jne	0x83d4b4 <PyInit_pyo3_async_runtimes+0x19dc24>
  83d423: 31 db                        	xorl	%ebx, %ebx
  83d425: 41 0f b6 46 44               	movzbl	0x44(%r14), %eax
  83d42a: 41 80 be c4 00 00 00 00      	cmpb	$0x0, 0xc4(%r14)
  83d432: 89 5c 24 0c                  	movl	%ebx, 0xc(%rsp)
  83d436: 0f 84 99 00 00 00            	je	0x83d4d5 <PyInit_pyo3_async_runtimes+0x19dc45>
  83d43c: f0                           	lock
  83d43d: 49 83 2f 40                  	subq	$0x40, (%r15)
  83d441: 0f 82 d7 0b 00 00            	jb	0x83e01e <PyInit_pyo3_async_runtimes+0x19e78e>
  83d447: 49 8b 47 10                  	movq	0x10(%r15), %rax
  83d44b: 4c 89 ff                     	movq	%r15, %rdi
  83d44e: ff 50 30                     	callq	*0x30(%rax)
  83d451: 31 d2                        	xorl	%edx, %edx
  83d453: 80 7c 24 0c 00               	cmpb	$0x0, 0xc(%rsp)
  83d458: 75 1a                        	jne	0x83d474 <PyInit_pyo3_async_runtimes+0x19dbe4>
  83d45a: 48 8b 05 5f da 2b 00         	movq	0x2bda5f(%rip), %rax    # 0xafaec0
  83d461: 48 b9 ff ff ff ff ff ff ff 7f	movabsq	$0x7fffffffffffffff, %rcx # imm = 0x7FFFFFFFFFFFFFFF
  83d46b: 48 85 c8                     	testq	%rcx, %rax
  83d46e: 0f 85 c7 0b 00 00            	jne	0x83e03b <PyInit_pyo3_async_runtimes+0x19e7ab>
  83d474: 31 c9                        	xorl	%ecx, %ecx
  83d476: 87 4d 00                     	xchgl	%ecx, (%rbp)
  83d479: b8 01 00 00 00               	movl	$0x1, %eax
  83d47e: 83 f9 02                     	cmpl	$0x2, %ecx
  83d481: 0f 84 21 01 00 00            	je	0x83d5a8 <PyInit_pyo3_async_runtimes+0x19dd18>
  83d487: 48 81 c4 48 01 00 00         	addq	$0x148, %rsp            # imm = 0x148
  83d48e: 5b                           	popq	%rbx
  83d48f: 41 5c                        	popq	%r12
  83d491: 41 5d                        	popq	%r13
  83d493: 41 5e                        	popq	%r14
  83d495: 41 5f                        	popq	%r15
  83d497: 5d                           	popq	%rbp
  83d498: c3                           	retq
  83d499: 48 89 ef                     	movq	%rbp, %rdi
  83d49c: e8 2f d1 fc ff               	callq	0x80a5d0 <PyInit_pyo3_async_runtimes+0x16ad40>
  83d4a1: 48 8b 05 18 da 2b 00         	movq	0x2bda18(%rip), %rax    # 0xafaec0
  83d4a8: 48 d1 e0                     	shlq	%rax
  83d4ab: 48 85 c0                     	testq	%rax, %rax
  83d4ae: 0f 84 6f ff ff ff            	je	0x83d423 <PyInit_pyo3_async_runtimes+0x19db93>
  83d4b4: e8 27 cf fc ff               	callq	0x80a3e0 <PyInit_pyo3_async_runtimes+0x16ab50>
  83d4b9: 89 c3                        	movl	%eax, %ebx
  83d4bb: 80 f3 01                     	xorb	$0x1, %bl
  83d4be: 41 0f b6 46 44               	movzbl	0x44(%r14), %eax
  83d4c3: 41 80 be c4 00 00 00 00      	cmpb	$0x0, 0xc4(%r14)
  83d4cb: 89 5c 24 0c                  	movl	%ebx, 0xc(%rsp)
  83d4cf: 0f 85 67 ff ff ff            	jne	0x83d43c <PyInit_pyo3_async_runtimes+0x19dbac>
  83d4d5: 49 8b 4e 48                  	movq	0x48(%r14), %rcx
  83d4d9: 49 8b 46 60                  	movq	0x60(%r14), %rax
  83d4dd: 48 39 c8                     	cmpq	%rcx, %rax
  83d4e0: 75 11                        	jne	0x83d4f3 <PyInit_pyo3_async_runtimes+0x19dc63>
  83d4e2: 49 8d 7e 48                  	leaq	0x48(%r14), %rdi
  83d4e6: e8 d5 0f 00 00               	callq	0x83e4c0 <PyInit_pyo3_async_runtimes+0x19ec30>
  83d4eb: 49 8b 4e 48                  	movq	0x48(%r14), %rcx
  83d4ef: 49 8b 46 60                  	movq	0x60(%r14), %rax
  83d4f3: 48 8d 50 01                  	leaq	0x1(%rax), %rdx
  83d4f7: 49 89 56 60                  	movq	%rdx, 0x60(%r14)
  83d4fb: 49 03 46 58                  	addq	0x58(%r14), %rax
  83d4ff: 31 d2                        	xorl	%edx, %edx
  83d501: 48 39 c8                     	cmpq	%rcx, %rax
  83d504: 48 0f 43 d1                  	cmovaeq	%rcx, %rdx
  83d508: 48 29 d0                     	subq	%rdx, %rax
  83d50b: 49 8b 4e 50                  	movq	0x50(%r14), %rcx
  83d50f: 48 c1 e0 04                  	shlq	$0x4, %rax
  83d513: 4c 89 3c 01                  	movq	%r15, (%rcx,%rax)
  83d517: c6 44 01 08 01               	movb	$0x1, 0x8(%rcx,%rax)
  83d51c: f0                           	lock
  83d51d: 49 ff 86 00 01 00 00         	incq	0x100(%r14)
  83d524: 49 8b 86 f8 00 00 00         	movq	0xf8(%r14), %rax
  83d52b: 48 85 c0                     	testq	%rax, %rax
  83d52e: 74 37                        	je	0x83d567 <PyInit_pyo3_async_runtimes+0x19dcd7>
  83d530: f0                           	lock
  83d531: 49 ff 8e f8 00 00 00         	decq	0xf8(%r14)
  83d538: 41 ff 86 c0 00 00 00         	incl	0xc0(%r14)
  83d53f: 49 8d b6 08 01 00 00         	leaq	0x108(%r14), %rsi
  83d546: f0                           	lock
  83d547: 41 ff 86 08 01 00 00         	incl	0x108(%r14)
  83d54e: bf ca 00 00 00               	movl	$0xca, %edi
  83d553: ba 81 00 00 00               	movl	$0x81, %edx
  83d558: b9 01 00 00 00               	movl	$0x1, %ecx
  83d55d: 31 c0                        	xorl	%eax, %eax
  83d55f: ff 15 9b a3 2b 00            	callq	*0x2ba39b(%rip)         # 0xaf7900 ; ELF relocation: syscall
  83d565: eb 10                        	jmp	0x83d577 <PyInit_pyo3_async_runtimes+0x19dce7>
  83d567: 49 8b 86 f0 00 00 00         	movq	0xf0(%r14), %rax
  83d56e: 49 3b 86 e8 00 00 00         	cmpq	0xe8(%r14), %rax
  83d575: 75 5c                        	jne	0x83d5d3 <PyInit_pyo3_async_runtimes+0x19dd43>
  83d577: 80 7c 24 0c 00               	cmpb	$0x0, 0xc(%rsp)
  83d57c: 75 1a                        	jne	0x83d598 <PyInit_pyo3_async_runtimes+0x19dd08>
  83d57e: 48 8b 05 3b d9 2b 00         	movq	0x2bd93b(%rip), %rax    # 0xafaec0
  83d585: 48 b9 ff ff ff ff ff ff ff 7f	movabsq	$0x7fffffffffffffff, %rcx # imm = 0x7FFFFFFFFFFFFFFF
  83d58f: 48 85 c8                     	testq	%rcx, %rax
  83d592: 0f 85 c0 0a 00 00            	jne	0x83e058 <PyInit_pyo3_async_runtimes+0x19e7c8>
  83d598: 31 c0                        	xorl	%eax, %eax
  83d59a: 31 c9                        	xorl	%ecx, %ecx
  83d59c: 87 4d 00                     	xchgl	%ecx, (%rbp)
  83d59f: 83 f9 02                     	cmpl	$0x2, %ecx
  83d5a2: 0f 85 df fe ff ff            	jne	0x83d487 <PyInit_pyo3_async_runtimes+0x19dbf7>
  83d5a8: bf ca 00 00 00               	movl	$0xca, %edi
  83d5ad: 48 89 ee                     	movq	%rbp, %rsi
  83d5b0: 48 89 d3                     	movq	%rdx, %rbx
  83d5b3: ba 81 00 00 00               	movl	$0x81, %edx
  83d5b8: b9 01 00 00 00               	movl	$0x1, %ecx
  83d5bd: 49 89 c6                     	movq	%rax, %r14
  83d5c0: 31 c0                        	xorl	%eax, %eax
  83d5c2: ff 15 38 a3 2b 00            	callq	*0x2ba338(%rip)         # 0xaf7900 ; ELF relocation: syscall
  83d5c8: 4c 89 f0                     	movq	%r14, %rax
  83d5cb: 48 89 da                     	movq	%rbx, %rdx
  83d5ce: e9 b4 fe ff ff               	jmp	0x83d487 <PyInit_pyo3_async_runtimes+0x19dbf7>
  83d5d3: 49 8b 86 98 00 00 00         	movq	0x98(%r14), %rax
  83d5da: 48 85 c0                     	testq	%rax, %rax
  83d5dd: 0f 84 8c 0a 00 00            	je	0x83e06f <PyInit_pyo3_async_runtimes+0x19e7df>
  83d5e3: f0                           	lock
  83d5e4: 48 ff 00                     	incq	(%rax)
  83d5e7: 0f 8e 33 0c 00 00            	jle	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83d5ed: 49 8b 9e 98 00 00 00         	movq	0x98(%r14), %rbx
  83d5f4: 49 8b 86 b8 00 00 00         	movq	0xb8(%r14), %rax
  83d5fb: 48 89 44 24 70               	movq	%rax, 0x70(%rsp)
  83d600: 4d 8b 2c 24                  	movq	(%r12), %r13
  83d604: 4d 8b 7c 24 08               	movq	0x8(%r12), %r15
  83d609: 49 8b 46 30                  	movq	0x30(%r14), %rax
  83d60d: 49 8b 4e 38                  	movq	0x38(%r14), %rcx
  83d611: 48 8b 51 10                  	movq	0x10(%rcx), %rdx
  83d615: 48 ff ca                     	decq	%rdx
  83d618: 48 83 e2 f0                  	andq	$-0x10, %rdx
  83d61c: 48 8d 34 10                  	leaq	(%rax,%rdx), %rsi
  83d620: 48 83 c6 10                  	addq	$0x10, %rsi
  83d624: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83d629: ff 51 28                     	callq	*0x28(%rcx)
  83d62c: 49 8b 46 10                  	movq	0x10(%r14), %rax
  83d630: 48 83 f8 01                  	cmpq	$0x1, %rax
  83d634: 75 09                        	jne	0x83d63f <PyInit_pyo3_async_runtimes+0x19ddaf>
  83d636: 49 8b 4e 18                  	movq	0x18(%r14), %rcx
  83d63a: 48 89 4c 24 78               	movq	%rcx, 0x78(%rsp)
  83d63f: 48 8b 4c 24 20               	movq	0x20(%rsp), %rcx
  83d644: 48 89 8c 24 d0 00 00 00      	movq	%rcx, 0xd0(%rsp)
  83d64c: 4c 8b 64 24 28               	movq	0x28(%rsp), %r12
  83d651: 48 8b 4c 24 30               	movq	0x30(%rsp), %rcx
  83d656: ba 01 00 00 00               	movl	$0x1, %edx
  83d65b: be 01 00 00 00               	movl	$0x1, %esi
  83d660: f0                           	lock
  83d661: 49 0f c1 37                  	xaddq	%rsi, (%r15)
  83d665: 49 83 fd 01                  	cmpq	$0x1, %r13
  83d669: 75 0f                        	jne	0x83d67a <PyInit_pyo3_async_runtimes+0x19ddea>
  83d66b: 48 85 f6                     	testq	%rsi, %rsi
  83d66e: 48 8b 7c 24 70               	movq	0x70(%rsp), %rdi
  83d673: 79 15                        	jns	0x83d68a <PyInit_pyo3_async_runtimes+0x19ddfa>
  83d675: e9 a6 0b 00 00               	jmp	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83d67a: 48 85 f6                     	testq	%rsi, %rsi
  83d67d: 48 8b 7c 24 70               	movq	0x70(%rsp), %rdi
  83d682: 0f 88 98 0b 00 00            	js	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83d688: 31 d2                        	xorl	%edx, %edx
  83d68a: 48 8b b4 24 d0 00 00 00      	movq	0xd0(%rsp), %rsi
  83d692: 48 89 b4 24 30 01 00 00      	movq	%rsi, 0x130(%rsp)
  83d69a: 4c 89 a4 24 38 01 00 00      	movq	%r12, 0x138(%rsp)
  83d6a2: 48 89 8c 24 40 01 00 00      	movq	%rcx, 0x140(%rsp)
  83d6aa: 48 89 94 24 10 01 00 00      	movq	%rdx, 0x110(%rsp)
  83d6b2: 4c 89 bc 24 18 01 00 00      	movq	%r15, 0x118(%rsp)
  83d6ba: 48 89 bc 24 28 01 00 00      	movq	%rdi, 0x128(%rsp)
  83d6c2: 48 89 9c 24 20 01 00 00      	movq	%rbx, 0x120(%rsp)
  83d6ca: 84 c0                        	testb	%al, %al
  83d6cc: 0f 85 7c 01 00 00            	jne	0x83d84e <PyInit_pyo3_async_runtimes+0x19dfbe>
  83d6d2: 48 8b 05 df d7 2b 00         	movq	0x2bd7df(%rip), %rax    # 0xafaeb8
  83d6d9: 48 85 c0                     	testq	%rax, %rax
  83d6dc: 74 0d                        	je	0x83d6eb <PyInit_pyo3_async_runtimes+0x19de5b>
  83d6de: 48 ff c8                     	decq	%rax
  83d6e1: 48 89 44 24 78               	movq	%rax, 0x78(%rsp)
  83d6e6: e9 63 01 00 00               	jmp	0x83d84e <PyInit_pyo3_async_runtimes+0x19dfbe>
  83d6eb: b3 01                        	movb	$0x1, %bl
  83d6ed: 48 8d 35 1f 78 8f ff         	leaq	-0x7087e1(%rip), %rsi   # 0x134f13 ; rodata: 'RUST_MIN_STACKassertion failed: curr.is_join_waker_set()assertion failed: curr.is_join_interested()assertion failed: !curr.is_join_waker_set()assertion failed: curr.is_running()ass'
  83d6f4: 48 8d bc 24 80 00 00 00      	leaq	0x80(%rsp), %rdi
  83d6fc: ba 0e 00 00 00               	movl	$0xe, %edx
  83d701: e8 4a 89 ff ff               	callq	0x836050 <PyInit_pyo3_async_runtimes+0x1967c0>
  83d706: 48 8b 9c 24 80 00 00 00      	movq	0x80(%rsp), %rbx
  83d70e: 48 83 fb ff                  	cmpq	$-0x1, %rbx
  83d712: 74 58                        	je	0x83d76c <PyInit_pyo3_async_runtimes+0x19dedc>
  83d714: 4c 8b bc 24 88 00 00 00      	movq	0x88(%rsp), %r15
  83d71c: 48 8b 94 24 90 00 00 00      	movq	0x90(%rsp), %rdx
  83d724: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83d729: 4c 89 fe                     	movq	%r15, %rsi
  83d72c: e8 af 64 d3 ff               	callq	0x573be0 <PyInit__native+0x2f74e0>
  83d731: 83 7c 24 20 01               	cmpl	$0x1, 0x20(%rsp)
  83d736: 0f 84 d7 00 00 00            	je	0x83d813 <PyInit_pyo3_async_runtimes+0x19df83>
  83d73c: 48 8b 4c 24 30               	movq	0x30(%rsp), %rcx
  83d741: 48 85 c9                     	testq	%rcx, %rcx
  83d744: 0f 84 c9 00 00 00            	je	0x83d813 <PyInit_pyo3_async_runtimes+0x19df83>
  83d74a: 48 8b 74 24 28               	movq	0x28(%rsp), %rsi
  83d74f: 48 83 f9 01                  	cmpq	$0x1, %rcx
  83d753: 75 22                        	jne	0x83d777 <PyInit_pyo3_async_runtimes+0x19dee7>
  83d755: 0f b6 06                     	movzbl	(%rsi), %eax
  83d758: 83 f8 2b                     	cmpl	$0x2b, %eax
  83d75b: 0f 84 b2 00 00 00            	je	0x83d813 <PyInit_pyo3_async_runtimes+0x19df83>
  83d761: 83 f8 2d                     	cmpl	$0x2d, %eax
  83d764: 0f 84 a9 00 00 00            	je	0x83d813 <PyInit_pyo3_async_runtimes+0x19df83>
  83d76a: eb 0e                        	jmp	0x83d77a <PyInit_pyo3_async_runtimes+0x19deea>
  83d76c: 41 bd 00 00 20 00            	movl	$0x200000, %r13d        # imm = 0x200000
  83d772: e9 c7 00 00 00               	jmp	0x83d83e <PyInit_pyo3_async_runtimes+0x19dfae>
  83d777: 0f b6 06                     	movzbl	(%rsi), %eax
  83d77a: 31 ff                        	xorl	%edi, %edi
  83d77c: 3c 2b                        	cmpb	$0x2b, %al
  83d77e: 40 0f 94 c7                  	sete	%dil
  83d782: 48 89 ca                     	movq	%rcx, %rdx
  83d785: 48 29 fa                     	subq	%rdi, %rdx
  83d788: 48 01 fe                     	addq	%rdi, %rsi
  83d78b: 48 89 f8                     	movq	%rdi, %rax
  83d78e: 48 f7 d8                     	negq	%rax
  83d791: 48 83 fa 11                  	cmpq	$0x11, %rdx
  83d795: 73 3e                        	jae	0x83d7d5 <PyInit_pyo3_async_runtimes+0x19df45>
  83d797: 48 85 d2                     	testq	%rdx, %rdx
  83d79a: 0f 84 80 00 00 00            	je	0x83d820 <PyInit_pyo3_async_runtimes+0x19df90>
  83d7a0: 48 01 c1                     	addq	%rax, %rcx
  83d7a3: 48 f7 d9                     	negq	%rcx
  83d7a6: 45 31 ed                     	xorl	%r13d, %r13d
  83d7a9: 31 c0                        	xorl	%eax, %eax
  83d7ab: 0f b6 14 06                  	movzbl	(%rsi,%rax), %edx
  83d7af: 83 c2 d0                     	addl	$-0x30, %edx
  83d7b2: 83 fa 09                     	cmpl	$0x9, %edx
  83d7b5: 77 73                        	ja	0x83d82a <PyInit_pyo3_async_runtimes+0x19df9a>
  83d7b7: 4a 8d 3c ad 00 00 00 00      	leaq	(,%r13,4), %rdi
  83d7bf: 4c 01 ef                     	addq	%r13, %rdi
  83d7c2: 89 d2                        	movl	%edx, %edx
  83d7c4: 4c 8d 2c 7a                  	leaq	(%rdx,%rdi,2), %r13
  83d7c8: 48 ff c0                     	incq	%rax
  83d7cb: 48 89 ca                     	movq	%rcx, %rdx
  83d7ce: 48 01 c2                     	addq	%rax, %rdx
  83d7d1: 75 d8                        	jne	0x83d7ab <PyInit_pyo3_async_runtimes+0x19df1b>
  83d7d3: eb 5b                        	jmp	0x83d830 <PyInit_pyo3_async_runtimes+0x19dfa0>
  83d7d5: 48 01 c1                     	addq	%rax, %rcx
  83d7d8: 48 f7 d9                     	negq	%rcx
  83d7db: 45 31 ed                     	xorl	%r13d, %r13d
  83d7de: bf 0a 00 00 00               	movl	$0xa, %edi
  83d7e3: 45 31 c0                     	xorl	%r8d, %r8d
  83d7e6: 48 89 c8                     	movq	%rcx, %rax
  83d7e9: 4c 01 c0                     	addq	%r8, %rax
  83d7ec: 74 42                        	je	0x83d830 <PyInit_pyo3_async_runtimes+0x19dfa0>
  83d7ee: 4c 89 e8                     	movq	%r13, %rax
  83d7f1: 48 f7 e7                     	mulq	%rdi
  83d7f4: 70 1d                        	jo	0x83d813 <PyInit_pyo3_async_runtimes+0x19df83>
  83d7f6: 42 0f b6 14 06               	movzbl	(%rsi,%r8), %edx
  83d7fb: 83 c2 d0                     	addl	$-0x30, %edx
  83d7fe: 48 01 d0                     	addq	%rdx, %rax
  83d801: 49 89 c5                     	movq	%rax, %r13
  83d804: 0f 92 c0                     	setb	%al
  83d807: 83 fa 09                     	cmpl	$0x9, %edx
  83d80a: 77 07                        	ja	0x83d813 <PyInit_pyo3_async_runtimes+0x19df83>
  83d80c: 49 ff c0                     	incq	%r8
  83d80f: 84 c0                        	testb	%al, %al
  83d811: 74 d3                        	je	0x83d7e6 <PyInit_pyo3_async_runtimes+0x19df56>
  83d813: 41 bd 00 00 20 00            	movl	$0x200000, %r13d        # imm = 0x200000
  83d819: 48 85 db                     	testq	%rbx, %rbx
  83d81c: 75 17                        	jne	0x83d835 <PyInit_pyo3_async_runtimes+0x19dfa5>
  83d81e: eb 1e                        	jmp	0x83d83e <PyInit_pyo3_async_runtimes+0x19dfae>
  83d820: 45 31 ed                     	xorl	%r13d, %r13d
  83d823: 48 85 db                     	testq	%rbx, %rbx
  83d826: 75 0d                        	jne	0x83d835 <PyInit_pyo3_async_runtimes+0x19dfa5>
  83d828: eb 14                        	jmp	0x83d83e <PyInit_pyo3_async_runtimes+0x19dfae>
  83d82a: 41 bd 00 00 20 00            	movl	$0x200000, %r13d        # imm = 0x200000
  83d830: 48 85 db                     	testq	%rbx, %rbx
  83d833: 74 09                        	je	0x83d83e <PyInit_pyo3_async_runtimes+0x19dfae>
  83d835: 4c 89 ff                     	movq	%r15, %rdi
  83d838: ff 15 5a a0 2b 00            	callq	*0x2ba05a(%rip)         # 0xaf7898 ; ELF relocation: free
  83d83e: 4c 89 6c 24 78               	movq	%r13, 0x78(%rsp)
  83d843: 49 8d 45 01                  	leaq	0x1(%r13), %rax
  83d847: 48 89 05 6a d6 2b 00         	movq	%rax, 0x2bd66a(%rip)    # 0xafaeb8
  83d84e: 48 8b 05 23 d6 2b 00         	movq	0x2bd623(%rip), %rax    # 0xafae78
  83d855: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  83d860: 48 83 f8 ff                  	cmpq	$-0x1, %rax
  83d864: 0f 84 a8 07 00 00            	je	0x83e012 <PyInit_pyo3_async_runtimes+0x19e782>
  83d86a: 48 8d 78 01                  	leaq	0x1(%rax), %rdi
  83d86e: f0                           	lock
  83d86f: 48 0f b1 3d 01 d6 2b 00      	cmpxchgq	%rdi, 0x2bd601(%rip)    # 0xafae78
  83d877: 75 e7                        	jne	0x83d860 <PyInit_pyo3_async_runtimes+0x19dfd0>
  83d879: 31 db                        	xorl	%ebx, %ebx
  83d87b: 48 8d b4 24 30 01 00 00      	leaq	0x130(%rsp), %rsi
  83d883: e8 68 4f ff ff               	callq	0x8327f0 <PyInit_pyo3_async_runtimes+0x192f60>
  83d888: 49 89 c5                     	movq	%rax, %r13
  83d88b: 48 89 84 24 d8 00 00 00      	movq	%rax, 0xd8(%rsp)
  83d893: 48 8d 3d ae 9f 2b 00         	leaq	0x2b9fae(%rip), %rdi    # 0xaf7848 ; ELF relocation: local pointer 0x0
  83d89a: e8 61 05 28 00               	callq	0xabde00 <__tls_get_addr@plt>
  83d89f: 48 8d 98 20 00 00 00         	leaq	0x20(%rax), %rbx
  83d8a6: 0f b6 80 28 00 00 00         	movzbl	0x28(%rax), %eax
  83d8ad: 85 c0                        	testl	%eax, %eax
  83d8af: 4c 89 a4 24 08 01 00 00      	movq	%r12, 0x108(%rsp)
  83d8b7: 4c 89 6c 24 18               	movq	%r13, 0x18(%rsp)
  83d8bc: 48 89 6c 24 68               	movq	%rbp, 0x68(%rsp)
  83d8c1: 0f 85 50 08 00 00            	jne	0x83e117 <PyInit_pyo3_async_runtimes+0x19e887>
  83d8c7: 48 8b 03                     	movq	(%rbx), %rax
  83d8ca: 48 89 84 24 80 00 00 00      	movq	%rax, 0x80(%rsp)
  83d8d2: 48 c7 03 00 00 00 00         	movq	$0x0, (%rbx)
  83d8d9: 48 85 c0                     	testq	%rax, %rax
  83d8dc: 74 0f                        	je	0x83d8ed <PyInit_pyo3_async_runtimes+0x19e05d>
  83d8de: f0                           	lock
  83d8df: 48 ff 00                     	incq	(%rax)
  83d8e2: 0f 8e 38 09 00 00            	jle	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83d8e8: 48 8b 0b                     	movq	(%rbx), %rcx
  83d8eb: eb 02                        	jmp	0x83d8ef <PyInit_pyo3_async_runtimes+0x19e05f>
  83d8ed: 31 c9                        	xorl	%ecx, %ecx
  83d8ef: 48 89 4c 24 20               	movq	%rcx, 0x20(%rsp)
  83d8f4: 48 89 03                     	movq	%rax, (%rbx)
  83d8f7: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83d8fc: e8 ef 62 ff ff               	callq	0x833bf0 <PyInit_pyo3_async_runtimes+0x194360>
  83d901: 48 8b 44 24 20               	movq	0x20(%rsp), %rax
  83d906: 48 85 c0                     	testq	%rax, %rax
  83d909: 74 10                        	je	0x83d91b <PyInit_pyo3_async_runtimes+0x19e08b>
  83d90b: f0                           	lock
  83d90c: 48 ff 08                     	decq	(%rax)
  83d90f: 75 0a                        	jne	0x83d91b <PyInit_pyo3_async_runtimes+0x19e08b>
  83d911: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83d916: e8 a5 63 ff ff               	callq	0x833cc0 <PyInit_pyo3_async_runtimes+0x194430>
  83d91b: 48 8b ac 24 80 00 00 00      	movq	0x80(%rsp), %rbp
  83d923: 48 89 ac 24 80 00 00 00      	movq	%rbp, 0x80(%rsp)
  83d92b: b8 08 00 00 00               	movl	$0x8, %eax
  83d930: 48 85 ed                     	testq	%rbp, %rbp
  83d933: 0f 84 f3 00 00 00            	je	0x83da2c <PyInit_pyo3_async_runtimes+0x19e19c>
  83d939: 48 8b 5d 20                  	movq	0x20(%rbp), %rbx
  83d93d: 48 8b 7d 10                  	movq	0x10(%rbp), %rdi
  83d941: 48 8b 45 18                  	movq	0x18(%rbp), %rax
  83d945: 48 8d b4 24 d8 00 00 00      	leaq	0xd8(%rsp), %rsi
  83d94d: ff 50 28                     	callq	*0x28(%rax)
  83d950: 49 89 c4                     	movq	%rax, %r12
  83d953: 48 85 c0                     	testq	%rax, %rax
  83d956: 0f 84 d9 00 00 00            	je	0x83da35 <PyInit_pyo3_async_runtimes+0x19e1a5>
  83d95c: 49 89 d5                     	movq	%rdx, %r13
  83d95f: bf 40 00 00 00               	movl	$0x40, %edi
  83d964: ff 15 16 9f 2b 00            	callq	*0x2b9f16(%rip)         # 0xaf7880 ; ELF relocation: malloc
  83d96a: 48 85 c0                     	testq	%rax, %rax
  83d96d: 0f 84 9e 08 00 00            	je	0x83e211 <PyInit_pyo3_async_runtimes+0x19e981>
  83d973: 4c 89 20                     	movq	%r12, (%rax)
  83d976: 4c 89 68 08                  	movq	%r13, 0x8(%rax)
  83d97a: 48 c7 44 24 20 04 00 00 00   	movq	$0x4, 0x20(%rsp)
  83d983: 48 89 44 24 28               	movq	%rax, 0x28(%rsp)
  83d988: 48 c7 44 24 30 01 00 00 00   	movq	$0x1, 0x30(%rsp)
  83d991: 48 85 db                     	testq	%rbx, %rbx
  83d994: 0f 84 ac 00 00 00            	je	0x83da46 <PyInit_pyo3_async_runtimes+0x19e1b6>
  83d99a: 4c 89 b4 24 00 01 00 00      	movq	%r14, 0x100(%rsp)
  83d9a2: 41 bc 01 00 00 00            	movl	$0x1, %r12d
  83d9a8: 41 bf 18 00 00 00            	movl	$0x18, %r15d
  83d9ae: eb 23                        	jmp	0x83d9d3 <PyInit_pyo3_async_runtimes+0x19e143>
  83d9b0: 48 8b 44 24 28               	movq	0x28(%rsp), %rax
  83d9b5: 49 ff c4                     	incq	%r12
  83d9b8: 4e 89 6c 38 f8               	movq	%r13, -0x8(%rax,%r15)
  83d9bd: 4a 89 2c 38                  	movq	%rbp, (%rax,%r15)
  83d9c1: 49 83 c7 10                  	addq	$0x10, %r15
  83d9c5: 4c 89 64 24 30               	movq	%r12, 0x30(%rsp)
  83d9ca: 48 85 db                     	testq	%rbx, %rbx
  83d9cd: 0f 84 85 00 00 00            	je	0x83da58 <PyInit_pyo3_async_runtimes+0x19e1c8>
  83d9d3: 49 89 c6                     	movq	%rax, %r14
  83d9d6: 48 8b 7b 10                  	movq	0x10(%rbx), %rdi
  83d9da: 48 8b 43 18                  	movq	0x18(%rbx), %rax
  83d9de: 48 8b 5b 20                  	movq	0x20(%rbx), %rbx
  83d9e2: 48 8d b4 24 d8 00 00 00      	leaq	0xd8(%rsp), %rsi
  83d9ea: ff 50 28                     	callq	*0x28(%rax)
  83d9ed: 49 89 c5                     	movq	%rax, %r13
  83d9f0: 48 8b 4c 24 20               	movq	0x20(%rsp), %rcx
  83d9f5: 48 85 c0                     	testq	%rax, %rax
  83d9f8: 74 63                        	je	0x83da5d <PyInit_pyo3_async_runtimes+0x19e1cd>
  83d9fa: 48 89 d5                     	movq	%rdx, %rbp
  83d9fd: 49 39 cc                     	cmpq	%rcx, %r12
  83da00: 4c 89 f0                     	movq	%r14, %rax
  83da03: 75 b0                        	jne	0x83d9b5 <PyInit_pyo3_async_runtimes+0x19e125>
  83da05: 48 83 fb 01                  	cmpq	$0x1, %rbx
  83da09: ba 02 00 00 00               	movl	$0x2, %edx
  83da0e: 48 83 da 00                  	sbbq	$0x0, %rdx
  83da12: b9 08 00 00 00               	movl	$0x8, %ecx
  83da17: 41 b8 10 00 00 00            	movl	$0x10, %r8d
  83da1d: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83da22: 4c 89 e6                     	movq	%r12, %rsi
  83da25: e8 d6 c9 fc ff               	callq	0x80a400 <PyInit_pyo3_async_runtimes+0x16ab70>
  83da2a: eb 84                        	jmp	0x83d9b0 <PyInit_pyo3_async_runtimes+0x19e120>
  83da2c: 31 ed                        	xorl	%ebp, %ebp
  83da2e: 45 31 e4                     	xorl	%r12d, %r12d
  83da31: 31 c9                        	xorl	%ecx, %ecx
  83da33: eb 42                        	jmp	0x83da77 <PyInit_pyo3_async_runtimes+0x19e1e7>
  83da35: 45 31 e4                     	xorl	%r12d, %r12d
  83da38: 31 c9                        	xorl	%ecx, %ecx
  83da3a: 4c 8b 6c 24 18               	movq	0x18(%rsp), %r13
  83da3f: b8 08 00 00 00               	movl	$0x8, %eax
  83da44: eb 31                        	jmp	0x83da77 <PyInit_pyo3_async_runtimes+0x19e1e7>
  83da46: b9 04 00 00 00               	movl	$0x4, %ecx
  83da4b: 41 bc 01 00 00 00            	movl	$0x1, %r12d
  83da51: 4c 8b 6c 24 18               	movq	0x18(%rsp), %r13
  83da56: eb 1f                        	jmp	0x83da77 <PyInit_pyo3_async_runtimes+0x19e1e7>
  83da58: 48 8b 4c 24 20               	movq	0x20(%rsp), %rcx
  83da5d: 48 8b 44 24 28               	movq	0x28(%rsp), %rax
  83da62: 48 8b ac 24 80 00 00 00      	movq	0x80(%rsp), %rbp
  83da6a: 4c 8b 6c 24 18               	movq	0x18(%rsp), %r13
  83da6f: 4c 8b b4 24 00 01 00 00      	movq	0x100(%rsp), %r14
  83da77: 48 89 ac 24 f8 00 00 00      	movq	%rbp, 0xf8(%rsp)
  83da7f: 48 89 8c 24 e0 00 00 00      	movq	%rcx, 0xe0(%rsp)
  83da87: 48 89 84 24 e8 00 00 00      	movq	%rax, 0xe8(%rsp)
  83da8f: 4c 89 a4 24 f0 00 00 00      	movq	%r12, 0xf0(%rsp)
  83da97: 48 c7 44 24 20 01 00 00 00   	movq	$0x1, 0x20(%rsp)
  83daa0: 48 c7 44 24 28 01 00 00 00   	movq	$0x1, 0x28(%rsp)
  83daa9: 66 0f ef c0                  	pxor	%xmm0, %xmm0
  83daad: f3 0f 7f 44 24 30            	movdqu	%xmm0, 0x30(%rsp)
  83dab3: bf 30 00 00 00               	movl	$0x30, %edi
  83dab8: ff 15 c2 9d 2b 00            	callq	*0x2b9dc2(%rip)         # 0xaf7880 ; ELF relocation: malloc
  83dabe: 48 85 c0                     	testq	%rax, %rax
  83dac1: 49 8d 6e 40                  	leaq	0x40(%r14), %rbp
  83dac5: 0f 84 c1 05 00 00            	je	0x83e08c <PyInit_pyo3_async_runtimes+0x19e7fc>
  83dacb: 49 89 c7                     	movq	%rax, %r15
  83dace: f3 0f 6f 44 24 20            	movdqu	0x20(%rsp), %xmm0
  83dad4: f3 0f 6f 4c 24 30            	movdqu	0x30(%rsp), %xmm1
  83dada: f3 0f 6f 54 24 40            	movdqu	0x40(%rsp), %xmm2
  83dae0: f3 0f 7f 50 20               	movdqu	%xmm2, 0x20(%rax)
  83dae5: f3 0f 7f 48 10               	movdqu	%xmm1, 0x10(%rax)
  83daea: f3 0f 7f 00                  	movdqu	%xmm0, (%rax)
  83daee: f0                           	lock
  83daef: 48 ff 00                     	incq	(%rax)
  83daf2: 0f 8e 28 07 00 00            	jle	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83daf8: 0f 10 84 24 10 01 00 00      	movups	0x110(%rsp), %xmm0
  83db00: 0f 10 8c 24 20 01 00 00      	movups	0x120(%rsp), %xmm1
  83db08: 0f 29 8c 24 90 00 00 00      	movaps	%xmm1, 0x90(%rsp)
  83db10: 0f 29 84 24 80 00 00 00      	movaps	%xmm0, 0x80(%rsp)
  83db18: f3 0f 6f 84 24 e0 00 00 00   	movdqu	0xe0(%rsp), %xmm0
  83db21: f3 0f 6f 8c 24 f0 00 00 00   	movdqu	0xf0(%rsp), %xmm1
  83db2a: 66 0f 7f 8c 24 b0 00 00 00   	movdqa	%xmm1, 0xb0(%rsp)
  83db33: 66 0f 7f 84 24 a0 00 00 00   	movdqa	%xmm0, 0xa0(%rsp)
  83db3c: 4c 89 bc 24 c0 00 00 00      	movq	%r15, 0xc0(%rsp)
  83db44: 49 8b 7f 10                  	movq	0x10(%r15), %rdi
  83db48: 48 85 ff                     	testq	%rdi, %rdi
  83db4b: 74 0b                        	je	0x83db58 <PyInit_pyo3_async_runtimes+0x19e2c8>
  83db4d: f0                           	lock
  83db4e: 48 ff 47 18                  	incq	0x18(%rdi)
  83db52: 0f 8e e5 05 00 00            	jle	0x83e13d <PyInit_pyo3_async_runtimes+0x19e8ad>
  83db58: 48 8b 84 24 c0 00 00 00      	movq	0xc0(%rsp), %rax
  83db60: 48 89 44 24 60               	movq	%rax, 0x60(%rsp)
  83db65: 66 0f 6f 84 24 80 00 00 00   	movdqa	0x80(%rsp), %xmm0
  83db6e: 66 0f 6f 8c 24 90 00 00 00   	movdqa	0x90(%rsp), %xmm1
  83db77: 66 0f 6f 94 24 a0 00 00 00   	movdqa	0xa0(%rsp), %xmm2
  83db80: 66 0f 6f 9c 24 b0 00 00 00   	movdqa	0xb0(%rsp), %xmm3
  83db89: 66 0f 7f 5c 24 50            	movdqa	%xmm3, 0x50(%rsp)
  83db8f: 66 0f 7f 54 24 40            	movdqa	%xmm2, 0x40(%rsp)
  83db95: 66 0f 7f 4c 24 30            	movdqa	%xmm1, 0x30(%rsp)
  83db9b: 66 0f 7f 44 24 20            	movdqa	%xmm0, 0x20(%rsp)
  83dba1: bf 48 00 00 00               	movl	$0x48, %edi
  83dba6: ff 15 d4 9c 2b 00            	callq	*0x2b9cd4(%rip)         # 0xaf7880 ; ELF relocation: malloc
  83dbac: 48 85 c0                     	testq	%rax, %rax
  83dbaf: 0f 84 f0 04 00 00            	je	0x83e0a5 <PyInit_pyo3_async_runtimes+0x19e815>
  83dbb5: 48 8b 8c 24 c0 00 00 00      	movq	0xc0(%rsp), %rcx
  83dbbd: 48 89 48 40                  	movq	%rcx, 0x40(%rax)
  83dbc1: 66 0f 6f 84 24 80 00 00 00   	movdqa	0x80(%rsp), %xmm0
  83dbca: 66 0f 6f 8c 24 90 00 00 00   	movdqa	0x90(%rsp), %xmm1
  83dbd3: 66 0f 6f 94 24 a0 00 00 00   	movdqa	0xa0(%rsp), %xmm2
  83dbdc: 66 0f 6f 9c 24 b0 00 00 00   	movdqa	0xb0(%rsp), %xmm3
  83dbe5: f3 0f 7f 58 30               	movdqu	%xmm3, 0x30(%rax)
  83dbea: f3 0f 7f 50 20               	movdqu	%xmm2, 0x20(%rax)
  83dbef: f3 0f 7f 48 10               	movdqu	%xmm1, 0x10(%rax)
  83dbf4: f3 0f 7f 00                  	movdqu	%xmm0, (%rax)
  83dbf8: f0                           	lock
  83dbf9: 49 ff 45 00                  	incq	(%r13)
  83dbfd: 0f 8e 1d 06 00 00            	jle	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83dc03: 4c 89 6c 24 20               	movq	%r13, 0x20(%rsp)
  83dc08: 48 89 44 24 28               	movq	%rax, 0x28(%rsp)
  83dc0d: 48 8d 05 4c 98 2a 00         	leaq	0x2a984c(%rip), %rax    # 0xae7460 ; ELF relocation: local pointer 0x83e560
  83dc14: 48 89 44 24 30               	movq	%rax, 0x30(%rsp)
  83dc19: bf 18 00 00 00               	movl	$0x18, %edi
  83dc1e: ff 15 5c 9c 2b 00            	callq	*0x2b9c5c(%rip)         # 0xaf7880 ; ELF relocation: malloc
  83dc24: 48 85 c0                     	testq	%rax, %rax
  83dc27: 0f 84 8c 04 00 00            	je	0x83e0b9 <PyInit_pyo3_async_runtimes+0x19e829>
  83dc2d: 49 89 c4                     	movq	%rax, %r12
  83dc30: 48 8b 44 24 30               	movq	0x30(%rsp), %rax
  83dc35: 49 89 44 24 10               	movq	%rax, 0x10(%r12)
  83dc3a: f3 0f 6f 44 24 20            	movdqu	0x20(%rsp), %xmm0
  83dc40: f3 41 0f 7f 04 24            	movdqu	%xmm0, (%r12)
  83dc46: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83dc4b: ff 15 df a8 2b 00            	callq	*0x2ba8df(%rip)         # 0xaf8530 ; ELF relocation: pthread_attr_init
  83dc51: 89 44 24 10                  	movl	%eax, 0x10(%rsp)
  83dc55: 85 c0                        	testl	%eax, %eax
  83dc57: 0f 85 70 04 00 00            	jne	0x83e0cd <PyInit_pyo3_async_runtimes+0x19e83d>
  83dc5d: 48 8b 05 8c d0 2b 00         	movq	0x2bd08c(%rip), %rax    # 0xafacf0
  83dc64: b9 00 40 00 00               	movl	$0x4000, %ecx           # imm = 0x4000
  83dc69: 48 85 c0                     	testq	%rax, %rax
  83dc6c: 74 14                        	je	0x83dc82 <PyInit_pyo3_async_runtimes+0x19e3f2>
  83dc6e: 48 83 f8 01                  	cmpq	$0x1, %rax
  83dc72: 0f 84 76 04 00 00            	je	0x83e0ee <PyInit_pyo3_async_runtimes+0x19e85e>
  83dc78: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83dc7d: ff d0                        	callq	*%rax
  83dc7f: 48 89 c1                     	movq	%rax, %rcx
  83dc82: 48 8b 74 24 78               	movq	0x78(%rsp), %rsi
  83dc87: 48 39 f1                     	cmpq	%rsi, %rcx
  83dc8a: 48 0f 47 f1                  	cmovaq	%rcx, %rsi
  83dc8e: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83dc93: 48 89 f3                     	movq	%rsi, %rbx
  83dc96: ff 15 9c a8 2b 00            	callq	*0x2ba89c(%rip)         # 0xaf8538 ; ELF relocation: pthread_attr_setstacksize
  83dc9c: 85 c0                        	testl	%eax, %eax
  83dc9e: 74 69                        	je	0x83dd09 <PyInit_pyo3_async_runtimes+0x19e479>
  83dca0: 89 44 24 10                  	movl	%eax, 0x10(%rsp)
  83dca4: 83 f8 16                     	cmpl	$0x16, %eax
  83dca7: 0f 85 9e 04 00 00            	jne	0x83e14b <PyInit_pyo3_async_runtimes+0x19e8bb>
  83dcad: bf 1e 00 00 00               	movl	$0x1e, %edi
  83dcb2: ff 15 88 a8 2b 00            	callq	*0x2ba888(%rip)         # 0xaf8540 ; ELF relocation: sysconf
  83dcb8: 48 8d 34 03                  	leaq	(%rbx,%rax), %rsi
  83dcbc: 48 ff ce                     	decq	%rsi
  83dcbf: 48 f7 d8                     	negq	%rax
  83dcc2: 48 21 c6                     	andq	%rax, %rsi
  83dcc5: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83dcca: ff 15 68 a8 2b 00            	callq	*0x2ba868(%rip)         # 0xaf8538 ; ELF relocation: pthread_attr_setstacksize
  83dcd0: 85 c0                        	testl	%eax, %eax
  83dcd2: 74 35                        	je	0x83dd09 <PyInit_pyo3_async_runtimes+0x19e479>
  83dcd4: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83dcd9: ff 15 d9 a7 2b 00            	callq	*0x2ba7d9(%rip)         # 0xaf84b8 ; ELF relocation: pthread_attr_destroy
  83dcdf: 89 44 24 10                  	movl	%eax, 0x10(%rsp)
  83dce3: 85 c0                        	testl	%eax, %eax
  83dce5: 0f 85 a4 04 00 00            	jne	0x83e18f <PyInit_pyo3_async_runtimes+0x19e8ff>
  83dceb: 4c 89 e7                     	movq	%r12, %rdi
  83dcee: e8 ad 54 ff ff               	callq	0x8331a0 <PyInit_pyo3_async_runtimes+0x193910>
  83dcf3: 48 8d 15 ae 8e 2a 00         	leaq	0x2a8eae(%rip), %rdx    # 0xae6ba8 ; ELF relocation: local pointer 0x1344f0
  83dcfa: f0                           	lock
  83dcfb: 49 ff 0f                     	decq	(%r15)
  83dcfe: 0f 84 85 00 00 00            	je	0x83dd89 <PyInit_pyo3_async_runtimes+0x19e4f9>
  83dd04: e9 8e 00 00 00               	jmp	0x83dd97 <PyInit_pyo3_async_runtimes+0x19e507>
  83dd09: 48 c7 44 24 10 00 00 00 00   	movq	$0x0, 0x10(%rsp)
  83dd12: 48 8d 15 d7 52 ff ff         	leaq	-0xad29(%rip), %rdx     # 0x832ff0 <PyInit_pyo3_async_runtimes+0x193760>
  83dd19: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  83dd1e: 48 8d 74 24 20               	leaq	0x20(%rsp), %rsi
  83dd23: 4c 89 e1                     	movq	%r12, %rcx
  83dd26: ff 15 1c a8 2b 00            	callq	*0x2ba81c(%rip)         # 0xaf8548 ; ELF relocation: pthread_create
  83dd2c: 85 c0                        	testl	%eax, %eax
  83dd2e: 0f 84 a9 00 00 00            	je	0x83dddd <PyInit_pyo3_async_runtimes+0x19e54d>
  83dd34: 49 89 c5                     	movq	%rax, %r13
  83dd37: 31 db                        	xorl	%ebx, %ebx
  83dd39: 4c 89 e7                     	movq	%r12, %rdi
  83dd3c: e8 5f 54 ff ff               	callq	0x8331a0 <PyInit_pyo3_async_runtimes+0x193910>
  83dd41: 48 8b 0d c0 cf 2b 00         	movq	0x2bcfc0(%rip), %rcx    # 0xafad08 ; ELF relocation: local pointer 0xad0cc0
  83dd48: 48 8d 05 11 8b 2a 00         	leaq	0x2a8b11(%rip), %rax    # 0xae6860 ; ELF relocation: local pointer 0x82dde0
  83dd4f: 48 39 c1                     	cmpq	%rax, %rcx
  83dd52: 0f 85 55 04 00 00            	jne	0x83e1ad <PyInit_pyo3_async_runtimes+0x19e91d>
  83dd58: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83dd5d: ff 15 55 a7 2b 00            	callq	*0x2ba755(%rip)         # 0xaf84b8 ; ELF relocation: pthread_attr_destroy
  83dd63: 89 44 24 10                  	movl	%eax, 0x10(%rsp)
  83dd67: 85 c0                        	testl	%eax, %eax
  83dd69: 0f 85 ff 03 00 00            	jne	0x83e16e <PyInit_pyo3_async_runtimes+0x19e8de>
  83dd6f: 4c 89 ea                     	movq	%r13, %rdx
  83dd72: 48 c1 e2 20                  	shlq	$0x20, %rdx
  83dd76: 48 83 ca 02                  	orq	$0x2, %rdx
  83dd7a: 49 8d 6e 40                  	leaq	0x40(%r14), %rbp
  83dd7e: 4c 8b 6c 24 18               	movq	0x18(%rsp), %r13
  83dd83: f0                           	lock
  83dd84: 49 ff 0f                     	decq	(%r15)
  83dd87: 75 0e                        	jne	0x83dd97 <PyInit_pyo3_async_runtimes+0x19e507>
  83dd89: 4c 89 ff                     	movq	%r15, %rdi
  83dd8c: 48 89 d3                     	movq	%rdx, %rbx
  83dd8f: e8 fc ef ff ff               	callq	0x83cd90 <PyInit_pyo3_async_runtimes+0x19d500>
  83dd94: 48 89 da                     	movq	%rbx, %rdx
  83dd97: f0                           	lock
  83dd98: 49 ff 4d 00                  	decq	(%r13)
  83dd9c: 75 21                        	jne	0x83ddbf <PyInit_pyo3_async_runtimes+0x19e52f>
  83dd9e: 4c 89 ef                     	movq	%r13, %rdi
  83dda1: 48 89 d3                     	movq	%rdx, %rbx
  83dda4: e8 17 35 ff ff               	callq	0x8312c0 <PyInit_pyo3_async_runtimes+0x191a30>
  83dda9: 48 89 da                     	movq	%rbx, %rdx
  83ddac: 83 e3 03                     	andl	$0x3, %ebx
  83ddaf: 48 8d 05 52 25 88 ff         	leaq	-0x77daae(%rip), %rax   # 0xc0308
  83ddb6: 48 63 0c 98                  	movslq	(%rax,%rbx,4), %rcx
  83ddba: 48 01 c1                     	addq	%rax, %rcx
  83ddbd: ff e1                        	jmpq	*%rcx
  83ddbf: 89 d3                        	movl	%edx, %ebx
  83ddc1: 83 e3 03                     	andl	$0x3, %ebx
  83ddc4: 48 8d 05 3d 25 88 ff         	leaq	-0x77dac3(%rip), %rax   # 0xc0308
  83ddcb: 48 63 0c 98                  	movslq	(%rax,%rbx,4), %rcx
  83ddcf: 48 01 c1                     	addq	%rax, %rcx
  83ddd2: ff e1                        	jmpq	*%rcx
  83ddd4: 0f b6 42 10                  	movzbl	0x10(%rdx), %eax
  83ddd8: e9 5a 01 00 00               	jmp	0x83df37 <PyInit_pyo3_async_runtimes+0x19e6a7>
  83dddd: 48 8b 6c 24 10               	movq	0x10(%rsp), %rbp
  83dde2: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83dde7: ff 15 cb a6 2b 00            	callq	*0x2ba6cb(%rip)         # 0xaf84b8 ; ELF relocation: pthread_attr_destroy
  83dded: 89 44 24 10                  	movl	%eax, 0x10(%rsp)
  83ddf1: 85 c0                        	testl	%eax, %eax
  83ddf3: 0f 85 75 03 00 00            	jne	0x83e16e <PyInit_pyo3_async_runtimes+0x19e8de>
  83ddf9: 48 8b 44 24 18               	movq	0x18(%rsp), %rax
  83ddfe: 48 89 84 24 80 00 00 00      	movq	%rax, 0x80(%rsp)
  83de06: 4c 89 bc 24 88 00 00 00      	movq	%r15, 0x88(%rsp)
  83de0e: 48 89 ac 24 90 00 00 00      	movq	%rbp, 0x90(%rsp)
  83de16: f0                           	lock
  83de17: 49 ff 86 f0 00 00 00         	incq	0xf0(%r14)
  83de1e: 49 ff 86 b8 00 00 00         	incq	0xb8(%r14)
  83de25: 49 8b 9e 88 00 00 00         	movq	0x88(%r14), %rbx
  83de2c: 4d 8b ae 90 00 00 00         	movq	0x90(%r14), %r13
  83de33: 48 89 df                     	movq	%rbx, %rdi
  83de36: 4c 89 ee                     	movq	%r13, %rsi
  83de39: 48 8b 54 24 70               	movq	0x70(%rsp), %rdx
  83de3e: e8 cd b9 ff ff               	callq	0x839810 <PyInit_pyo3_async_runtimes+0x199f80>
  83de43: 49 89 c4                     	movq	%rax, %r12
  83de46: 49 83 7e 78 00               	cmpq	$0x0, 0x78(%r14)
  83de4b: 0f 84 97 03 00 00            	je	0x83e1e8 <PyInit_pyo3_async_runtimes+0x19e958>
  83de51: 49 8b 46 68                  	movq	0x68(%r14), %rax
  83de55: 49 8b 56 70                  	movq	0x70(%r14), %rdx
  83de59: 4c 89 e1                     	movq	%r12, %rcx
  83de5c: 48 c1 e9 39                  	shrq	$0x39, %rcx
  83de60: 66 0f 6e c1                  	movd	%ecx, %xmm0
  83de64: 66 0f 60 c0                  	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
  83de68: f2 0f 70 c0 00               	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
  83de6d: 66 0f 70 c0 44               	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
  83de72: 45 31 c0                     	xorl	%r8d, %r8d
  83de75: 66 0f 76 c9                  	pcmpeqd	%xmm1, %xmm1
  83de79: 31 ff                        	xorl	%edi, %edi
  83de7b: 48 8b 5c 24 18               	movq	0x18(%rsp), %rbx
  83de80: 4c 8b 6c 24 70               	movq	0x70(%rsp), %r13
  83de85: 49 21 d4                     	andq	%rdx, %r12
  83de88: f3 42 0f 6f 14 20            	movdqu	(%rax,%r12), %xmm2
  83de8e: 66 0f 6f da                  	movdqa	%xmm2, %xmm3
  83de92: 66 0f 74 d8                  	pcmpeqb	%xmm0, %xmm3
  83de96: 66 44 0f d7 cb               	pmovmskb	%xmm3, %r9d
  83de9b: 45 85 c9                     	testl	%r9d, %r9d
  83de9e: 74 2c                        	je	0x83decc <PyInit_pyo3_async_runtimes+0x19e63c>
  83dea0: f3 45 0f bc d9               	tzcntl	%r9d, %r11d
  83dea5: 4d 01 e3                     	addq	%r12, %r11
  83dea8: 49 21 d3                     	andq	%rdx, %r11
  83deab: 49 c1 e3 05                  	shlq	$0x5, %r11
  83deaf: 49 89 c2                     	movq	%rax, %r10
  83deb2: 4d 29 da                     	subq	%r11, %r10
  83deb5: 4d 3b 6a e0                  	cmpq	-0x20(%r10), %r13
  83deb9: 0f 84 b1 00 00 00            	je	0x83df70 <PyInit_pyo3_async_runtimes+0x19e6e0>
  83debf: 45 8d 51 ff                  	leal	-0x1(%r9), %r10d
  83dec3: 66 45 21 ca                  	andw	%r9w, %r10w
  83dec7: 45 89 d1                     	movl	%r10d, %r9d
  83deca: 75 d4                        	jne	0x83dea0 <PyInit_pyo3_async_runtimes+0x19e610>
  83decc: 49 83 f8 01                  	cmpq	$0x1, %r8
  83ded0: 74 12                        	je	0x83dee4 <PyInit_pyo3_async_runtimes+0x19e654>
  83ded2: 66 0f d7 f2                  	pmovmskb	%xmm2, %esi
  83ded6: 85 f6                        	testl	%esi, %esi
  83ded8: 74 24                        	je	0x83defe <PyInit_pyo3_async_runtimes+0x19e66e>
  83deda: f3 0f bc f6                  	tzcntl	%esi, %esi
  83dede: 4c 01 e6                     	addq	%r12, %rsi
  83dee1: 48 21 d6                     	andq	%rdx, %rsi
  83dee4: 66 0f 74 d1                  	pcmpeqb	%xmm1, %xmm2
  83dee8: 66 44 0f d7 c2               	pmovmskb	%xmm2, %r8d
  83deed: 45 85 c0                     	testl	%r8d, %r8d
  83def0: 0f 85 b4 00 00 00            	jne	0x83dfaa <PyInit_pyo3_async_runtimes+0x19e71a>
  83def6: 41 b8 01 00 00 00            	movl	$0x1, %r8d
  83defc: eb 03                        	jmp	0x83df01 <PyInit_pyo3_async_runtimes+0x19e671>
  83defe: 45 31 c0                     	xorl	%r8d, %r8d
  83df01: 49 01 fc                     	addq	%rdi, %r12
  83df04: 49 83 c4 10                  	addq	$0x10, %r12
  83df08: 48 83 c7 10                  	addq	$0x10, %rdi
  83df0c: e9 74 ff ff ff               	jmp	0x83de85 <PyInit_pyo3_async_runtimes+0x19e5f5>
  83df11: 48 8b 05 f0 cd 2b 00         	movq	0x2bcdf0(%rip), %rax    # 0xafad08 ; ELF relocation: local pointer 0xad0cc0
  83df18: 49 89 d7                     	movq	%rdx, %r15
  83df1b: 48 89 d7                     	movq	%rdx, %rdi
  83df1e: 48 c1 ef 20                  	shrq	$0x20, %rdi
  83df22: ff 50 08                     	callq	*0x8(%rax)
  83df25: 4c 89 fa                     	movq	%r15, %rdx
  83df28: eb 0d                        	jmp	0x83df37 <PyInit_pyo3_async_runtimes+0x19e6a7>
  83df2a: 48 89 d0                     	movq	%rdx, %rax
  83df2d: 48 c1 e8 20                  	shrq	$0x20, %rax
  83df31: eb 04                        	jmp	0x83df37 <PyInit_pyo3_async_runtimes+0x19e6a7>
  83df33: 0f b6 42 1f                  	movzbl	0x1f(%rdx), %eax
  83df37: 3c 0d                        	cmpb	$0xd, %al
  83df39: 0f 85 14 f5 ff ff            	jne	0x83d453 <PyInit_pyo3_async_runtimes+0x19dbc3>
  83df3f: 49 8b 86 f0 00 00 00         	movq	0xf0(%r14), %rax
  83df46: 48 85 c0                     	testq	%rax, %rax
  83df49: 0f 84 04 f5 ff ff            	je	0x83d453 <PyInit_pyo3_async_runtimes+0x19dbc3>
  83df4f: 8d 43 fe                     	leal	-0x2(%rbx), %eax
  83df52: 83 f8 02                     	cmpl	$0x2, %eax
  83df55: 0f 82 1c f6 ff ff            	jb	0x83d577 <PyInit_pyo3_async_runtimes+0x19dce7>
  83df5b: 48 85 db                     	testq	%rbx, %rbx
  83df5e: 0f 84 13 f6 ff ff            	je	0x83d577 <PyInit_pyo3_async_runtimes+0x19dce7>
  83df64: 48 8d 7a ff                  	leaq	-0x1(%rdx), %rdi
  83df68: ff 52 17                     	callq	*0x17(%rdx)
  83df6b: e9 07 f6 ff ff               	jmp	0x83d577 <PyInit_pyo3_async_runtimes+0x19dce7>
  83df70: 49 8b 42 f8                  	movq	-0x8(%r10), %rax
  83df74: 48 89 44 24 30               	movq	%rax, 0x30(%rsp)
  83df79: 41 0f 10 42 e8               	movups	-0x18(%r10), %xmm0
  83df7e: 0f 29 44 24 20               	movaps	%xmm0, 0x20(%rsp)
  83df83: 49 89 5a e8                  	movq	%rbx, -0x18(%r10)
  83df87: 4d 89 7a f0                  	movq	%r15, -0x10(%r10)
  83df8b: 49 89 6a f8                  	movq	%rbp, -0x8(%r10)
  83df8f: 48 83 7c 24 20 00            	cmpq	$0x0, 0x20(%rsp)
  83df95: 74 0a                        	je	0x83dfa1 <PyInit_pyo3_async_runtimes+0x19e711>
  83df97: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83df9c: e8 df ce ff ff               	callq	0x83ae80 <PyInit_pyo3_async_runtimes+0x19b5f0>
  83dfa1: 49 8d 6e 40                  	leaq	0x40(%r14), %rbp
  83dfa5: e9 cd f5 ff ff               	jmp	0x83d577 <PyInit_pyo3_async_runtimes+0x19dce7>
  83dfaa: 0f b6 3c 30                  	movzbl	(%rax,%rsi), %edi
  83dfae: 40 84 ff                     	testb	%dil, %dil
  83dfb1: 0f 89 45 02 00 00            	jns	0x83e1fc <PyInit_pyo3_async_runtimes+0x19e96c>
  83dfb7: 40 80 e7 01                  	andb	$0x1, %dil
  83dfbb: 4c 8d 46 f0                  	leaq	-0x10(%rsi), %r8
  83dfbf: 49 21 d0                     	andq	%rdx, %r8
  83dfc2: 88 0c 30                     	movb	%cl, (%rax,%rsi)
  83dfc5: 42 88 4c 00 10               	movb	%cl, 0x10(%rax,%r8)
  83dfca: f3 41 0f 6f 46 78            	movdqu	0x78(%r14), %xmm0
  83dfd0: 40 0f b6 cf                  	movzbl	%dil, %ecx
  83dfd4: 66 0f 6e c9                  	movd	%ecx, %xmm1
  83dfd8: 66 0f c6 0d 0f d5 86 ff 02   	shufpd	$0x2, -0x792af1(%rip), %xmm1 # xmm1 = xmm1[0],mem[1]
                                                                        # 0xab4f0
  83dfe1: 66 0f fb c1                  	psubq	%xmm1, %xmm0
  83dfe5: f3 41 0f 7f 46 78            	movdqu	%xmm0, 0x78(%r14)
  83dfeb: 48 c1 e6 05                  	shlq	$0x5, %rsi
  83dfef: 48 89 c1                     	movq	%rax, %rcx
  83dff2: 48 29 f1                     	subq	%rsi, %rcx
  83dff5: 48 f7 de                     	negq	%rsi
  83dff8: 4c 89 6c 30 e0               	movq	%r13, -0x20(%rax,%rsi)
  83dffd: 48 89 59 e8                  	movq	%rbx, -0x18(%rcx)
  83e001: 4c 89 79 f0                  	movq	%r15, -0x10(%rcx)
  83e005: 48 89 69 f8                  	movq	%rbp, -0x8(%rcx)
  83e009: 49 8d 6e 40                  	leaq	0x40(%r14), %rbp
  83e00d: e9 65 f5 ff ff               	jmp	0x83d577 <PyInit_pyo3_async_runtimes+0x19dce7>
  83e012: b3 01                        	movb	$0x1, %bl
  83e014: e8 07 45 ff ff               	callq	0x832520 <PyInit_pyo3_async_runtimes+0x192c90>
  83e019: e9 02 02 00 00               	jmp	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83e01e: 48 8d 3d 82 73 8f ff         	leaq	-0x708c7e(%rip), %rdi   # 0x1353a7 ; rodata: 'assertion failed: prev.ref_count() >= 1assertion failed: self.tail.is_none()reached max `enter` depthCannot drop a runtime in a context where blocking is not allowed. This happens '
  83e025: 48 8d 15 ac 9a 2a 00         	leaq	0x2a9aac(%rip), %rdx    # 0xae7ad8 ; ELF relocation: local pointer 0xcfeb0
  83e02c: be 27 00 00 00               	movl	$0x27, %esi
  83e031: e8 7a 5e d3 ff               	callq	0x573eb0 <PyInit__native+0x2f77b0>
  83e036: e9 e5 01 00 00               	jmp	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83e03b: 48 89 d3                     	movq	%rdx, %rbx
  83e03e: e8 9d c3 fc ff               	callq	0x80a3e0 <PyInit_pyo3_async_runtimes+0x16ab50>
  83e043: 48 89 da                     	movq	%rbx, %rdx
  83e046: 84 c0                        	testb	%al, %al
  83e048: 0f 85 26 f4 ff ff            	jne	0x83d474 <PyInit_pyo3_async_runtimes+0x19dbe4>
  83e04e: 41 c6 46 44 01               	movb	$0x1, 0x44(%r14)
  83e053: e9 1c f4 ff ff               	jmp	0x83d474 <PyInit_pyo3_async_runtimes+0x19dbe4>
  83e058: e8 83 c3 fc ff               	callq	0x80a3e0 <PyInit_pyo3_async_runtimes+0x16ab50>
  83e05d: 84 c0                        	testb	%al, %al
  83e05f: 0f 85 33 f5 ff ff            	jne	0x83d598 <PyInit_pyo3_async_runtimes+0x19dd08>
  83e065: 41 c6 46 44 01               	movb	$0x1, 0x44(%r14)
  83e06a: e9 29 f5 ff ff               	jmp	0x83d598 <PyInit_pyo3_async_runtimes+0x19dd08>
  83e06f: 48 8d 3d 18 75 8f ff         	leaq	-0x708ae8(%rip), %rdi   # 0x13558e ; rodata: 'assertion failed: shared.shutdown_tx.is_some()`num_idle_threads` underflowed on thread exitTimer already firedcannot enter a task-local scope while the task-local storage is borrow'
  83e076: 48 8d 15 bb 9f 2a 00         	leaq	0x2a9fbb(%rip), %rdx    # 0xae8038 ; ELF relocation: local pointer 0xc780c
  83e07d: be 2e 00 00 00               	movl	$0x2e, %esi
  83e082: e8 29 5e d3 ff               	callq	0x573eb0 <PyInit__native+0x2f77b0>
  83e087: e9 94 01 00 00               	jmp	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83e08c: 48 8d 5c 24 30               	leaq	0x30(%rsp), %rbx
  83e091: bf 08 00 00 00               	movl	$0x8, %edi
  83e096: be 30 00 00 00               	movl	$0x30, %esi
  83e09b: e8 d2 80 b1 ff               	callq	0x356172 <PyInit__native+0xd9a72>
  83e0a0: e9 7b 01 00 00               	jmp	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83e0a5: bf 08 00 00 00               	movl	$0x8, %edi
  83e0aa: be 48 00 00 00               	movl	$0x48, %esi
  83e0af: e8 be 80 b1 ff               	callq	0x356172 <PyInit__native+0xd9a72>
  83e0b4: e9 67 01 00 00               	jmp	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83e0b9: bf 08 00 00 00               	movl	$0x8, %edi
  83e0be: be 18 00 00 00               	movl	$0x18, %esi
  83e0c3: e8 aa 80 b1 ff               	callq	0x356172 <PyInit__native+0xd9a72>
  83e0c8: e9 53 01 00 00               	jmp	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83e0cd: 48 8d 15 14 26 87 ff         	leaq	-0x78d9ec(%rip), %rdx   # 0xb06e8
  83e0d4: 4c 8d 0d fd 8a 2a 00         	leaq	0x2a8afd(%rip), %r9     # 0xae6bd8 ; ELF relocation: local pointer 0xd5101
  83e0db: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  83e0e0: 31 ff                        	xorl	%edi, %edi
  83e0e2: 31 c9                        	xorl	%ecx, %ecx
  83e0e4: e8 28 38 ff ff               	callq	0x831911 <PyInit_pyo3_async_runtimes+0x192081>
  83e0e9: e9 32 01 00 00               	jmp	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83e0ee: 48 8d 35 d1 1c 89 ff         	leaq	-0x76e32f(%rip), %rsi   # 0xcfdc6 ; rodata: '__pthread_get_minstack'
  83e0f5: 31 ff                        	xorl	%edi, %edi
  83e0f7: ff 15 53 a4 2b 00            	callq	*0x2ba453(%rip)         # 0xaf8550 ; ELF relocation: dlsym
  83e0fd: b9 00 40 00 00               	movl	$0x4000, %ecx           # imm = 0x4000
  83e102: 48 89 05 e7 cb 2b 00         	movq	%rax, 0x2bcbe7(%rip)    # 0xafacf0
  83e109: 48 85 c0                     	testq	%rax, %rax
  83e10c: 0f 85 66 fb ff ff            	jne	0x83dc78 <PyInit_pyo3_async_runtimes+0x19e3e8>
  83e112: e9 6b fb ff ff               	jmp	0x83dc82 <PyInit_pyo3_async_runtimes+0x19e3f2>
  83e117: 83 f8 01                     	cmpl	$0x1, %eax
  83e11a: 0f 85 99 00 00 00            	jne	0x83e1b9 <PyInit_pyo3_async_runtimes+0x19e929>
  83e120: 48 8d 35 39 5a ff ff         	leaq	-0xa5c7(%rip), %rsi     # 0x833b60 <PyInit_pyo3_async_runtimes+0x1942d0>
  83e127: 48 89 df                     	movq	%rbx, %rdi
  83e12a: e8 d1 2d ff ff               	callq	0x830f00 <PyInit_pyo3_async_runtimes+0x191670>
  83e12f: c6 43 08 00                  	movb	$0x0, 0x8(%rbx)
  83e133: 4c 8b 6c 24 18               	movq	0x18(%rsp), %r13
  83e138: e9 8a f7 ff ff               	jmp	0x83d8c7 <PyInit_pyo3_async_runtimes+0x19e037>
  83e13d: 48 83 c7 10                  	addq	$0x10, %rdi
  83e141: e8 3a 44 ff ff               	callq	0x832580 <PyInit_pyo3_async_runtimes+0x192cf0>
  83e146: e9 d5 00 00 00               	jmp	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83e14b: b3 01                        	movb	$0x1, %bl
  83e14d: 48 8d 15 58 25 87 ff         	leaq	-0x78daa8(%rip), %rdx   # 0xb06ac
  83e154: 4c 8d 0d 65 8a 2a 00         	leaq	0x2a8a65(%rip), %r9     # 0xae6bc0 ; ELF relocation: local pointer 0xd5101
  83e15b: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  83e160: 31 ff                        	xorl	%edi, %edi
  83e162: 31 c9                        	xorl	%ecx, %ecx
  83e164: e8 a8 37 ff ff               	callq	0x831911 <PyInit_pyo3_async_runtimes+0x192081>
  83e169: e9 b2 00 00 00               	jmp	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83e16e: 48 8d 15 73 25 87 ff         	leaq	-0x78da8d(%rip), %rdx   # 0xb06e8
  83e175: 4c 8d 0d f4 87 2a 00         	leaq	0x2a87f4(%rip), %r9     # 0xae6970 ; ELF relocation: local pointer 0xd5101
  83e17c: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  83e181: 31 ff                        	xorl	%edi, %edi
  83e183: 31 c9                        	xorl	%ecx, %ecx
  83e185: e8 87 37 ff ff               	callq	0x831911 <PyInit_pyo3_async_runtimes+0x192081>
  83e18a: e9 91 00 00 00               	jmp	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83e18f: 48 8d 15 52 25 87 ff         	leaq	-0x78daae(%rip), %rdx   # 0xb06e8
  83e196: 4c 8d 0d d3 87 2a 00         	leaq	0x2a87d3(%rip), %r9     # 0xae6970 ; ELF relocation: local pointer 0xd5101
  83e19d: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  83e1a2: 31 ff                        	xorl	%edi, %edi
  83e1a4: 31 c9                        	xorl	%ecx, %ecx
  83e1a6: e8 66 37 ff ff               	callq	0x831911 <PyInit_pyo3_async_runtimes+0x192081>
  83e1ab: eb 73                        	jmp	0x83e220 <PyInit_pyo3_async_runtimes+0x19e990>
  83e1ad: 48 89 05 54 cb 2b 00         	movq	%rax, 0x2bcb54(%rip)    # 0xafad08 ; ELF relocation: local pointer 0xad0cc0
  83e1b4: e9 9f fb ff ff               	jmp	0x83dd58 <PyInit_pyo3_async_runtimes+0x19e4c8>
  83e1b9: 48 c7 84 24 e0 00 00 00 00 00 00 00  	movq	$0x0, 0xe0(%rsp)
  83e1c5: 48 c7 84 24 e8 00 00 00 08 00 00 00  	movq	$0x8, 0xe8(%rsp)
  83e1d1: 66 0f ef c0                  	pxor	%xmm0, %xmm0
  83e1d5: f3 0f 7f 84 24 f0 00 00 00   	movdqu	%xmm0, 0xf0(%rsp)
  83e1de: 4c 8b 6c 24 18               	movq	0x18(%rsp), %r13
  83e1e3: e9 af f8 ff ff               	jmp	0x83da97 <PyInit_pyo3_async_runtimes+0x19e207>
  83e1e8: 49 8d 7e 68                  	leaq	0x68(%r14), %rdi
  83e1ec: 48 89 de                     	movq	%rbx, %rsi
  83e1ef: 4c 89 ea                     	movq	%r13, %rdx
  83e1f2: e8 49 b0 ff ff               	callq	0x839240 <PyInit_pyo3_async_runtimes+0x1999b0>
  83e1f7: e9 55 fc ff ff               	jmp	0x83de51 <PyInit_pyo3_async_runtimes+0x19e5c1>
  83e1fc: 66 0f 6f 00                  	movdqa	(%rax), %xmm0
  83e200: 66 0f d7 f0                  	pmovmskb	%xmm0, %esi
  83e204: f3 0f bc f6                  	tzcntl	%esi, %esi
  83e208: 0f b6 3c 30                  	movzbl	(%rax,%rsi), %edi
  83e20c: e9 a6 fd ff ff               	jmp	0x83dfb7 <PyInit_pyo3_async_runtimes+0x19e727>
  83e211: bf 08 00 00 00               	movl	$0x8, %edi
  83e216: be 40 00 00 00               	movl	$0x40, %esi
  83e21b: e8 48 7e b1 ff               	callq	0x356068 <PyInit__native+0xd9968>
  83e220: 0f 0b                        	ud2
  83e222: 49 89 c6                     	movq	%rax, %r14
  83e225: 48 8d bc 24 80 00 00 00      	leaq	0x80(%rsp), %rdi
  83e22d: e8 4e cc ff ff               	callq	0x83ae80 <PyInit_pyo3_async_runtimes+0x19b5f0>
  83e232: e9 b8 01 00 00               	jmp	0x83e3ef <PyInit_pyo3_async_runtimes+0x19eb5f>
  83e237: e8 a0 8e d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e23c: 49 89 c6                     	movq	%rax, %r14
  83e23f: b3 01                        	movb	$0x1, %bl
  83e241: e9 84 01 00 00               	jmp	0x83e3ca <PyInit_pyo3_async_runtimes+0x19eb3a>
  83e246: 49 89 c6                     	movq	%rax, %r14
  83e249: e9 a1 01 00 00               	jmp	0x83e3ef <PyInit_pyo3_async_runtimes+0x19eb5f>
  83e24e: 49 89 c6                     	movq	%rax, %r14
  83e251: e9 e3 01 00 00               	jmp	0x83e439 <PyInit_pyo3_async_runtimes+0x19eba9>
  83e256: 49 89 c6                     	movq	%rax, %r14
  83e259: eb 40                        	jmp	0x83e29b <PyInit_pyo3_async_runtimes+0x19ea0b>
  83e25b: 49 89 c6                     	movq	%rax, %r14
  83e25e: e9 65 01 00 00               	jmp	0x83e3c8 <PyInit_pyo3_async_runtimes+0x19eb38>
  83e263: 49 89 c6                     	movq	%rax, %r14
  83e266: 4c 89 e7                     	movq	%r12, %rdi
  83e269: 4c 89 ee                     	movq	%r13, %rsi
  83e26c: e8 af 4f ff ff               	callq	0x833220 <PyInit_pyo3_async_runtimes+0x193990>
  83e271: e9 9d 00 00 00               	jmp	0x83e313 <PyInit_pyo3_async_runtimes+0x19ea83>
  83e276: 49 89 c6                     	movq	%rax, %r14
  83e279: e9 95 00 00 00               	jmp	0x83e313 <PyInit_pyo3_async_runtimes+0x19ea83>
  83e27e: 49 89 c6                     	movq	%rax, %r14
  83e281: 48 8b 44 24 20               	movq	0x20(%rsp), %rax
  83e286: 48 85 c0                     	testq	%rax, %rax
  83e289: 74 10                        	je	0x83e29b <PyInit_pyo3_async_runtimes+0x19ea0b>
  83e28b: f0                           	lock
  83e28c: 48 ff 08                     	decq	(%rax)
  83e28f: 75 0a                        	jne	0x83e29b <PyInit_pyo3_async_runtimes+0x19ea0b>
  83e291: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83e296: e8 25 5a ff ff               	callq	0x833cc0 <PyInit_pyo3_async_runtimes+0x194430>
  83e29b: b3 01                        	movb	$0x1, %bl
  83e29d: 48 8d bc 24 80 00 00 00      	leaq	0x80(%rsp), %rdi
  83e2a5: e8 46 7d ff ff               	callq	0x835ff0 <PyInit_pyo3_async_runtimes+0x196760>
  83e2aa: e9 1b 01 00 00               	jmp	0x83e3ca <PyInit_pyo3_async_runtimes+0x19eb3a>
  83e2af: e8 28 8e d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e2b4: e8 23 8e d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e2b9: 49 89 c6                     	movq	%rax, %r14
  83e2bc: f0                           	lock
  83e2bd: 48 ff 0b                     	decq	(%rbx)
  83e2c0: 0f 85 73 01 00 00            	jne	0x83e439 <PyInit_pyo3_async_runtimes+0x19eba9>
  83e2c6: 48 89 df                     	movq	%rbx, %rdi
  83e2c9: e8 f2 cd ff ff               	callq	0x83b0c0 <PyInit_pyo3_async_runtimes+0x19b830>
  83e2ce: 8b 5c 24 0c                  	movl	0xc(%rsp), %ebx
  83e2d2: e9 66 01 00 00               	jmp	0x83e43d <PyInit_pyo3_async_runtimes+0x19ebad>
  83e2d7: e8 00 8e d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e2dc: 49 89 c6                     	movq	%rax, %r14
  83e2df: 4c 89 ef                     	movq	%r13, %rdi
  83e2e2: 48 89 ee                     	movq	%rbp, %rsi
  83e2e5: e8 36 4f ff ff               	callq	0x833220 <PyInit_pyo3_async_runtimes+0x193990>
  83e2ea: eb 1d                        	jmp	0x83e309 <PyInit_pyo3_async_runtimes+0x19ea79>
  83e2ec: e8 eb 8d d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e2f1: 49 89 c6                     	movq	%rax, %r14
  83e2f4: 4c 89 ff                     	movq	%r15, %rdi
  83e2f7: e8 f4 ca ff ff               	callq	0x83adf0 <PyInit_pyo3_async_runtimes+0x19b560>
  83e2fc: e9 38 01 00 00               	jmp	0x83e439 <PyInit_pyo3_async_runtimes+0x19eba9>
  83e301: e8 d6 8d d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e306: 49 89 c6                     	movq	%rax, %r14
  83e309: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83e30e: e8 ed 5b ff ff               	callq	0x833f00 <PyInit_pyo3_async_runtimes+0x194670>
  83e313: b3 01                        	movb	$0x1, %bl
  83e315: 48 8d bc 24 80 00 00 00      	leaq	0x80(%rsp), %rdi
  83e31d: e8 ce 7c ff ff               	callq	0x835ff0 <PyInit_pyo3_async_runtimes+0x196760>
  83e322: e9 a3 00 00 00               	jmp	0x83e3ca <PyInit_pyo3_async_runtimes+0x19eb3a>
  83e327: e8 b0 8d d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e32c: e8 ab 8d d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e331: 49 89 c6                     	movq	%rax, %r14
  83e334: e9 81 00 00 00               	jmp	0x83e3ba <PyInit_pyo3_async_runtimes+0x19eb2a>
  83e339: 49 89 c6                     	movq	%rax, %r14
  83e33c: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83e341: e8 6a 4c ff ff               	callq	0x832fb0 <PyInit_pyo3_async_runtimes+0x193720>
  83e346: 84 db                        	testb	%bl, %bl
  83e348: 75 68                        	jne	0x83e3b2 <PyInit_pyo3_async_runtimes+0x19eb22>
  83e34a: eb 6e                        	jmp	0x83e3ba <PyInit_pyo3_async_runtimes+0x19eb2a>
  83e34c: 49 89 c6                     	movq	%rax, %r14
  83e34f: 48 8d bc 24 80 00 00 00      	leaq	0x80(%rsp), %rdi
  83e357: e8 04 02 00 00               	callq	0x83e560 <PyInit_pyo3_async_runtimes+0x19ecd0>
  83e35c: eb 5c                        	jmp	0x83e3ba <PyInit_pyo3_async_runtimes+0x19eb2a>
  83e35e: 49 89 c6                     	movq	%rax, %r14
  83e361: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83e366: e8 65 02 00 00               	callq	0x83e5d0 <PyInit_pyo3_async_runtimes+0x19ed40>
  83e36b: eb 4d                        	jmp	0x83e3ba <PyInit_pyo3_async_runtimes+0x19eb2a>
  83e36d: e8 6a 8d d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e372: 49 89 c6                     	movq	%rax, %r14
  83e375: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83e37a: e8 e1 01 00 00               	callq	0x83e560 <PyInit_pyo3_async_runtimes+0x19ecd0>
  83e37f: eb 39                        	jmp	0x83e3ba <PyInit_pyo3_async_runtimes+0x19eb2a>
  83e381: e8 56 8d d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e386: 49 89 c6                     	movq	%rax, %r14
  83e389: 48 89 df                     	movq	%rbx, %rdi
  83e38c: e8 5f ea ff ff               	callq	0x83cdf0 <PyInit_pyo3_async_runtimes+0x19d560>
  83e391: 48 8d bc 24 e0 00 00 00      	leaq	0xe0(%rsp), %rdi
  83e399: e8 a2 02 00 00               	callq	0x83e640 <PyInit_pyo3_async_runtimes+0x19edb0>
  83e39e: b3 01                        	movb	$0x1, %bl
  83e3a0: eb 28                        	jmp	0x83e3ca <PyInit_pyo3_async_runtimes+0x19eb3a>
  83e3a2: e8 35 8d d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e3a7: 49 89 c6                     	movq	%rax, %r14
  83e3aa: e9 8a 00 00 00               	jmp	0x83e439 <PyInit_pyo3_async_runtimes+0x19eba9>
  83e3af: 49 89 c6                     	movq	%rax, %r14
  83e3b2: 4c 89 e7                     	movq	%r12, %rdi
  83e3b5: e8 e6 4d ff ff               	callq	0x8331a0 <PyInit_pyo3_async_runtimes+0x193910>
  83e3ba: f0                           	lock
  83e3bb: 49 ff 0f                     	decq	(%r15)
  83e3be: 75 08                        	jne	0x83e3c8 <PyInit_pyo3_async_runtimes+0x19eb38>
  83e3c0: 4c 89 ff                     	movq	%r15, %rdi
  83e3c3: e8 c8 e9 ff ff               	callq	0x83cd90 <PyInit_pyo3_async_runtimes+0x19d500>
  83e3c8: 31 db                        	xorl	%ebx, %ebx
  83e3ca: 48 8b 7c 24 18               	movq	0x18(%rsp), %rdi
  83e3cf: f0                           	lock
  83e3d0: 48 ff 0f                     	decq	(%rdi)
  83e3d3: 75 05                        	jne	0x83e3da <PyInit_pyo3_async_runtimes+0x19eb4a>
  83e3d5: e8 e6 2e ff ff               	callq	0x8312c0 <PyInit_pyo3_async_runtimes+0x191a30>
  83e3da: 84 db                        	testb	%bl, %bl
  83e3dc: 74 11                        	je	0x83e3ef <PyInit_pyo3_async_runtimes+0x19eb5f>
  83e3de: 31 db                        	xorl	%ebx, %ebx
  83e3e0: 48 8b 6c 24 68               	movq	0x68(%rsp), %rbp
  83e3e5: 4c 8b a4 24 08 01 00 00      	movq	0x108(%rsp), %r12
  83e3ed: eb 21                        	jmp	0x83e410 <PyInit_pyo3_async_runtimes+0x19eb80>
  83e3ef: 48 8b 6c 24 68               	movq	0x68(%rsp), %rbp
  83e3f4: eb 43                        	jmp	0x83e439 <PyInit_pyo3_async_runtimes+0x19eba9>
  83e3f6: e8 e1 8c d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e3fb: 49 89 c6                     	movq	%rax, %r14
  83e3fe: 4c 89 ff                     	movq	%r15, %rdi
  83e401: e8 1a f0 00 00               	callq	0x84d420 <PyInit_pyo3_async_runtimes+0x1adb90>
  83e406: eb 35                        	jmp	0x83e43d <PyInit_pyo3_async_runtimes+0x19ebad>
  83e408: e8 cf 8c d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
  83e40d: 49 89 c6                     	movq	%rax, %r14
  83e410: 48 8d bc 24 10 01 00 00      	leaq	0x110(%rsp), %rdi
  83e418: e8 93 02 00 00               	callq	0x83e6b0 <PyInit_pyo3_async_runtimes+0x19ee20>
  83e41d: 48 83 bc 24 d0 00 00 00 00   	cmpq	$0x0, 0xd0(%rsp)
  83e426: 0f 9f c0                     	setg	%al
  83e429: 20 c3                        	andb	%al, %bl
  83e42b: 80 fb 01                     	cmpb	$0x1, %bl
  83e42e: 75 09                        	jne	0x83e439 <PyInit_pyo3_async_runtimes+0x19eba9>
  83e430: 4c 89 e7                     	movq	%r12, %rdi
  83e433: ff 15 5f 94 2b 00            	callq	*0x2b945f(%rip)         # 0xaf7898 ; ELF relocation: free
  83e439: 8b 5c 24 0c                  	movl	0xc(%rsp), %ebx
  83e43d: 0f b6 f3                     	movzbl	%bl, %esi
  83e440: 48 89 ef                     	movq	%rbp, %rdi
  83e443: e8 08 9b a4 ff               	callq	0x287f50 <PyInit__native+0xb850>
  83e448: 4c 89 f7                     	movq	%r14, %rdi
  83e44b: e8 80 f9 27 00               	callq	0xabddd0 <_Unwind_Resume@plt>
  83e450: e8 87 8c d3 ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
