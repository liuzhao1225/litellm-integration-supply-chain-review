
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  692510: 41 57                        	pushq	%r15
  692512: 41 56                        	pushq	%r14
  692514: 41 55                        	pushq	%r13
  692516: 41 54                        	pushq	%r12
  692518: 53                           	pushq	%rbx
  692519: 48 83 ec 10                  	subq	$0x10, %rsp
  69251d: b9 01 00 00 00               	movl	$0x1, %ecx
  692522: 31 c0                        	xorl	%eax, %eax
  692524: f0                           	lock
  692525: 0f b1 0d d4 78 46 00         	cmpxchgl	%ecx, 0x4678d4(%rip)    # 0xaf9e00
  69252c: 0f 85 0c 01 00 00            	jne	0x69263e <PyInit__native+0x415f3e>
  692532: 48 8b 05 87 89 46 00         	movq	0x468987(%rip), %rax    # 0xafaec0
  692539: 48 d1 e0                     	shlq	%rax
  69253c: 48 85 c0                     	testq	%rax, %rax
  69253f: 0f 85 18 01 00 00            	jne	0x69265d <PyInit__native+0x415f5d>
  692545: 31 c0                        	xorl	%eax, %eax
  692547: 0f b6 0d b6 78 46 00         	movzbl	0x4678b6(%rip), %ecx    # 0xaf9e04
  69254e: 84 c9                        	testb	%cl, %cl
  692550: 0f 85 1d 01 00 00            	jne	0x692673 <PyInit__native+0x415f73>
  692556: 48 b9 ff ff ff ff ff ff ff 7f	movabsq	$0x7fffffffffffffff, %rcx # imm = 0x7FFFFFFFFFFFFFFF
  692560: 4c 8b 35 b1 78 46 00         	movq	0x4678b1(%rip), %r14    # 0xaf9e18
  692567: 4d 85 f6                     	testq	%r14, %r14
  69256a: 0f 84 9b 00 00 00            	je	0x69260b <PyInit__native+0x415f0b>
  692570: 4c 8b 3d 91 78 46 00         	movq	0x467891(%rip), %r15    # 0xaf9e08
  692577: 48 8b 1d 92 78 46 00         	movq	0x467892(%rip), %rbx    # 0xaf9e10
  69257e: 48 c7 05 7f 78 46 00 00 00 00 00     	movq	$0x0, 0x46787f(%rip) # 0xaf9e08
  692589: 48 c7 05 7c 78 46 00 08 00 00 00     	movq	$0x8, 0x46787c(%rip) # 0xaf9e10
  692594: 48 c7 05 79 78 46 00 00 00 00 00     	movq	$0x0, 0x467879(%rip) # 0xaf9e18
  69259f: 84 c0                        	testb	%al, %al
  6925a1: 75 10                        	jne	0x6925b3 <PyInit__native+0x415eb3>
  6925a3: 48 8b 05 16 89 46 00         	movq	0x468916(%rip), %rax    # 0xafaec0
  6925aa: 48 85 c8                     	testq	%rcx, %rax
  6925ad: 0f 85 41 01 00 00            	jne	0x6926f4 <PyInit__native+0x415ff4>
  6925b3: 31 c0                        	xorl	%eax, %eax
  6925b5: 87 05 45 78 46 00            	xchgl	%eax, 0x467845(%rip)    # 0xaf9e00
  6925bb: 83 f8 02                     	cmpl	$0x2, %eax
  6925be: 0f 84 e2 00 00 00            	je	0x6926a6 <PyInit__native+0x415fa6>
  6925c4: 49 c1 e6 03                  	shlq	$0x3, %r14
  6925c8: 45 31 e4                     	xorl	%r12d, %r12d
  6925cb: 4c 8b 2d d6 52 46 00         	movq	0x4652d6(%rip), %r13    # 0xaf78a8 ; ELF relocation: _Py_DecRef
  6925d2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
  6925e0: 4a 8b 3c 23                  	movq	(%rbx,%r12), %rdi
  6925e4: 41 ff d5                     	callq	*%r13
  6925e7: 49 83 c4 08                  	addq	$0x8, %r12
  6925eb: 4d 39 e6                     	cmpq	%r12, %r14
  6925ee: 75 f0                        	jne	0x6925e0 <PyInit__native+0x415ee0>
  6925f0: 4d 85 ff                     	testq	%r15, %r15
  6925f3: 74 3b                        	je	0x692630 <PyInit__native+0x415f30>
  6925f5: 48 89 df                     	movq	%rbx, %rdi
  6925f8: 48 83 c4 10                  	addq	$0x10, %rsp
  6925fc: 5b                           	popq	%rbx
  6925fd: 41 5c                        	popq	%r12
  6925ff: 41 5d                        	popq	%r13
  692601: 41 5e                        	popq	%r14
  692603: 41 5f                        	popq	%r15
  692605: ff 25 8d 52 46 00            	jmpq	*0x46528d(%rip)         # 0xaf7898 ; ELF relocation: free
  69260b: 84 c0                        	testb	%al, %al
  69260d: 75 10                        	jne	0x69261f <PyInit__native+0x415f1f>
  69260f: 48 8b 05 aa 88 46 00         	movq	0x4688aa(%rip), %rax    # 0xafaec0
  692616: 48 85 c8                     	testq	%rcx, %rax
  692619: 0f 85 ee 00 00 00            	jne	0x69270d <PyInit__native+0x41600d>
  69261f: 31 c0                        	xorl	%eax, %eax
  692621: 87 05 d9 77 46 00            	xchgl	%eax, 0x4677d9(%rip)    # 0xaf9e00
  692627: 83 f8 02                     	cmpl	$0x2, %eax
  69262a: 0f 84 99 00 00 00            	je	0x6926c9 <PyInit__native+0x415fc9>
  692630: 48 83 c4 10                  	addq	$0x10, %rsp
  692634: 5b                           	popq	%rbx
  692635: 41 5c                        	popq	%r12
  692637: 41 5d                        	popq	%r13
  692639: 41 5e                        	popq	%r14
  69263b: 41 5f                        	popq	%r15
  69263d: c3                           	retq
  69263e: 48 8d 3d bb 77 46 00         	leaq	0x4677bb(%rip), %rdi    # 0xaf9e00
  692645: e8 86 7f 17 00               	callq	0x80a5d0 <PyInit_pyo3_async_runtimes+0x16ad40>
  69264a: 48 8b 05 6f 88 46 00         	movq	0x46886f(%rip), %rax    # 0xafaec0
  692651: 48 d1 e0                     	shlq	%rax
  692654: 48 85 c0                     	testq	%rax, %rax
  692657: 0f 84 e8 fe ff ff            	je	0x692545 <PyInit__native+0x415e45>
  69265d: e8 7e 7d 17 00               	callq	0x80a3e0 <PyInit_pyo3_async_runtimes+0x16ab50>
  692662: 34 01                        	xorb	$0x1, %al
  692664: 0f b6 0d 99 77 46 00         	movzbl	0x467799(%rip), %ecx    # 0xaf9e04
  69266b: 84 c9                        	testb	%cl, %cl
  69266d: 0f 84 e3 fe ff ff            	je	0x692556 <PyInit__native+0x415e56>
  692673: 48 8d 0d 86 77 46 00         	leaq	0x467786(%rip), %rcx    # 0xaf9e00
  69267a: 48 89 0c 24                  	movq	%rcx, (%rsp)
  69267e: 88 44 24 08                  	movb	%al, 0x8(%rsp)
  692682: 48 8d 3d 19 52 aa ff         	leaq	-0x55ade7(%rip), %rdi   # 0x1378a2 ; rodata: "called `Result::unwrap()` on an `Err` value]<standaloneyes', 'no--version1.[>unexpected end of streaminvalid name tokenexpected , invalid referenceinvalid ExternalID'--' is not all"
  692689: 48 8d 0d 48 65 44 00         	leaq	0x446548(%rip), %rcx    # 0xad8bd8 ; ELF relocation: local pointer 0x5544b0
  692690: 4c 8d 05 39 67 44 00         	leaq	0x446739(%rip), %r8     # 0xad8dd0 ; ELF relocation: local pointer 0xc335c
  692697: 48 89 e2                     	movq	%rsp, %rdx
  69269a: be 2b 00 00 00               	movl	$0x2b, %esi
  69269f: e8 7c 49 ee ff               	callq	0x577020 <PyInit__native+0x2fa920>
  6926a4: 0f 0b                        	ud2
  6926a6: 48 8d 35 53 77 46 00         	leaq	0x467753(%rip), %rsi    # 0xaf9e00
  6926ad: bf ca 00 00 00               	movl	$0xca, %edi
  6926b2: ba 81 00 00 00               	movl	$0x81, %edx
  6926b7: b9 01 00 00 00               	movl	$0x1, %ecx
  6926bc: 31 c0                        	xorl	%eax, %eax
  6926be: ff 15 3c 52 46 00            	callq	*0x46523c(%rip)         # 0xaf7900 ; ELF relocation: syscall
  6926c4: e9 fb fe ff ff               	jmp	0x6925c4 <PyInit__native+0x415ec4>
  6926c9: 48 8d 35 30 77 46 00         	leaq	0x467730(%rip), %rsi    # 0xaf9e00
  6926d0: bf ca 00 00 00               	movl	$0xca, %edi
  6926d5: ba 81 00 00 00               	movl	$0x81, %edx
  6926da: b9 01 00 00 00               	movl	$0x1, %ecx
  6926df: 31 c0                        	xorl	%eax, %eax
  6926e1: 48 83 c4 10                  	addq	$0x10, %rsp
  6926e5: 5b                           	popq	%rbx
  6926e6: 41 5c                        	popq	%r12
  6926e8: 41 5d                        	popq	%r13
  6926ea: 41 5e                        	popq	%r14
  6926ec: 41 5f                        	popq	%r15
  6926ee: ff 25 0c 52 46 00            	jmpq	*0x46520c(%rip)         # 0xaf7900 ; ELF relocation: syscall
  6926f4: e8 e7 7c 17 00               	callq	0x80a3e0 <PyInit_pyo3_async_runtimes+0x16ab50>
  6926f9: 84 c0                        	testb	%al, %al
  6926fb: 0f 85 b2 fe ff ff            	jne	0x6925b3 <PyInit__native+0x415eb3>
  692701: c6 05 fc 76 46 00 01         	movb	$0x1, 0x4676fc(%rip)    # 0xaf9e04
  692708: e9 a6 fe ff ff               	jmp	0x6925b3 <PyInit__native+0x415eb3>
  69270d: e8 ce 7c 17 00               	callq	0x80a3e0 <PyInit_pyo3_async_runtimes+0x16ab50>
  692712: 84 c0                        	testb	%al, %al
  692714: 0f 85 05 ff ff ff            	jne	0x69261f <PyInit__native+0x415f1f>
  69271a: c6 05 e3 76 46 00 01         	movb	$0x1, 0x4676e3(%rip)    # 0xaf9e04
  692721: e9 f9 fe ff ff               	jmp	0x69261f <PyInit__native+0x415f1f>
  692726: 48 89 c3                     	movq	%rax, %rbx
  692729: 48 89 e7                     	movq	%rsp, %rdi
  69272c: e8 7f 1d ec ff               	callq	0x5544b0 <PyInit__native+0x2d7db0>
  692731: 48 89 df                     	movq	%rbx, %rdi
  692734: e8 97 b6 42 00               	callq	0xabddd0 <_Unwind_Resume@plt>
