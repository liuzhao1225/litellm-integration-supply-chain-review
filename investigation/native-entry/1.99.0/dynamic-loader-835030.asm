
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

0000000000699660 <PyInit_pyo3_async_runtimes>:
  835030: 55                           	pushq	%rbp
  835031: 41 57                        	pushq	%r15
  835033: 41 56                        	pushq	%r14
  835035: 41 55                        	pushq	%r13
  835037: 41 54                        	pushq	%r12
  835039: 53                           	pushq	%rbx
  83503a: 48 81 ec 48 01 00 00         	subq	$0x148, %rsp            # imm = 0x148
  835041: 49 89 d4                     	movq	%rdx, %r12
  835044: 49 89 f7                     	movq	%rsi, %r15
  835047: 49 89 fe                     	movq	%rdi, %r14
  83504a: 48 8d 6f 40                  	leaq	0x40(%rdi), %rbp
  83504e: b9 01 00 00 00               	movl	$0x1, %ecx
  835053: 31 c0                        	xorl	%eax, %eax
  835055: f0                           	lock
  835056: 0f b1 4f 40                  	cmpxchgl	%ecx, 0x40(%rdi)
  83505a: 0f 85 89 00 00 00            	jne	0x8350e9 <PyInit_pyo3_async_runtimes+0x19ba89>
  835060: 48 8b 05 d9 d3 2b 00         	movq	0x2bd3d9(%rip), %rax    # 0xaf2440
  835067: 48 d1 e0                     	shlq	%rax
  83506a: 48 85 c0                     	testq	%rax, %rax
  83506d: 0f 85 91 00 00 00            	jne	0x835104 <PyInit_pyo3_async_runtimes+0x19baa4>
  835073: 31 db                        	xorl	%ebx, %ebx
  835075: 41 0f b6 46 44               	movzbl	0x44(%r14), %eax
  83507a: 41 80 be c4 00 00 00 00      	cmpb	$0x0, 0xc4(%r14)
  835082: 89 5c 24 0c                  	movl	%ebx, 0xc(%rsp)
  835086: 0f 84 99 00 00 00            	je	0x835125 <PyInit_pyo3_async_runtimes+0x19bac5>
  83508c: f0                           	lock
  83508d: 49 83 2f 40                  	subq	$0x40, (%r15)
  835091: 0f 82 d7 0b 00 00            	jb	0x835c6e <PyInit_pyo3_async_runtimes+0x19c60e>
  835097: 49 8b 47 10                  	movq	0x10(%r15), %rax
  83509b: 4c 89 ff                     	movq	%r15, %rdi
  83509e: ff 50 30                     	callq	*0x30(%rax)
  8350a1: 31 d2                        	xorl	%edx, %edx
  8350a3: 80 7c 24 0c 00               	cmpb	$0x0, 0xc(%rsp)
  8350a8: 75 1a                        	jne	0x8350c4 <PyInit_pyo3_async_runtimes+0x19ba64>
  8350aa: 48 8b 05 8f d3 2b 00         	movq	0x2bd38f(%rip), %rax    # 0xaf2440
  8350b1: 48 b9 ff ff ff ff ff ff ff 7f	movabsq	$0x7fffffffffffffff, %rcx # imm = 0x7FFFFFFFFFFFFFFF
  8350bb: 48 85 c8                     	testq	%rcx, %rax
  8350be: 0f 85 c7 0b 00 00            	jne	0x835c8b <PyInit_pyo3_async_runtimes+0x19c62b>
  8350c4: 31 c9                        	xorl	%ecx, %ecx
  8350c6: 87 4d 00                     	xchgl	%ecx, (%rbp)
  8350c9: b8 01 00 00 00               	movl	$0x1, %eax
  8350ce: 83 f9 02                     	cmpl	$0x2, %ecx
  8350d1: 0f 84 21 01 00 00            	je	0x8351f8 <PyInit_pyo3_async_runtimes+0x19bb98>
  8350d7: 48 81 c4 48 01 00 00         	addq	$0x148, %rsp            # imm = 0x148
  8350de: 5b                           	popq	%rbx
  8350df: 41 5c                        	popq	%r12
  8350e1: 41 5d                        	popq	%r13
  8350e3: 41 5e                        	popq	%r14
  8350e5: 41 5f                        	popq	%r15
  8350e7: 5d                           	popq	%rbp
  8350e8: c3                           	retq
  8350e9: 48 89 ef                     	movq	%rbp, %rdi
  8350ec: e8 2f d1 fc ff               	callq	0x802220 <PyInit_pyo3_async_runtimes+0x168bc0>
  8350f1: 48 8b 05 48 d3 2b 00         	movq	0x2bd348(%rip), %rax    # 0xaf2440
  8350f8: 48 d1 e0                     	shlq	%rax
  8350fb: 48 85 c0                     	testq	%rax, %rax
  8350fe: 0f 84 6f ff ff ff            	je	0x835073 <PyInit_pyo3_async_runtimes+0x19ba13>
  835104: e8 27 cf fc ff               	callq	0x802030 <PyInit_pyo3_async_runtimes+0x1689d0>
  835109: 89 c3                        	movl	%eax, %ebx
  83510b: 80 f3 01                     	xorb	$0x1, %bl
  83510e: 41 0f b6 46 44               	movzbl	0x44(%r14), %eax
  835113: 41 80 be c4 00 00 00 00      	cmpb	$0x0, 0xc4(%r14)
  83511b: 89 5c 24 0c                  	movl	%ebx, 0xc(%rsp)
  83511f: 0f 85 67 ff ff ff            	jne	0x83508c <PyInit_pyo3_async_runtimes+0x19ba2c>
  835125: 49 8b 4e 48                  	movq	0x48(%r14), %rcx
  835129: 49 8b 46 60                  	movq	0x60(%r14), %rax
  83512d: 48 39 c8                     	cmpq	%rcx, %rax
  835130: 75 11                        	jne	0x835143 <PyInit_pyo3_async_runtimes+0x19bae3>
  835132: 49 8d 7e 48                  	leaq	0x48(%r14), %rdi
  835136: e8 d5 0f 00 00               	callq	0x836110 <PyInit_pyo3_async_runtimes+0x19cab0>
  83513b: 49 8b 4e 48                  	movq	0x48(%r14), %rcx
  83513f: 49 8b 46 60                  	movq	0x60(%r14), %rax
  835143: 48 8d 50 01                  	leaq	0x1(%rax), %rdx
  835147: 49 89 56 60                  	movq	%rdx, 0x60(%r14)
  83514b: 49 03 46 58                  	addq	0x58(%r14), %rax
  83514f: 31 d2                        	xorl	%edx, %edx
  835151: 48 39 c8                     	cmpq	%rcx, %rax
  835154: 48 0f 43 d1                  	cmovaeq	%rcx, %rdx
  835158: 48 29 d0                     	subq	%rdx, %rax
  83515b: 49 8b 4e 50                  	movq	0x50(%r14), %rcx
  83515f: 48 c1 e0 04                  	shlq	$0x4, %rax
  835163: 4c 89 3c 01                  	movq	%r15, (%rcx,%rax)
  835167: c6 44 01 08 01               	movb	$0x1, 0x8(%rcx,%rax)
  83516c: f0                           	lock
  83516d: 49 ff 86 00 01 00 00         	incq	0x100(%r14)
  835174: 49 8b 86 f8 00 00 00         	movq	0xf8(%r14), %rax
  83517b: 48 85 c0                     	testq	%rax, %rax
  83517e: 74 37                        	je	0x8351b7 <PyInit_pyo3_async_runtimes+0x19bb57>
  835180: f0                           	lock
  835181: 49 ff 8e f8 00 00 00         	decq	0xf8(%r14)
  835188: 41 ff 86 c0 00 00 00         	incl	0xc0(%r14)
  83518f: 49 8d b6 08 01 00 00         	leaq	0x108(%r14), %rsi
  835196: f0                           	lock
  835197: 41 ff 86 08 01 00 00         	incl	0x108(%r14)
  83519e: bf ca 00 00 00               	movl	$0xca, %edi
  8351a3: ba 81 00 00 00               	movl	$0x81, %edx
  8351a8: b9 01 00 00 00               	movl	$0x1, %ecx
  8351ad: 31 c0                        	xorl	%eax, %eax
  8351af: ff 15 93 9e 2b 00            	callq	*0x2b9e93(%rip)         # 0xaef048 ; ELF relocation: syscall
  8351b5: eb 10                        	jmp	0x8351c7 <PyInit_pyo3_async_runtimes+0x19bb67>
  8351b7: 49 8b 86 f0 00 00 00         	movq	0xf0(%r14), %rax
  8351be: 49 3b 86 e8 00 00 00         	cmpq	0xe8(%r14), %rax
  8351c5: 75 5c                        	jne	0x835223 <PyInit_pyo3_async_runtimes+0x19bbc3>
  8351c7: 80 7c 24 0c 00               	cmpb	$0x0, 0xc(%rsp)
  8351cc: 75 1a                        	jne	0x8351e8 <PyInit_pyo3_async_runtimes+0x19bb88>
  8351ce: 48 8b 05 6b d2 2b 00         	movq	0x2bd26b(%rip), %rax    # 0xaf2440
  8351d5: 48 b9 ff ff ff ff ff ff ff 7f	movabsq	$0x7fffffffffffffff, %rcx # imm = 0x7FFFFFFFFFFFFFFF
  8351df: 48 85 c8                     	testq	%rcx, %rax
  8351e2: 0f 85 c0 0a 00 00            	jne	0x835ca8 <PyInit_pyo3_async_runtimes+0x19c648>
  8351e8: 31 c0                        	xorl	%eax, %eax
  8351ea: 31 c9                        	xorl	%ecx, %ecx
  8351ec: 87 4d 00                     	xchgl	%ecx, (%rbp)
  8351ef: 83 f9 02                     	cmpl	$0x2, %ecx
  8351f2: 0f 85 df fe ff ff            	jne	0x8350d7 <PyInit_pyo3_async_runtimes+0x19ba77>
  8351f8: bf ca 00 00 00               	movl	$0xca, %edi
  8351fd: 48 89 ee                     	movq	%rbp, %rsi
  835200: 48 89 d3                     	movq	%rdx, %rbx
  835203: ba 81 00 00 00               	movl	$0x81, %edx
  835208: b9 01 00 00 00               	movl	$0x1, %ecx
  83520d: 49 89 c6                     	movq	%rax, %r14
  835210: 31 c0                        	xorl	%eax, %eax
  835212: ff 15 30 9e 2b 00            	callq	*0x2b9e30(%rip)         # 0xaef048 ; ELF relocation: syscall
  835218: 4c 89 f0                     	movq	%r14, %rax
  83521b: 48 89 da                     	movq	%rbx, %rdx
  83521e: e9 b4 fe ff ff               	jmp	0x8350d7 <PyInit_pyo3_async_runtimes+0x19ba77>
  835223: 49 8b 86 98 00 00 00         	movq	0x98(%r14), %rax
  83522a: 48 85 c0                     	testq	%rax, %rax
  83522d: 0f 84 8c 0a 00 00            	je	0x835cbf <PyInit_pyo3_async_runtimes+0x19c65f>
  835233: f0                           	lock
  835234: 48 ff 00                     	incq	(%rax)
  835237: 0f 8e 33 0c 00 00            	jle	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  83523d: 49 8b 9e 98 00 00 00         	movq	0x98(%r14), %rbx
  835244: 49 8b 86 b8 00 00 00         	movq	0xb8(%r14), %rax
  83524b: 48 89 44 24 70               	movq	%rax, 0x70(%rsp)
  835250: 4d 8b 2c 24                  	movq	(%r12), %r13
  835254: 4d 8b 7c 24 08               	movq	0x8(%r12), %r15
  835259: 49 8b 46 30                  	movq	0x30(%r14), %rax
  83525d: 49 8b 4e 38                  	movq	0x38(%r14), %rcx
  835261: 48 8b 51 10                  	movq	0x10(%rcx), %rdx
  835265: 48 ff ca                     	decq	%rdx
  835268: 48 83 e2 f0                  	andq	$-0x10, %rdx
  83526c: 48 8d 34 10                  	leaq	(%rax,%rdx), %rsi
  835270: 48 83 c6 10                  	addq	$0x10, %rsi
  835274: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  835279: ff 51 28                     	callq	*0x28(%rcx)
  83527c: 49 8b 46 10                  	movq	0x10(%r14), %rax
  835280: 48 83 f8 01                  	cmpq	$0x1, %rax
  835284: 75 09                        	jne	0x83528f <PyInit_pyo3_async_runtimes+0x19bc2f>
  835286: 49 8b 4e 18                  	movq	0x18(%r14), %rcx
  83528a: 48 89 4c 24 78               	movq	%rcx, 0x78(%rsp)
  83528f: 48 8b 4c 24 20               	movq	0x20(%rsp), %rcx
  835294: 48 89 8c 24 d0 00 00 00      	movq	%rcx, 0xd0(%rsp)
  83529c: 4c 8b 64 24 28               	movq	0x28(%rsp), %r12
  8352a1: 48 8b 4c 24 30               	movq	0x30(%rsp), %rcx
  8352a6: ba 01 00 00 00               	movl	$0x1, %edx
  8352ab: be 01 00 00 00               	movl	$0x1, %esi
  8352b0: f0                           	lock
  8352b1: 49 0f c1 37                  	xaddq	%rsi, (%r15)
  8352b5: 49 83 fd 01                  	cmpq	$0x1, %r13
  8352b9: 75 0f                        	jne	0x8352ca <PyInit_pyo3_async_runtimes+0x19bc6a>
  8352bb: 48 85 f6                     	testq	%rsi, %rsi
  8352be: 48 8b 7c 24 70               	movq	0x70(%rsp), %rdi
  8352c3: 79 15                        	jns	0x8352da <PyInit_pyo3_async_runtimes+0x19bc7a>
  8352c5: e9 a6 0b 00 00               	jmp	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  8352ca: 48 85 f6                     	testq	%rsi, %rsi
  8352cd: 48 8b 7c 24 70               	movq	0x70(%rsp), %rdi
  8352d2: 0f 88 98 0b 00 00            	js	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  8352d8: 31 d2                        	xorl	%edx, %edx
  8352da: 48 8b b4 24 d0 00 00 00      	movq	0xd0(%rsp), %rsi
  8352e2: 48 89 b4 24 30 01 00 00      	movq	%rsi, 0x130(%rsp)
  8352ea: 4c 89 a4 24 38 01 00 00      	movq	%r12, 0x138(%rsp)
  8352f2: 48 89 8c 24 40 01 00 00      	movq	%rcx, 0x140(%rsp)
  8352fa: 48 89 94 24 10 01 00 00      	movq	%rdx, 0x110(%rsp)
  835302: 4c 89 bc 24 18 01 00 00      	movq	%r15, 0x118(%rsp)
  83530a: 48 89 bc 24 28 01 00 00      	movq	%rdi, 0x128(%rsp)
  835312: 48 89 9c 24 20 01 00 00      	movq	%rbx, 0x120(%rsp)
  83531a: 84 c0                        	testb	%al, %al
  83531c: 0f 85 7c 01 00 00            	jne	0x83549e <PyInit_pyo3_async_runtimes+0x19be3e>
  835322: 48 8b 05 0f d1 2b 00         	movq	0x2bd10f(%rip), %rax    # 0xaf2438
  835329: 48 85 c0                     	testq	%rax, %rax
  83532c: 74 0d                        	je	0x83533b <PyInit_pyo3_async_runtimes+0x19bcdb>
  83532e: 48 ff c8                     	decq	%rax
  835331: 48 89 44 24 78               	movq	%rax, 0x78(%rsp)
  835336: e9 63 01 00 00               	jmp	0x83549e <PyInit_pyo3_async_runtimes+0x19be3e>
  83533b: b3 01                        	movb	$0x1, %bl
  83533d: 48 8d 35 97 e7 8f ff         	leaq	-0x701869(%rip), %rsi   # 0x133adb ; rodata: 'RUST_MIN_STACKassertion failed: curr.is_join_waker_set()assertion failed: curr.is_join_interested()assertion failed: !curr.is_join_waker_set()assertion failed: curr.is_running()ass'
  835344: 48 8d bc 24 80 00 00 00      	leaq	0x80(%rsp), %rdi
  83534c: ba 0e 00 00 00               	movl	$0xe, %edx
  835351: e8 4a 89 ff ff               	callq	0x82dca0 <PyInit_pyo3_async_runtimes+0x194640>
  835356: 48 8b 9c 24 80 00 00 00      	movq	0x80(%rsp), %rbx
  83535e: 48 83 fb ff                  	cmpq	$-0x1, %rbx
  835362: 74 58                        	je	0x8353bc <PyInit_pyo3_async_runtimes+0x19bd5c>
  835364: 4c 8b bc 24 88 00 00 00      	movq	0x88(%rsp), %r15
  83536c: 48 8b 94 24 90 00 00 00      	movq	0x90(%rsp), %rdx
  835374: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  835379: 4c 89 fe                     	movq	%r15, %rsi
  83537c: e8 2f 1f d2 ff               	callq	0x5572b0 <PyInit__native+0x2dc7b0>
  835381: 83 7c 24 20 01               	cmpl	$0x1, 0x20(%rsp)
  835386: 0f 84 d7 00 00 00            	je	0x835463 <PyInit_pyo3_async_runtimes+0x19be03>
  83538c: 48 8b 4c 24 30               	movq	0x30(%rsp), %rcx
  835391: 48 85 c9                     	testq	%rcx, %rcx
  835394: 0f 84 c9 00 00 00            	je	0x835463 <PyInit_pyo3_async_runtimes+0x19be03>
  83539a: 48 8b 74 24 28               	movq	0x28(%rsp), %rsi
  83539f: 48 83 f9 01                  	cmpq	$0x1, %rcx
  8353a3: 75 22                        	jne	0x8353c7 <PyInit_pyo3_async_runtimes+0x19bd67>
  8353a5: 0f b6 06                     	movzbl	(%rsi), %eax
  8353a8: 83 f8 2b                     	cmpl	$0x2b, %eax
  8353ab: 0f 84 b2 00 00 00            	je	0x835463 <PyInit_pyo3_async_runtimes+0x19be03>
  8353b1: 83 f8 2d                     	cmpl	$0x2d, %eax
  8353b4: 0f 84 a9 00 00 00            	je	0x835463 <PyInit_pyo3_async_runtimes+0x19be03>
  8353ba: eb 0e                        	jmp	0x8353ca <PyInit_pyo3_async_runtimes+0x19bd6a>
  8353bc: 41 bd 00 00 20 00            	movl	$0x200000, %r13d        # imm = 0x200000
  8353c2: e9 c7 00 00 00               	jmp	0x83548e <PyInit_pyo3_async_runtimes+0x19be2e>
  8353c7: 0f b6 06                     	movzbl	(%rsi), %eax
  8353ca: 31 ff                        	xorl	%edi, %edi
  8353cc: 3c 2b                        	cmpb	$0x2b, %al
  8353ce: 40 0f 94 c7                  	sete	%dil
  8353d2: 48 89 ca                     	movq	%rcx, %rdx
  8353d5: 48 29 fa                     	subq	%rdi, %rdx
  8353d8: 48 01 fe                     	addq	%rdi, %rsi
  8353db: 48 89 f8                     	movq	%rdi, %rax
  8353de: 48 f7 d8                     	negq	%rax
  8353e1: 48 83 fa 11                  	cmpq	$0x11, %rdx
  8353e5: 73 3e                        	jae	0x835425 <PyInit_pyo3_async_runtimes+0x19bdc5>
  8353e7: 48 85 d2                     	testq	%rdx, %rdx
  8353ea: 0f 84 80 00 00 00            	je	0x835470 <PyInit_pyo3_async_runtimes+0x19be10>
  8353f0: 48 01 c1                     	addq	%rax, %rcx
  8353f3: 48 f7 d9                     	negq	%rcx
  8353f6: 45 31 ed                     	xorl	%r13d, %r13d
  8353f9: 31 c0                        	xorl	%eax, %eax
  8353fb: 0f b6 14 06                  	movzbl	(%rsi,%rax), %edx
  8353ff: 83 c2 d0                     	addl	$-0x30, %edx
  835402: 83 fa 09                     	cmpl	$0x9, %edx
  835405: 77 73                        	ja	0x83547a <PyInit_pyo3_async_runtimes+0x19be1a>
  835407: 4a 8d 3c ad 00 00 00 00      	leaq	(,%r13,4), %rdi
  83540f: 4c 01 ef                     	addq	%r13, %rdi
  835412: 89 d2                        	movl	%edx, %edx
  835414: 4c 8d 2c 7a                  	leaq	(%rdx,%rdi,2), %r13
  835418: 48 ff c0                     	incq	%rax
  83541b: 48 89 ca                     	movq	%rcx, %rdx
  83541e: 48 01 c2                     	addq	%rax, %rdx
  835421: 75 d8                        	jne	0x8353fb <PyInit_pyo3_async_runtimes+0x19bd9b>
  835423: eb 5b                        	jmp	0x835480 <PyInit_pyo3_async_runtimes+0x19be20>
  835425: 48 01 c1                     	addq	%rax, %rcx
  835428: 48 f7 d9                     	negq	%rcx
  83542b: 45 31 ed                     	xorl	%r13d, %r13d
  83542e: bf 0a 00 00 00               	movl	$0xa, %edi
  835433: 45 31 c0                     	xorl	%r8d, %r8d
  835436: 48 89 c8                     	movq	%rcx, %rax
  835439: 4c 01 c0                     	addq	%r8, %rax
  83543c: 74 42                        	je	0x835480 <PyInit_pyo3_async_runtimes+0x19be20>
  83543e: 4c 89 e8                     	movq	%r13, %rax
  835441: 48 f7 e7                     	mulq	%rdi
  835444: 70 1d                        	jo	0x835463 <PyInit_pyo3_async_runtimes+0x19be03>
  835446: 42 0f b6 14 06               	movzbl	(%rsi,%r8), %edx
  83544b: 83 c2 d0                     	addl	$-0x30, %edx
  83544e: 48 01 d0                     	addq	%rdx, %rax
  835451: 49 89 c5                     	movq	%rax, %r13
  835454: 0f 92 c0                     	setb	%al
  835457: 83 fa 09                     	cmpl	$0x9, %edx
  83545a: 77 07                        	ja	0x835463 <PyInit_pyo3_async_runtimes+0x19be03>
  83545c: 49 ff c0                     	incq	%r8
  83545f: 84 c0                        	testb	%al, %al
  835461: 74 d3                        	je	0x835436 <PyInit_pyo3_async_runtimes+0x19bdd6>
  835463: 41 bd 00 00 20 00            	movl	$0x200000, %r13d        # imm = 0x200000
  835469: 48 85 db                     	testq	%rbx, %rbx
  83546c: 75 17                        	jne	0x835485 <PyInit_pyo3_async_runtimes+0x19be25>
  83546e: eb 1e                        	jmp	0x83548e <PyInit_pyo3_async_runtimes+0x19be2e>
  835470: 45 31 ed                     	xorl	%r13d, %r13d
  835473: 48 85 db                     	testq	%rbx, %rbx
  835476: 75 0d                        	jne	0x835485 <PyInit_pyo3_async_runtimes+0x19be25>
  835478: eb 14                        	jmp	0x83548e <PyInit_pyo3_async_runtimes+0x19be2e>
  83547a: 41 bd 00 00 20 00            	movl	$0x200000, %r13d        # imm = 0x200000
  835480: 48 85 db                     	testq	%rbx, %rbx
  835483: 74 09                        	je	0x83548e <PyInit_pyo3_async_runtimes+0x19be2e>
  835485: 4c 89 ff                     	movq	%r15, %rdi
  835488: ff 15 e2 9a 2b 00            	callq	*0x2b9ae2(%rip)         # 0xaeef70 ; ELF relocation: free
  83548e: 4c 89 6c 24 78               	movq	%r13, 0x78(%rsp)
  835493: 49 8d 45 01                  	leaq	0x1(%r13), %rax
  835497: 48 89 05 9a cf 2b 00         	movq	%rax, 0x2bcf9a(%rip)    # 0xaf2438
  83549e: 48 8b 05 53 cf 2b 00         	movq	0x2bcf53(%rip), %rax    # 0xaf23f8
  8354a5: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  8354b0: 48 83 f8 ff                  	cmpq	$-0x1, %rax
  8354b4: 0f 84 a8 07 00 00            	je	0x835c62 <PyInit_pyo3_async_runtimes+0x19c602>
  8354ba: 48 8d 78 01                  	leaq	0x1(%rax), %rdi
  8354be: f0                           	lock
  8354bf: 48 0f b1 3d 31 cf 2b 00      	cmpxchgq	%rdi, 0x2bcf31(%rip)    # 0xaf23f8
  8354c7: 75 e7                        	jne	0x8354b0 <PyInit_pyo3_async_runtimes+0x19be50>
  8354c9: 31 db                        	xorl	%ebx, %ebx
  8354cb: 48 8d b4 24 30 01 00 00      	leaq	0x130(%rsp), %rsi
  8354d3: e8 68 4f ff ff               	callq	0x82a440 <PyInit_pyo3_async_runtimes+0x190de0>
  8354d8: 49 89 c5                     	movq	%rax, %r13
  8354db: 48 89 84 24 d8 00 00 00      	movq	%rax, 0xd8(%rsp)
  8354e3: 48 8d 3d 3e 9a 2b 00         	leaq	0x2b9a3e(%rip), %rdi    # 0xaeef28 ; ELF relocation: local pointer 0x0
  8354ea: e8 d1 01 28 00               	callq	0xab56c0 <__tls_get_addr@plt>
  8354ef: 48 8d 98 20 00 00 00         	leaq	0x20(%rax), %rbx
  8354f6: 0f b6 80 28 00 00 00         	movzbl	0x28(%rax), %eax
  8354fd: 85 c0                        	testl	%eax, %eax
  8354ff: 4c 89 a4 24 08 01 00 00      	movq	%r12, 0x108(%rsp)
  835507: 4c 89 6c 24 18               	movq	%r13, 0x18(%rsp)
  83550c: 48 89 6c 24 68               	movq	%rbp, 0x68(%rsp)
  835511: 0f 85 50 08 00 00            	jne	0x835d67 <PyInit_pyo3_async_runtimes+0x19c707>
  835517: 48 8b 03                     	movq	(%rbx), %rax
  83551a: 48 89 84 24 80 00 00 00      	movq	%rax, 0x80(%rsp)
  835522: 48 c7 03 00 00 00 00         	movq	$0x0, (%rbx)
  835529: 48 85 c0                     	testq	%rax, %rax
  83552c: 74 0f                        	je	0x83553d <PyInit_pyo3_async_runtimes+0x19bedd>
  83552e: f0                           	lock
  83552f: 48 ff 00                     	incq	(%rax)
  835532: 0f 8e 38 09 00 00            	jle	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835538: 48 8b 0b                     	movq	(%rbx), %rcx
  83553b: eb 02                        	jmp	0x83553f <PyInit_pyo3_async_runtimes+0x19bedf>
  83553d: 31 c9                        	xorl	%ecx, %ecx
  83553f: 48 89 4c 24 20               	movq	%rcx, 0x20(%rsp)
  835544: 48 89 03                     	movq	%rax, (%rbx)
  835547: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83554c: e8 ef 62 ff ff               	callq	0x82b840 <PyInit_pyo3_async_runtimes+0x1921e0>
  835551: 48 8b 44 24 20               	movq	0x20(%rsp), %rax
  835556: 48 85 c0                     	testq	%rax, %rax
  835559: 74 10                        	je	0x83556b <PyInit_pyo3_async_runtimes+0x19bf0b>
  83555b: f0                           	lock
  83555c: 48 ff 08                     	decq	(%rax)
  83555f: 75 0a                        	jne	0x83556b <PyInit_pyo3_async_runtimes+0x19bf0b>
  835561: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  835566: e8 a5 63 ff ff               	callq	0x82b910 <PyInit_pyo3_async_runtimes+0x1922b0>
  83556b: 48 8b ac 24 80 00 00 00      	movq	0x80(%rsp), %rbp
  835573: 48 89 ac 24 80 00 00 00      	movq	%rbp, 0x80(%rsp)
  83557b: b8 08 00 00 00               	movl	$0x8, %eax
  835580: 48 85 ed                     	testq	%rbp, %rbp
  835583: 0f 84 f3 00 00 00            	je	0x83567c <PyInit_pyo3_async_runtimes+0x19c01c>
  835589: 48 8b 5d 20                  	movq	0x20(%rbp), %rbx
  83558d: 48 8b 7d 10                  	movq	0x10(%rbp), %rdi
  835591: 48 8b 45 18                  	movq	0x18(%rbp), %rax
  835595: 48 8d b4 24 d8 00 00 00      	leaq	0xd8(%rsp), %rsi
  83559d: ff 50 28                     	callq	*0x28(%rax)
  8355a0: 49 89 c4                     	movq	%rax, %r12
  8355a3: 48 85 c0                     	testq	%rax, %rax
  8355a6: 0f 84 d9 00 00 00            	je	0x835685 <PyInit_pyo3_async_runtimes+0x19c025>
  8355ac: 49 89 d5                     	movq	%rdx, %r13
  8355af: bf 40 00 00 00               	movl	$0x40, %edi
  8355b4: ff 15 a6 99 2b 00            	callq	*0x2b99a6(%rip)         # 0xaeef60 ; ELF relocation: malloc
  8355ba: 48 85 c0                     	testq	%rax, %rax
  8355bd: 0f 84 9e 08 00 00            	je	0x835e61 <PyInit_pyo3_async_runtimes+0x19c801>
  8355c3: 4c 89 20                     	movq	%r12, (%rax)
  8355c6: 4c 89 68 08                  	movq	%r13, 0x8(%rax)
  8355ca: 48 c7 44 24 20 04 00 00 00   	movq	$0x4, 0x20(%rsp)
  8355d3: 48 89 44 24 28               	movq	%rax, 0x28(%rsp)
  8355d8: 48 c7 44 24 30 01 00 00 00   	movq	$0x1, 0x30(%rsp)
  8355e1: 48 85 db                     	testq	%rbx, %rbx
  8355e4: 0f 84 ac 00 00 00            	je	0x835696 <PyInit_pyo3_async_runtimes+0x19c036>
  8355ea: 4c 89 b4 24 00 01 00 00      	movq	%r14, 0x100(%rsp)
  8355f2: 41 bc 01 00 00 00            	movl	$0x1, %r12d
  8355f8: 41 bf 18 00 00 00            	movl	$0x18, %r15d
  8355fe: eb 23                        	jmp	0x835623 <PyInit_pyo3_async_runtimes+0x19bfc3>
  835600: 48 8b 44 24 28               	movq	0x28(%rsp), %rax
  835605: 49 ff c4                     	incq	%r12
  835608: 4e 89 6c 38 f8               	movq	%r13, -0x8(%rax,%r15)
  83560d: 4a 89 2c 38                  	movq	%rbp, (%rax,%r15)
  835611: 49 83 c7 10                  	addq	$0x10, %r15
  835615: 4c 89 64 24 30               	movq	%r12, 0x30(%rsp)
  83561a: 48 85 db                     	testq	%rbx, %rbx
  83561d: 0f 84 85 00 00 00            	je	0x8356a8 <PyInit_pyo3_async_runtimes+0x19c048>
  835623: 49 89 c6                     	movq	%rax, %r14
  835626: 48 8b 7b 10                  	movq	0x10(%rbx), %rdi
  83562a: 48 8b 43 18                  	movq	0x18(%rbx), %rax
  83562e: 48 8b 5b 20                  	movq	0x20(%rbx), %rbx
  835632: 48 8d b4 24 d8 00 00 00      	leaq	0xd8(%rsp), %rsi
  83563a: ff 50 28                     	callq	*0x28(%rax)
  83563d: 49 89 c5                     	movq	%rax, %r13
  835640: 48 8b 4c 24 20               	movq	0x20(%rsp), %rcx
  835645: 48 85 c0                     	testq	%rax, %rax
  835648: 74 63                        	je	0x8356ad <PyInit_pyo3_async_runtimes+0x19c04d>
  83564a: 48 89 d5                     	movq	%rdx, %rbp
  83564d: 49 39 cc                     	cmpq	%rcx, %r12
  835650: 4c 89 f0                     	movq	%r14, %rax
  835653: 75 b0                        	jne	0x835605 <PyInit_pyo3_async_runtimes+0x19bfa5>
  835655: 48 83 fb 01                  	cmpq	$0x1, %rbx
  835659: ba 02 00 00 00               	movl	$0x2, %edx
  83565e: 48 83 da 00                  	sbbq	$0x0, %rdx
  835662: b9 08 00 00 00               	movl	$0x8, %ecx
  835667: 41 b8 10 00 00 00            	movl	$0x10, %r8d
  83566d: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  835672: 4c 89 e6                     	movq	%r12, %rsi
  835675: e8 d6 c9 fc ff               	callq	0x802050 <PyInit_pyo3_async_runtimes+0x1689f0>
  83567a: eb 84                        	jmp	0x835600 <PyInit_pyo3_async_runtimes+0x19bfa0>
  83567c: 31 ed                        	xorl	%ebp, %ebp
  83567e: 45 31 e4                     	xorl	%r12d, %r12d
  835681: 31 c9                        	xorl	%ecx, %ecx
  835683: eb 42                        	jmp	0x8356c7 <PyInit_pyo3_async_runtimes+0x19c067>
  835685: 45 31 e4                     	xorl	%r12d, %r12d
  835688: 31 c9                        	xorl	%ecx, %ecx
  83568a: 4c 8b 6c 24 18               	movq	0x18(%rsp), %r13
  83568f: b8 08 00 00 00               	movl	$0x8, %eax
  835694: eb 31                        	jmp	0x8356c7 <PyInit_pyo3_async_runtimes+0x19c067>
  835696: b9 04 00 00 00               	movl	$0x4, %ecx
  83569b: 41 bc 01 00 00 00            	movl	$0x1, %r12d
  8356a1: 4c 8b 6c 24 18               	movq	0x18(%rsp), %r13
  8356a6: eb 1f                        	jmp	0x8356c7 <PyInit_pyo3_async_runtimes+0x19c067>
  8356a8: 48 8b 4c 24 20               	movq	0x20(%rsp), %rcx
  8356ad: 48 8b 44 24 28               	movq	0x28(%rsp), %rax
  8356b2: 48 8b ac 24 80 00 00 00      	movq	0x80(%rsp), %rbp
  8356ba: 4c 8b 6c 24 18               	movq	0x18(%rsp), %r13
  8356bf: 4c 8b b4 24 00 01 00 00      	movq	0x100(%rsp), %r14
  8356c7: 48 89 ac 24 f8 00 00 00      	movq	%rbp, 0xf8(%rsp)
  8356cf: 48 89 8c 24 e0 00 00 00      	movq	%rcx, 0xe0(%rsp)
  8356d7: 48 89 84 24 e8 00 00 00      	movq	%rax, 0xe8(%rsp)
  8356df: 4c 89 a4 24 f0 00 00 00      	movq	%r12, 0xf0(%rsp)
  8356e7: 48 c7 44 24 20 01 00 00 00   	movq	$0x1, 0x20(%rsp)
  8356f0: 48 c7 44 24 28 01 00 00 00   	movq	$0x1, 0x28(%rsp)
  8356f9: 66 0f ef c0                  	pxor	%xmm0, %xmm0
  8356fd: f3 0f 7f 44 24 30            	movdqu	%xmm0, 0x30(%rsp)
  835703: bf 30 00 00 00               	movl	$0x30, %edi
  835708: ff 15 52 98 2b 00            	callq	*0x2b9852(%rip)         # 0xaeef60 ; ELF relocation: malloc
  83570e: 48 85 c0                     	testq	%rax, %rax
  835711: 49 8d 6e 40                  	leaq	0x40(%r14), %rbp
  835715: 0f 84 c1 05 00 00            	je	0x835cdc <PyInit_pyo3_async_runtimes+0x19c67c>
  83571b: 49 89 c7                     	movq	%rax, %r15
  83571e: f3 0f 6f 44 24 20            	movdqu	0x20(%rsp), %xmm0
  835724: f3 0f 6f 4c 24 30            	movdqu	0x30(%rsp), %xmm1
  83572a: f3 0f 6f 54 24 40            	movdqu	0x40(%rsp), %xmm2
  835730: f3 0f 7f 50 20               	movdqu	%xmm2, 0x20(%rax)
  835735: f3 0f 7f 48 10               	movdqu	%xmm1, 0x10(%rax)
  83573a: f3 0f 7f 00                  	movdqu	%xmm0, (%rax)
  83573e: f0                           	lock
  83573f: 48 ff 00                     	incq	(%rax)
  835742: 0f 8e 28 07 00 00            	jle	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835748: 0f 10 84 24 10 01 00 00      	movups	0x110(%rsp), %xmm0
  835750: 0f 10 8c 24 20 01 00 00      	movups	0x120(%rsp), %xmm1
  835758: 0f 29 8c 24 90 00 00 00      	movaps	%xmm1, 0x90(%rsp)
  835760: 0f 29 84 24 80 00 00 00      	movaps	%xmm0, 0x80(%rsp)
  835768: f3 0f 6f 84 24 e0 00 00 00   	movdqu	0xe0(%rsp), %xmm0
  835771: f3 0f 6f 8c 24 f0 00 00 00   	movdqu	0xf0(%rsp), %xmm1
  83577a: 66 0f 7f 8c 24 b0 00 00 00   	movdqa	%xmm1, 0xb0(%rsp)
  835783: 66 0f 7f 84 24 a0 00 00 00   	movdqa	%xmm0, 0xa0(%rsp)
  83578c: 4c 89 bc 24 c0 00 00 00      	movq	%r15, 0xc0(%rsp)
  835794: 49 8b 7f 10                  	movq	0x10(%r15), %rdi
  835798: 48 85 ff                     	testq	%rdi, %rdi
  83579b: 74 0b                        	je	0x8357a8 <PyInit_pyo3_async_runtimes+0x19c148>
  83579d: f0                           	lock
  83579e: 48 ff 47 18                  	incq	0x18(%rdi)
  8357a2: 0f 8e e5 05 00 00            	jle	0x835d8d <PyInit_pyo3_async_runtimes+0x19c72d>
  8357a8: 48 8b 84 24 c0 00 00 00      	movq	0xc0(%rsp), %rax
  8357b0: 48 89 44 24 60               	movq	%rax, 0x60(%rsp)
  8357b5: 66 0f 6f 84 24 80 00 00 00   	movdqa	0x80(%rsp), %xmm0
  8357be: 66 0f 6f 8c 24 90 00 00 00   	movdqa	0x90(%rsp), %xmm1
  8357c7: 66 0f 6f 94 24 a0 00 00 00   	movdqa	0xa0(%rsp), %xmm2
  8357d0: 66 0f 6f 9c 24 b0 00 00 00   	movdqa	0xb0(%rsp), %xmm3
  8357d9: 66 0f 7f 5c 24 50            	movdqa	%xmm3, 0x50(%rsp)
  8357df: 66 0f 7f 54 24 40            	movdqa	%xmm2, 0x40(%rsp)
  8357e5: 66 0f 7f 4c 24 30            	movdqa	%xmm1, 0x30(%rsp)
  8357eb: 66 0f 7f 44 24 20            	movdqa	%xmm0, 0x20(%rsp)
  8357f1: bf 48 00 00 00               	movl	$0x48, %edi
  8357f6: ff 15 64 97 2b 00            	callq	*0x2b9764(%rip)         # 0xaeef60 ; ELF relocation: malloc
  8357fc: 48 85 c0                     	testq	%rax, %rax
  8357ff: 0f 84 f0 04 00 00            	je	0x835cf5 <PyInit_pyo3_async_runtimes+0x19c695>
  835805: 48 8b 8c 24 c0 00 00 00      	movq	0xc0(%rsp), %rcx
  83580d: 48 89 48 40                  	movq	%rcx, 0x40(%rax)
  835811: 66 0f 6f 84 24 80 00 00 00   	movdqa	0x80(%rsp), %xmm0
  83581a: 66 0f 6f 8c 24 90 00 00 00   	movdqa	0x90(%rsp), %xmm1
  835823: 66 0f 6f 94 24 a0 00 00 00   	movdqa	0xa0(%rsp), %xmm2
  83582c: 66 0f 6f 9c 24 b0 00 00 00   	movdqa	0xb0(%rsp), %xmm3
  835835: f3 0f 7f 58 30               	movdqu	%xmm3, 0x30(%rax)
  83583a: f3 0f 7f 50 20               	movdqu	%xmm2, 0x20(%rax)
  83583f: f3 0f 7f 48 10               	movdqu	%xmm1, 0x10(%rax)
  835844: f3 0f 7f 00                  	movdqu	%xmm0, (%rax)
  835848: f0                           	lock
  835849: 49 ff 45 00                  	incq	(%r13)
  83584d: 0f 8e 1d 06 00 00            	jle	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835853: 4c 89 6c 24 20               	movq	%r13, 0x20(%rsp)
  835858: 48 89 44 24 28               	movq	%rax, 0x28(%rsp)
  83585d: 48 8d 05 d4 92 2a 00         	leaq	0x2a92d4(%rip), %rax    # 0xadeb38 ; ELF relocation: local pointer 0x8361b0
  835864: 48 89 44 24 30               	movq	%rax, 0x30(%rsp)
  835869: bf 18 00 00 00               	movl	$0x18, %edi
  83586e: ff 15 ec 96 2b 00            	callq	*0x2b96ec(%rip)         # 0xaeef60 ; ELF relocation: malloc
  835874: 48 85 c0                     	testq	%rax, %rax
  835877: 0f 84 8c 04 00 00            	je	0x835d09 <PyInit_pyo3_async_runtimes+0x19c6a9>
  83587d: 49 89 c4                     	movq	%rax, %r12
  835880: 48 8b 44 24 30               	movq	0x30(%rsp), %rax
  835885: 49 89 44 24 10               	movq	%rax, 0x10(%r12)
  83588a: f3 0f 6f 44 24 20            	movdqu	0x20(%rsp), %xmm0
  835890: f3 41 0f 7f 04 24            	movdqu	%xmm0, (%r12)
  835896: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83589b: ff 15 5f a2 2b 00            	callq	*0x2ba25f(%rip)         # 0xaefb00 ; ELF relocation: pthread_attr_init
  8358a1: 89 44 24 10                  	movl	%eax, 0x10(%rsp)
  8358a5: 85 c0                        	testl	%eax, %eax
  8358a7: 0f 85 70 04 00 00            	jne	0x835d1d <PyInit_pyo3_async_runtimes+0x19c6bd>
  8358ad: 48 8b 05 cc c9 2b 00         	movq	0x2bc9cc(%rip), %rax    # 0xaf2280
  8358b4: b9 00 40 00 00               	movl	$0x4000, %ecx           # imm = 0x4000
  8358b9: 48 85 c0                     	testq	%rax, %rax
  8358bc: 74 14                        	je	0x8358d2 <PyInit_pyo3_async_runtimes+0x19c272>
  8358be: 48 83 f8 01                  	cmpq	$0x1, %rax
  8358c2: 0f 84 76 04 00 00            	je	0x835d3e <PyInit_pyo3_async_runtimes+0x19c6de>
  8358c8: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  8358cd: ff d0                        	callq	*%rax
  8358cf: 48 89 c1                     	movq	%rax, %rcx
  8358d2: 48 8b 74 24 78               	movq	0x78(%rsp), %rsi
  8358d7: 48 39 f1                     	cmpq	%rsi, %rcx
  8358da: 48 0f 47 f1                  	cmovaq	%rcx, %rsi
  8358de: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  8358e3: 48 89 f3                     	movq	%rsi, %rbx
  8358e6: ff 15 1c a2 2b 00            	callq	*0x2ba21c(%rip)         # 0xaefb08 ; ELF relocation: pthread_attr_setstacksize
  8358ec: 85 c0                        	testl	%eax, %eax
  8358ee: 74 69                        	je	0x835959 <PyInit_pyo3_async_runtimes+0x19c2f9>
  8358f0: 89 44 24 10                  	movl	%eax, 0x10(%rsp)
  8358f4: 83 f8 16                     	cmpl	$0x16, %eax
  8358f7: 0f 85 9e 04 00 00            	jne	0x835d9b <PyInit_pyo3_async_runtimes+0x19c73b>
  8358fd: bf 1e 00 00 00               	movl	$0x1e, %edi
  835902: ff 15 08 a2 2b 00            	callq	*0x2ba208(%rip)         # 0xaefb10 ; ELF relocation: sysconf
  835908: 48 8d 34 03                  	leaq	(%rbx,%rax), %rsi
  83590c: 48 ff ce                     	decq	%rsi
  83590f: 48 f7 d8                     	negq	%rax
  835912: 48 21 c6                     	andq	%rax, %rsi
  835915: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  83591a: ff 15 e8 a1 2b 00            	callq	*0x2ba1e8(%rip)         # 0xaefb08 ; ELF relocation: pthread_attr_setstacksize
  835920: 85 c0                        	testl	%eax, %eax
  835922: 74 35                        	je	0x835959 <PyInit_pyo3_async_runtimes+0x19c2f9>
  835924: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  835929: ff 15 59 a1 2b 00            	callq	*0x2ba159(%rip)         # 0xaefa88 ; ELF relocation: pthread_attr_destroy
  83592f: 89 44 24 10                  	movl	%eax, 0x10(%rsp)
  835933: 85 c0                        	testl	%eax, %eax
  835935: 0f 85 a4 04 00 00            	jne	0x835ddf <PyInit_pyo3_async_runtimes+0x19c77f>
  83593b: 4c 89 e7                     	movq	%r12, %rdi
  83593e: e8 ad 54 ff ff               	callq	0x82adf0 <PyInit_pyo3_async_runtimes+0x191790>
  835943: 48 8d 15 36 89 2a 00         	leaq	0x2a8936(%rip), %rdx    # 0xade280 ; ELF relocation: local pointer 0x1330b8
  83594a: f0                           	lock
  83594b: 49 ff 0f                     	decq	(%r15)
  83594e: 0f 84 85 00 00 00            	je	0x8359d9 <PyInit_pyo3_async_runtimes+0x19c379>
  835954: e9 8e 00 00 00               	jmp	0x8359e7 <PyInit_pyo3_async_runtimes+0x19c387>
  835959: 48 c7 44 24 10 00 00 00 00   	movq	$0x0, 0x10(%rsp)
  835962: 48 8d 15 d7 52 ff ff         	leaq	-0xad29(%rip), %rdx     # 0x82ac40 <PyInit_pyo3_async_runtimes+0x1915e0>
  835969: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  83596e: 48 8d 74 24 20               	leaq	0x20(%rsp), %rsi
  835973: 4c 89 e1                     	movq	%r12, %rcx
  835976: ff 15 9c a1 2b 00            	callq	*0x2ba19c(%rip)         # 0xaefb18 ; ELF relocation: pthread_create
  83597c: 85 c0                        	testl	%eax, %eax
  83597e: 0f 84 a9 00 00 00            	je	0x835a2d <PyInit_pyo3_async_runtimes+0x19c3cd>
  835984: 49 89 c5                     	movq	%rax, %r13
  835987: 31 db                        	xorl	%ebx, %ebx
  835989: 4c 89 e7                     	movq	%r12, %rdi
  83598c: e8 5f 54 ff ff               	callq	0x82adf0 <PyInit_pyo3_async_runtimes+0x191790>
  835991: 48 8b 0d 00 c9 2b 00         	movq	0x2bc900(%rip), %rcx    # 0xaf2298 ; ELF relocation: local pointer 0xac8508
  835998: 48 8d 05 99 85 2a 00         	leaq	0x2a8599(%rip), %rax    # 0xaddf38 ; ELF relocation: local pointer 0x825a30
  83599f: 48 39 c1                     	cmpq	%rax, %rcx
  8359a2: 0f 85 55 04 00 00            	jne	0x835dfd <PyInit_pyo3_async_runtimes+0x19c79d>
  8359a8: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  8359ad: ff 15 d5 a0 2b 00            	callq	*0x2ba0d5(%rip)         # 0xaefa88 ; ELF relocation: pthread_attr_destroy
  8359b3: 89 44 24 10                  	movl	%eax, 0x10(%rsp)
  8359b7: 85 c0                        	testl	%eax, %eax
  8359b9: 0f 85 ff 03 00 00            	jne	0x835dbe <PyInit_pyo3_async_runtimes+0x19c75e>
  8359bf: 4c 89 ea                     	movq	%r13, %rdx
  8359c2: 48 c1 e2 20                  	shlq	$0x20, %rdx
  8359c6: 48 83 ca 02                  	orq	$0x2, %rdx
  8359ca: 49 8d 6e 40                  	leaq	0x40(%r14), %rbp
  8359ce: 4c 8b 6c 24 18               	movq	0x18(%rsp), %r13
  8359d3: f0                           	lock
  8359d4: 49 ff 0f                     	decq	(%r15)
  8359d7: 75 0e                        	jne	0x8359e7 <PyInit_pyo3_async_runtimes+0x19c387>
  8359d9: 4c 89 ff                     	movq	%r15, %rdi
  8359dc: 48 89 d3                     	movq	%rdx, %rbx
  8359df: e8 fc ef ff ff               	callq	0x8349e0 <PyInit_pyo3_async_runtimes+0x19b380>
  8359e4: 48 89 da                     	movq	%rbx, %rdx
  8359e7: f0                           	lock
  8359e8: 49 ff 4d 00                  	decq	(%r13)
  8359ec: 75 21                        	jne	0x835a0f <PyInit_pyo3_async_runtimes+0x19c3af>
  8359ee: 4c 89 ef                     	movq	%r13, %rdi
  8359f1: 48 89 d3                     	movq	%rdx, %rbx
  8359f4: e8 17 35 ff ff               	callq	0x828f10 <PyInit_pyo3_async_runtimes+0x18f8b0>
  8359f9: 48 89 da                     	movq	%rbx, %rdx
  8359fc: 83 e3 03                     	andl	$0x3, %ebx
  8359ff: 48 8d 05 fe 97 88 ff         	leaq	-0x776802(%rip), %rax   # 0xbf204 ; rodata: ' hw'
  835a06: 48 63 0c 98                  	movslq	(%rax,%rbx,4), %rcx
  835a0a: 48 01 c1                     	addq	%rax, %rcx
  835a0d: ff e1                        	jmpq	*%rcx
  835a0f: 89 d3                        	movl	%edx, %ebx
  835a11: 83 e3 03                     	andl	$0x3, %ebx
  835a14: 48 8d 05 e9 97 88 ff         	leaq	-0x776817(%rip), %rax   # 0xbf204 ; rodata: ' hw'
  835a1b: 48 63 0c 98                  	movslq	(%rax,%rbx,4), %rcx
  835a1f: 48 01 c1                     	addq	%rax, %rcx
  835a22: ff e1                        	jmpq	*%rcx
  835a24: 0f b6 42 10                  	movzbl	0x10(%rdx), %eax
  835a28: e9 5a 01 00 00               	jmp	0x835b87 <PyInit_pyo3_async_runtimes+0x19c527>
  835a2d: 48 8b 6c 24 10               	movq	0x10(%rsp), %rbp
  835a32: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  835a37: ff 15 4b a0 2b 00            	callq	*0x2ba04b(%rip)         # 0xaefa88 ; ELF relocation: pthread_attr_destroy
  835a3d: 89 44 24 10                  	movl	%eax, 0x10(%rsp)
  835a41: 85 c0                        	testl	%eax, %eax
  835a43: 0f 85 75 03 00 00            	jne	0x835dbe <PyInit_pyo3_async_runtimes+0x19c75e>
  835a49: 48 8b 44 24 18               	movq	0x18(%rsp), %rax
  835a4e: 48 89 84 24 80 00 00 00      	movq	%rax, 0x80(%rsp)
  835a56: 4c 89 bc 24 88 00 00 00      	movq	%r15, 0x88(%rsp)
  835a5e: 48 89 ac 24 90 00 00 00      	movq	%rbp, 0x90(%rsp)
  835a66: f0                           	lock
  835a67: 49 ff 86 f0 00 00 00         	incq	0xf0(%r14)
  835a6e: 49 ff 86 b8 00 00 00         	incq	0xb8(%r14)
  835a75: 49 8b 9e 88 00 00 00         	movq	0x88(%r14), %rbx
  835a7c: 4d 8b ae 90 00 00 00         	movq	0x90(%r14), %r13
  835a83: 48 89 df                     	movq	%rbx, %rdi
  835a86: 4c 89 ee                     	movq	%r13, %rsi
  835a89: 48 8b 54 24 70               	movq	0x70(%rsp), %rdx
  835a8e: e8 cd b9 ff ff               	callq	0x831460 <PyInit_pyo3_async_runtimes+0x197e00>
  835a93: 49 89 c4                     	movq	%rax, %r12
  835a96: 49 83 7e 78 00               	cmpq	$0x0, 0x78(%r14)
  835a9b: 0f 84 97 03 00 00            	je	0x835e38 <PyInit_pyo3_async_runtimes+0x19c7d8>
  835aa1: 49 8b 46 68                  	movq	0x68(%r14), %rax
  835aa5: 49 8b 56 70                  	movq	0x70(%r14), %rdx
  835aa9: 4c 89 e1                     	movq	%r12, %rcx
  835aac: 48 c1 e9 39                  	shrq	$0x39, %rcx
  835ab0: 66 0f 6e c1                  	movd	%ecx, %xmm0
  835ab4: 66 0f 60 c0                  	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
  835ab8: f2 0f 70 c0 00               	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
  835abd: 66 0f 70 c0 44               	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
  835ac2: 45 31 c0                     	xorl	%r8d, %r8d
  835ac5: 66 0f 76 c9                  	pcmpeqd	%xmm1, %xmm1
  835ac9: 31 ff                        	xorl	%edi, %edi
  835acb: 48 8b 5c 24 18               	movq	0x18(%rsp), %rbx
  835ad0: 4c 8b 6c 24 70               	movq	0x70(%rsp), %r13
  835ad5: 49 21 d4                     	andq	%rdx, %r12
  835ad8: f3 42 0f 6f 14 20            	movdqu	(%rax,%r12), %xmm2
  835ade: 66 0f 6f da                  	movdqa	%xmm2, %xmm3
  835ae2: 66 0f 74 d8                  	pcmpeqb	%xmm0, %xmm3
  835ae6: 66 44 0f d7 cb               	pmovmskb	%xmm3, %r9d
  835aeb: 45 85 c9                     	testl	%r9d, %r9d
  835aee: 74 2c                        	je	0x835b1c <PyInit_pyo3_async_runtimes+0x19c4bc>
  835af0: f3 45 0f bc d9               	tzcntl	%r9d, %r11d
  835af5: 4d 01 e3                     	addq	%r12, %r11
  835af8: 49 21 d3                     	andq	%rdx, %r11
  835afb: 49 c1 e3 05                  	shlq	$0x5, %r11
  835aff: 49 89 c2                     	movq	%rax, %r10
  835b02: 4d 29 da                     	subq	%r11, %r10
  835b05: 4d 3b 6a e0                  	cmpq	-0x20(%r10), %r13
  835b09: 0f 84 b1 00 00 00            	je	0x835bc0 <PyInit_pyo3_async_runtimes+0x19c560>
  835b0f: 45 8d 51 ff                  	leal	-0x1(%r9), %r10d
  835b13: 66 45 21 ca                  	andw	%r9w, %r10w
  835b17: 45 89 d1                     	movl	%r10d, %r9d
  835b1a: 75 d4                        	jne	0x835af0 <PyInit_pyo3_async_runtimes+0x19c490>
  835b1c: 49 83 f8 01                  	cmpq	$0x1, %r8
  835b20: 74 12                        	je	0x835b34 <PyInit_pyo3_async_runtimes+0x19c4d4>
  835b22: 66 0f d7 f2                  	pmovmskb	%xmm2, %esi
  835b26: 85 f6                        	testl	%esi, %esi
  835b28: 74 24                        	je	0x835b4e <PyInit_pyo3_async_runtimes+0x19c4ee>
  835b2a: f3 0f bc f6                  	tzcntl	%esi, %esi
  835b2e: 4c 01 e6                     	addq	%r12, %rsi
  835b31: 48 21 d6                     	andq	%rdx, %rsi
  835b34: 66 0f 74 d1                  	pcmpeqb	%xmm1, %xmm2
  835b38: 66 44 0f d7 c2               	pmovmskb	%xmm2, %r8d
  835b3d: 45 85 c0                     	testl	%r8d, %r8d
  835b40: 0f 85 b4 00 00 00            	jne	0x835bfa <PyInit_pyo3_async_runtimes+0x19c59a>
  835b46: 41 b8 01 00 00 00            	movl	$0x1, %r8d
  835b4c: eb 03                        	jmp	0x835b51 <PyInit_pyo3_async_runtimes+0x19c4f1>
  835b4e: 45 31 c0                     	xorl	%r8d, %r8d
  835b51: 49 01 fc                     	addq	%rdi, %r12
  835b54: 49 83 c4 10                  	addq	$0x10, %r12
  835b58: 48 83 c7 10                  	addq	$0x10, %rdi
  835b5c: e9 74 ff ff ff               	jmp	0x835ad5 <PyInit_pyo3_async_runtimes+0x19c475>
  835b61: 48 8b 05 30 c7 2b 00         	movq	0x2bc730(%rip), %rax    # 0xaf2298 ; ELF relocation: local pointer 0xac8508
  835b68: 49 89 d7                     	movq	%rdx, %r15
  835b6b: 48 89 d7                     	movq	%rdx, %rdi
  835b6e: 48 c1 ef 20                  	shrq	$0x20, %rdi
  835b72: ff 50 08                     	callq	*0x8(%rax)
  835b75: 4c 89 fa                     	movq	%r15, %rdx
  835b78: eb 0d                        	jmp	0x835b87 <PyInit_pyo3_async_runtimes+0x19c527>
  835b7a: 48 89 d0                     	movq	%rdx, %rax
  835b7d: 48 c1 e8 20                  	shrq	$0x20, %rax
  835b81: eb 04                        	jmp	0x835b87 <PyInit_pyo3_async_runtimes+0x19c527>
  835b83: 0f b6 42 1f                  	movzbl	0x1f(%rdx), %eax
  835b87: 3c 0d                        	cmpb	$0xd, %al
  835b89: 0f 85 14 f5 ff ff            	jne	0x8350a3 <PyInit_pyo3_async_runtimes+0x19ba43>
  835b8f: 49 8b 86 f0 00 00 00         	movq	0xf0(%r14), %rax
  835b96: 48 85 c0                     	testq	%rax, %rax
  835b99: 0f 84 04 f5 ff ff            	je	0x8350a3 <PyInit_pyo3_async_runtimes+0x19ba43>
  835b9f: 8d 43 fe                     	leal	-0x2(%rbx), %eax
  835ba2: 83 f8 02                     	cmpl	$0x2, %eax
  835ba5: 0f 82 1c f6 ff ff            	jb	0x8351c7 <PyInit_pyo3_async_runtimes+0x19bb67>
  835bab: 48 85 db                     	testq	%rbx, %rbx
  835bae: 0f 84 13 f6 ff ff            	je	0x8351c7 <PyInit_pyo3_async_runtimes+0x19bb67>
  835bb4: 48 8d 7a ff                  	leaq	-0x1(%rdx), %rdi
  835bb8: ff 52 17                     	callq	*0x17(%rdx)
  835bbb: e9 07 f6 ff ff               	jmp	0x8351c7 <PyInit_pyo3_async_runtimes+0x19bb67>
  835bc0: 49 8b 42 f8                  	movq	-0x8(%r10), %rax
  835bc4: 48 89 44 24 30               	movq	%rax, 0x30(%rsp)
  835bc9: 41 0f 10 42 e8               	movups	-0x18(%r10), %xmm0
  835bce: 0f 29 44 24 20               	movaps	%xmm0, 0x20(%rsp)
  835bd3: 49 89 5a e8                  	movq	%rbx, -0x18(%r10)
  835bd7: 4d 89 7a f0                  	movq	%r15, -0x10(%r10)
  835bdb: 49 89 6a f8                  	movq	%rbp, -0x8(%r10)
  835bdf: 48 83 7c 24 20 00            	cmpq	$0x0, 0x20(%rsp)
  835be5: 74 0a                        	je	0x835bf1 <PyInit_pyo3_async_runtimes+0x19c591>
  835be7: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  835bec: e8 df ce ff ff               	callq	0x832ad0 <PyInit_pyo3_async_runtimes+0x199470>
  835bf1: 49 8d 6e 40                  	leaq	0x40(%r14), %rbp
  835bf5: e9 cd f5 ff ff               	jmp	0x8351c7 <PyInit_pyo3_async_runtimes+0x19bb67>
  835bfa: 0f b6 3c 30                  	movzbl	(%rax,%rsi), %edi
  835bfe: 40 84 ff                     	testb	%dil, %dil
  835c01: 0f 89 45 02 00 00            	jns	0x835e4c <PyInit_pyo3_async_runtimes+0x19c7ec>
  835c07: 40 80 e7 01                  	andb	$0x1, %dil
  835c0b: 4c 8d 46 f0                  	leaq	-0x10(%rsi), %r8
  835c0f: 49 21 d0                     	andq	%rdx, %r8
  835c12: 88 0c 30                     	movb	%cl, (%rax,%rsi)
  835c15: 42 88 4c 00 10               	movb	%cl, 0x10(%rax,%r8)
  835c1a: f3 41 0f 6f 46 78            	movdqu	0x78(%r14), %xmm0
  835c20: 40 0f b6 cf                  	movzbl	%dil, %ecx
  835c24: 66 0f 6e c9                  	movd	%ecx, %xmm1
  835c28: 66 0f c6 0d 9f 57 87 ff 02   	shufpd	$0x2, -0x78a861(%rip), %xmm1 # xmm1 = xmm1[0],mem[1]
                                                                        # 0xab3d0
  835c31: 66 0f fb c1                  	psubq	%xmm1, %xmm0
  835c35: f3 41 0f 7f 46 78            	movdqu	%xmm0, 0x78(%r14)
  835c3b: 48 c1 e6 05                  	shlq	$0x5, %rsi
  835c3f: 48 89 c1                     	movq	%rax, %rcx
  835c42: 48 29 f1                     	subq	%rsi, %rcx
  835c45: 48 f7 de                     	negq	%rsi
  835c48: 4c 89 6c 30 e0               	movq	%r13, -0x20(%rax,%rsi)
  835c4d: 48 89 59 e8                  	movq	%rbx, -0x18(%rcx)
  835c51: 4c 89 79 f0                  	movq	%r15, -0x10(%rcx)
  835c55: 48 89 69 f8                  	movq	%rbp, -0x8(%rcx)
  835c59: 49 8d 6e 40                  	leaq	0x40(%r14), %rbp
  835c5d: e9 65 f5 ff ff               	jmp	0x8351c7 <PyInit_pyo3_async_runtimes+0x19bb67>
  835c62: b3 01                        	movb	$0x1, %bl
  835c64: e8 07 45 ff ff               	callq	0x82a170 <PyInit_pyo3_async_runtimes+0x190b10>
  835c69: e9 02 02 00 00               	jmp	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835c6e: 48 8d 3d fa e2 8f ff         	leaq	-0x701d06(%rip), %rdi   # 0x133f6f ; rodata: 'assertion failed: prev.ref_count() >= 1assertion failed: self.tail.is_none()reached max `enter` depthCannot drop a runtime in a context where blocking is not allowed. This happens '
  835c75: 48 8d 15 34 95 2a 00         	leaq	0x2a9534(%rip), %rdx    # 0xadf1b0 ; ELF relocation: local pointer 0xcee20
  835c7c: be 27 00 00 00               	movl	$0x27, %esi
  835c81: e8 fa 18 d2 ff               	callq	0x557580 <PyInit__native+0x2dca80>
  835c86: e9 e5 01 00 00               	jmp	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835c8b: 48 89 d3                     	movq	%rdx, %rbx
  835c8e: e8 9d c3 fc ff               	callq	0x802030 <PyInit_pyo3_async_runtimes+0x1689d0>
  835c93: 48 89 da                     	movq	%rbx, %rdx
  835c96: 84 c0                        	testb	%al, %al
  835c98: 0f 85 26 f4 ff ff            	jne	0x8350c4 <PyInit_pyo3_async_runtimes+0x19ba64>
  835c9e: 41 c6 46 44 01               	movb	$0x1, 0x44(%r14)
  835ca3: e9 1c f4 ff ff               	jmp	0x8350c4 <PyInit_pyo3_async_runtimes+0x19ba64>
  835ca8: e8 83 c3 fc ff               	callq	0x802030 <PyInit_pyo3_async_runtimes+0x1689d0>
  835cad: 84 c0                        	testb	%al, %al
  835caf: 0f 85 33 f5 ff ff            	jne	0x8351e8 <PyInit_pyo3_async_runtimes+0x19bb88>
  835cb5: 41 c6 46 44 01               	movb	$0x1, 0x44(%r14)
  835cba: e9 29 f5 ff ff               	jmp	0x8351e8 <PyInit_pyo3_async_runtimes+0x19bb88>
  835cbf: 48 8d 3d 90 e4 8f ff         	leaq	-0x701b70(%rip), %rdi   # 0x134156 ; rodata: 'assertion failed: shared.shutdown_tx.is_some()`num_idle_threads` underflowed on thread exitTimer already firedcannot enter a task-local scope while the task-local storage is borrow'
  835cc6: 48 8d 15 43 9a 2a 00         	leaq	0x2a9a43(%rip), %rdx    # 0xadf710 ; ELF relocation: local pointer 0xc6920
  835ccd: be 2e 00 00 00               	movl	$0x2e, %esi
  835cd2: e8 a9 18 d2 ff               	callq	0x557580 <PyInit__native+0x2dca80>
  835cd7: e9 94 01 00 00               	jmp	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835cdc: 48 8d 5c 24 30               	leaq	0x30(%rsp), %rbx
  835ce1: bf 08 00 00 00               	movl	$0x8, %edi
  835ce6: be 30 00 00 00               	movl	$0x30, %esi
  835ceb: e8 52 5c b0 ff               	callq	0x33b942 <PyInit__native+0xc0e42>
  835cf0: e9 7b 01 00 00               	jmp	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835cf5: bf 08 00 00 00               	movl	$0x8, %edi
  835cfa: be 48 00 00 00               	movl	$0x48, %esi
  835cff: e8 3e 5c b0 ff               	callq	0x33b942 <PyInit__native+0xc0e42>
  835d04: e9 67 01 00 00               	jmp	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835d09: bf 08 00 00 00               	movl	$0x8, %edi
  835d0e: be 18 00 00 00               	movl	$0x18, %esi
  835d13: e8 2a 5c b0 ff               	callq	0x33b942 <PyInit__native+0xc0e42>
  835d18: e9 53 01 00 00               	jmp	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835d1d: 48 8d 15 80 96 87 ff         	leaq	-0x786980(%rip), %rdx   # 0xaf3a4
  835d24: 4c 8d 0d 85 85 2a 00         	leaq	0x2a8585(%rip), %r9     # 0xade2b0 ; ELF relocation: local pointer 0xd7e1f
  835d2b: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  835d30: 31 ff                        	xorl	%edi, %edi
  835d32: 31 c9                        	xorl	%ecx, %ecx
  835d34: e8 28 38 ff ff               	callq	0x829561 <PyInit_pyo3_async_runtimes+0x18ff01>
  835d39: e9 32 01 00 00               	jmp	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835d3e: 48 8d 35 f1 8f 89 ff         	leaq	-0x76700f(%rip), %rsi   # 0xced36 ; rodata: '__pthread_get_minstack'
  835d45: 31 ff                        	xorl	%edi, %edi
  835d47: ff 15 d3 9d 2b 00            	callq	*0x2b9dd3(%rip)         # 0xaefb20 ; ELF relocation: dlsym
  835d4d: b9 00 40 00 00               	movl	$0x4000, %ecx           # imm = 0x4000
  835d52: 48 89 05 27 c5 2b 00         	movq	%rax, 0x2bc527(%rip)    # 0xaf2280
  835d59: 48 85 c0                     	testq	%rax, %rax
  835d5c: 0f 85 66 fb ff ff            	jne	0x8358c8 <PyInit_pyo3_async_runtimes+0x19c268>
  835d62: e9 6b fb ff ff               	jmp	0x8358d2 <PyInit_pyo3_async_runtimes+0x19c272>
  835d67: 83 f8 01                     	cmpl	$0x1, %eax
  835d6a: 0f 85 99 00 00 00            	jne	0x835e09 <PyInit_pyo3_async_runtimes+0x19c7a9>
  835d70: 48 8d 35 39 5a ff ff         	leaq	-0xa5c7(%rip), %rsi     # 0x82b7b0 <PyInit_pyo3_async_runtimes+0x192150>
  835d77: 48 89 df                     	movq	%rbx, %rdi
  835d7a: e8 d1 2d ff ff               	callq	0x828b50 <PyInit_pyo3_async_runtimes+0x18f4f0>
  835d7f: c6 43 08 00                  	movb	$0x0, 0x8(%rbx)
  835d83: 4c 8b 6c 24 18               	movq	0x18(%rsp), %r13
  835d88: e9 8a f7 ff ff               	jmp	0x835517 <PyInit_pyo3_async_runtimes+0x19beb7>
  835d8d: 48 83 c7 10                  	addq	$0x10, %rdi
  835d91: e8 3a 44 ff ff               	callq	0x82a1d0 <PyInit_pyo3_async_runtimes+0x190b70>
  835d96: e9 d5 00 00 00               	jmp	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835d9b: b3 01                        	movb	$0x1, %bl
  835d9d: 48 8d 15 c4 95 87 ff         	leaq	-0x786a3c(%rip), %rdx   # 0xaf368
  835da4: 4c 8d 0d ed 84 2a 00         	leaq	0x2a84ed(%rip), %r9     # 0xade298 ; ELF relocation: local pointer 0xd7e1f
  835dab: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  835db0: 31 ff                        	xorl	%edi, %edi
  835db2: 31 c9                        	xorl	%ecx, %ecx
  835db4: e8 a8 37 ff ff               	callq	0x829561 <PyInit_pyo3_async_runtimes+0x18ff01>
  835db9: e9 b2 00 00 00               	jmp	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835dbe: 48 8d 15 df 95 87 ff         	leaq	-0x786a21(%rip), %rdx   # 0xaf3a4
  835dc5: 4c 8d 0d 7c 82 2a 00         	leaq	0x2a827c(%rip), %r9     # 0xade048 ; ELF relocation: local pointer 0xd7e1f
  835dcc: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  835dd1: 31 ff                        	xorl	%edi, %edi
  835dd3: 31 c9                        	xorl	%ecx, %ecx
  835dd5: e8 87 37 ff ff               	callq	0x829561 <PyInit_pyo3_async_runtimes+0x18ff01>
  835dda: e9 91 00 00 00               	jmp	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835ddf: 48 8d 15 be 95 87 ff         	leaq	-0x786a42(%rip), %rdx   # 0xaf3a4
  835de6: 4c 8d 0d 5b 82 2a 00         	leaq	0x2a825b(%rip), %r9     # 0xade048 ; ELF relocation: local pointer 0xd7e1f
  835ded: 48 8d 74 24 10               	leaq	0x10(%rsp), %rsi
  835df2: 31 ff                        	xorl	%edi, %edi
  835df4: 31 c9                        	xorl	%ecx, %ecx
  835df6: e8 66 37 ff ff               	callq	0x829561 <PyInit_pyo3_async_runtimes+0x18ff01>
  835dfb: eb 73                        	jmp	0x835e70 <PyInit_pyo3_async_runtimes+0x19c810>
  835dfd: 48 89 05 94 c4 2b 00         	movq	%rax, 0x2bc494(%rip)    # 0xaf2298 ; ELF relocation: local pointer 0xac8508
  835e04: e9 9f fb ff ff               	jmp	0x8359a8 <PyInit_pyo3_async_runtimes+0x19c348>
  835e09: 48 c7 84 24 e0 00 00 00 00 00 00 00  	movq	$0x0, 0xe0(%rsp)
  835e15: 48 c7 84 24 e8 00 00 00 08 00 00 00  	movq	$0x8, 0xe8(%rsp)
  835e21: 66 0f ef c0                  	pxor	%xmm0, %xmm0
  835e25: f3 0f 7f 84 24 f0 00 00 00   	movdqu	%xmm0, 0xf0(%rsp)
  835e2e: 4c 8b 6c 24 18               	movq	0x18(%rsp), %r13
  835e33: e9 af f8 ff ff               	jmp	0x8356e7 <PyInit_pyo3_async_runtimes+0x19c087>
  835e38: 49 8d 7e 68                  	leaq	0x68(%r14), %rdi
  835e3c: 48 89 de                     	movq	%rbx, %rsi
  835e3f: 4c 89 ea                     	movq	%r13, %rdx
  835e42: e8 49 b0 ff ff               	callq	0x830e90 <PyInit_pyo3_async_runtimes+0x197830>
  835e47: e9 55 fc ff ff               	jmp	0x835aa1 <PyInit_pyo3_async_runtimes+0x19c441>
  835e4c: 66 0f 6f 00                  	movdqa	(%rax), %xmm0
  835e50: 66 0f d7 f0                  	pmovmskb	%xmm0, %esi
  835e54: f3 0f bc f6                  	tzcntl	%esi, %esi
  835e58: 0f b6 3c 30                  	movzbl	(%rax,%rsi), %edi
  835e5c: e9 a6 fd ff ff               	jmp	0x835c07 <PyInit_pyo3_async_runtimes+0x19c5a7>
  835e61: bf 08 00 00 00               	movl	$0x8, %edi
  835e66: be 40 00 00 00               	movl	$0x40, %esi
  835e6b: e8 c8 59 b0 ff               	callq	0x33b838 <PyInit__native+0xc0d38>
  835e70: 0f 0b                        	ud2
  835e72: 49 89 c6                     	movq	%rax, %r14
  835e75: 48 8d bc 24 80 00 00 00      	leaq	0x80(%rsp), %rdi
  835e7d: e8 4e cc ff ff               	callq	0x832ad0 <PyInit_pyo3_async_runtimes+0x199470>
  835e82: e9 b8 01 00 00               	jmp	0x83603f <PyInit_pyo3_async_runtimes+0x19c9df>
  835e87: e8 20 49 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  835e8c: 49 89 c6                     	movq	%rax, %r14
  835e8f: b3 01                        	movb	$0x1, %bl
  835e91: e9 84 01 00 00               	jmp	0x83601a <PyInit_pyo3_async_runtimes+0x19c9ba>
  835e96: 49 89 c6                     	movq	%rax, %r14
  835e99: e9 a1 01 00 00               	jmp	0x83603f <PyInit_pyo3_async_runtimes+0x19c9df>
  835e9e: 49 89 c6                     	movq	%rax, %r14
  835ea1: e9 e3 01 00 00               	jmp	0x836089 <PyInit_pyo3_async_runtimes+0x19ca29>
  835ea6: 49 89 c6                     	movq	%rax, %r14
  835ea9: eb 40                        	jmp	0x835eeb <PyInit_pyo3_async_runtimes+0x19c88b>
  835eab: 49 89 c6                     	movq	%rax, %r14
  835eae: e9 65 01 00 00               	jmp	0x836018 <PyInit_pyo3_async_runtimes+0x19c9b8>
  835eb3: 49 89 c6                     	movq	%rax, %r14
  835eb6: 4c 89 e7                     	movq	%r12, %rdi
  835eb9: 4c 89 ee                     	movq	%r13, %rsi
  835ebc: e8 af 4f ff ff               	callq	0x82ae70 <PyInit_pyo3_async_runtimes+0x191810>
  835ec1: e9 9d 00 00 00               	jmp	0x835f63 <PyInit_pyo3_async_runtimes+0x19c903>
  835ec6: 49 89 c6                     	movq	%rax, %r14
  835ec9: e9 95 00 00 00               	jmp	0x835f63 <PyInit_pyo3_async_runtimes+0x19c903>
  835ece: 49 89 c6                     	movq	%rax, %r14
  835ed1: 48 8b 44 24 20               	movq	0x20(%rsp), %rax
  835ed6: 48 85 c0                     	testq	%rax, %rax
  835ed9: 74 10                        	je	0x835eeb <PyInit_pyo3_async_runtimes+0x19c88b>
  835edb: f0                           	lock
  835edc: 48 ff 08                     	decq	(%rax)
  835edf: 75 0a                        	jne	0x835eeb <PyInit_pyo3_async_runtimes+0x19c88b>
  835ee1: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  835ee6: e8 25 5a ff ff               	callq	0x82b910 <PyInit_pyo3_async_runtimes+0x1922b0>
  835eeb: b3 01                        	movb	$0x1, %bl
  835eed: 48 8d bc 24 80 00 00 00      	leaq	0x80(%rsp), %rdi
  835ef5: e8 46 7d ff ff               	callq	0x82dc40 <PyInit_pyo3_async_runtimes+0x1945e0>
  835efa: e9 1b 01 00 00               	jmp	0x83601a <PyInit_pyo3_async_runtimes+0x19c9ba>
  835eff: e8 a8 48 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  835f04: e8 a3 48 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  835f09: 49 89 c6                     	movq	%rax, %r14
  835f0c: f0                           	lock
  835f0d: 48 ff 0b                     	decq	(%rbx)
  835f10: 0f 85 73 01 00 00            	jne	0x836089 <PyInit_pyo3_async_runtimes+0x19ca29>
  835f16: 48 89 df                     	movq	%rbx, %rdi
  835f19: e8 f2 cd ff ff               	callq	0x832d10 <PyInit_pyo3_async_runtimes+0x1996b0>
  835f1e: 8b 5c 24 0c                  	movl	0xc(%rsp), %ebx
  835f22: e9 66 01 00 00               	jmp	0x83608d <PyInit_pyo3_async_runtimes+0x19ca2d>
  835f27: e8 80 48 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  835f2c: 49 89 c6                     	movq	%rax, %r14
  835f2f: 4c 89 ef                     	movq	%r13, %rdi
  835f32: 48 89 ee                     	movq	%rbp, %rsi
  835f35: e8 36 4f ff ff               	callq	0x82ae70 <PyInit_pyo3_async_runtimes+0x191810>
  835f3a: eb 1d                        	jmp	0x835f59 <PyInit_pyo3_async_runtimes+0x19c8f9>
  835f3c: e8 6b 48 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  835f41: 49 89 c6                     	movq	%rax, %r14
  835f44: 4c 89 ff                     	movq	%r15, %rdi
  835f47: e8 f4 ca ff ff               	callq	0x832a40 <PyInit_pyo3_async_runtimes+0x1993e0>
  835f4c: e9 38 01 00 00               	jmp	0x836089 <PyInit_pyo3_async_runtimes+0x19ca29>
  835f51: e8 56 48 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  835f56: 49 89 c6                     	movq	%rax, %r14
  835f59: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  835f5e: e8 ed 5b ff ff               	callq	0x82bb50 <PyInit_pyo3_async_runtimes+0x1924f0>
  835f63: b3 01                        	movb	$0x1, %bl
  835f65: 48 8d bc 24 80 00 00 00      	leaq	0x80(%rsp), %rdi
  835f6d: e8 ce 7c ff ff               	callq	0x82dc40 <PyInit_pyo3_async_runtimes+0x1945e0>
  835f72: e9 a3 00 00 00               	jmp	0x83601a <PyInit_pyo3_async_runtimes+0x19c9ba>
  835f77: e8 30 48 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  835f7c: e8 2b 48 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  835f81: 49 89 c6                     	movq	%rax, %r14
  835f84: e9 81 00 00 00               	jmp	0x83600a <PyInit_pyo3_async_runtimes+0x19c9aa>
  835f89: 49 89 c6                     	movq	%rax, %r14
  835f8c: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  835f91: e8 6a 4c ff ff               	callq	0x82ac00 <PyInit_pyo3_async_runtimes+0x1915a0>
  835f96: 84 db                        	testb	%bl, %bl
  835f98: 75 68                        	jne	0x836002 <PyInit_pyo3_async_runtimes+0x19c9a2>
  835f9a: eb 6e                        	jmp	0x83600a <PyInit_pyo3_async_runtimes+0x19c9aa>
  835f9c: 49 89 c6                     	movq	%rax, %r14
  835f9f: 48 8d bc 24 80 00 00 00      	leaq	0x80(%rsp), %rdi
  835fa7: e8 04 02 00 00               	callq	0x8361b0 <PyInit_pyo3_async_runtimes+0x19cb50>
  835fac: eb 5c                        	jmp	0x83600a <PyInit_pyo3_async_runtimes+0x19c9aa>
  835fae: 49 89 c6                     	movq	%rax, %r14
  835fb1: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  835fb6: e8 65 02 00 00               	callq	0x836220 <PyInit_pyo3_async_runtimes+0x19cbc0>
  835fbb: eb 4d                        	jmp	0x83600a <PyInit_pyo3_async_runtimes+0x19c9aa>
  835fbd: e8 ea 47 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  835fc2: 49 89 c6                     	movq	%rax, %r14
  835fc5: 48 8d 7c 24 20               	leaq	0x20(%rsp), %rdi
  835fca: e8 e1 01 00 00               	callq	0x8361b0 <PyInit_pyo3_async_runtimes+0x19cb50>
  835fcf: eb 39                        	jmp	0x83600a <PyInit_pyo3_async_runtimes+0x19c9aa>
  835fd1: e8 d6 47 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  835fd6: 49 89 c6                     	movq	%rax, %r14
  835fd9: 48 89 df                     	movq	%rbx, %rdi
  835fdc: e8 5f ea ff ff               	callq	0x834a40 <PyInit_pyo3_async_runtimes+0x19b3e0>
  835fe1: 48 8d bc 24 e0 00 00 00      	leaq	0xe0(%rsp), %rdi
  835fe9: e8 a2 02 00 00               	callq	0x836290 <PyInit_pyo3_async_runtimes+0x19cc30>
  835fee: b3 01                        	movb	$0x1, %bl
  835ff0: eb 28                        	jmp	0x83601a <PyInit_pyo3_async_runtimes+0x19c9ba>
  835ff2: e8 b5 47 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  835ff7: 49 89 c6                     	movq	%rax, %r14
  835ffa: e9 8a 00 00 00               	jmp	0x836089 <PyInit_pyo3_async_runtimes+0x19ca29>
  835fff: 49 89 c6                     	movq	%rax, %r14
  836002: 4c 89 e7                     	movq	%r12, %rdi
  836005: e8 e6 4d ff ff               	callq	0x82adf0 <PyInit_pyo3_async_runtimes+0x191790>
  83600a: f0                           	lock
  83600b: 49 ff 0f                     	decq	(%r15)
  83600e: 75 08                        	jne	0x836018 <PyInit_pyo3_async_runtimes+0x19c9b8>
  836010: 4c 89 ff                     	movq	%r15, %rdi
  836013: e8 c8 e9 ff ff               	callq	0x8349e0 <PyInit_pyo3_async_runtimes+0x19b380>
  836018: 31 db                        	xorl	%ebx, %ebx
  83601a: 48 8b 7c 24 18               	movq	0x18(%rsp), %rdi
  83601f: f0                           	lock
  836020: 48 ff 0f                     	decq	(%rdi)
  836023: 75 05                        	jne	0x83602a <PyInit_pyo3_async_runtimes+0x19c9ca>
  836025: e8 e6 2e ff ff               	callq	0x828f10 <PyInit_pyo3_async_runtimes+0x18f8b0>
  83602a: 84 db                        	testb	%bl, %bl
  83602c: 74 11                        	je	0x83603f <PyInit_pyo3_async_runtimes+0x19c9df>
  83602e: 31 db                        	xorl	%ebx, %ebx
  836030: 48 8b 6c 24 68               	movq	0x68(%rsp), %rbp
  836035: 4c 8b a4 24 08 01 00 00      	movq	0x108(%rsp), %r12
  83603d: eb 21                        	jmp	0x836060 <PyInit_pyo3_async_runtimes+0x19ca00>
  83603f: 48 8b 6c 24 68               	movq	0x68(%rsp), %rbp
  836044: eb 43                        	jmp	0x836089 <PyInit_pyo3_async_runtimes+0x19ca29>
  836046: e8 61 47 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  83604b: 49 89 c6                     	movq	%rax, %r14
  83604e: 4c 89 ff                     	movq	%r15, %rdi
  836051: e8 1a f0 00 00               	callq	0x845070 <PyInit_pyo3_async_runtimes+0x1aba10>
  836056: eb 35                        	jmp	0x83608d <PyInit_pyo3_async_runtimes+0x19ca2d>
  836058: e8 4f 47 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
  83605d: 49 89 c6                     	movq	%rax, %r14
  836060: 48 8d bc 24 10 01 00 00      	leaq	0x110(%rsp), %rdi
  836068: e8 93 02 00 00               	callq	0x836300 <PyInit_pyo3_async_runtimes+0x19cca0>
  83606d: 48 83 bc 24 d0 00 00 00 00   	cmpq	$0x0, 0xd0(%rsp)
  836076: 0f 9f c0                     	setg	%al
  836079: 20 c3                        	andb	%al, %bl
  83607b: 80 fb 01                     	cmpb	$0x1, %bl
  83607e: 75 09                        	jne	0x836089 <PyInit_pyo3_async_runtimes+0x19ca29>
  836080: 4c 89 e7                     	movq	%r12, %rdi
  836083: ff 15 e7 8e 2b 00            	callq	*0x2b8ee7(%rip)         # 0xaeef70 ; ELF relocation: free
  836089: 8b 5c 24 0c                  	movl	0xc(%rsp), %ebx
  83608d: 0f b6 f3                     	movzbl	%bl, %esi
  836090: 48 89 ef                     	movq	%rbp, %rdi
  836093: e8 b8 9f df ff               	callq	0x630050 <PyInit__native+0x3b5550>
  836098: 4c 89 f7                     	movq	%r14, %rdi
  83609b: e8 f0 f5 27 00               	callq	0xab5690 <_Unwind_Resume@plt>
  8360a0: e8 07 47 d2 ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
