
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  686de0: 41 57                        	pushq	%r15
  686de2: 41 56                        	pushq	%r14
  686de4: 41 55                        	pushq	%r13
  686de6: 41 54                        	pushq	%r12
  686de8: 53                           	pushq	%rbx
  686de9: 48 83 ec 10                  	subq	$0x10, %rsp
  686ded: b9 01 00 00 00               	movl	$0x1, %ecx
  686df2: 31 c0                        	xorl	%eax, %eax
  686df4: f0                           	lock
  686df5: 0f b1 0d f4 fc 46 00         	cmpxchgl	%ecx, 0x46fcf4(%rip)    # 0xaf6af0
  686dfc: 0f 85 0c 01 00 00            	jne	0x686f0e <PyInit__native+0x4083ce>
  686e02: 48 8b 05 b7 0d 47 00         	movq	0x470db7(%rip), %rax    # 0xaf7bc0
  686e09: 48 d1 e0                     	shlq	%rax
  686e0c: 48 85 c0                     	testq	%rax, %rax
  686e0f: 0f 85 18 01 00 00            	jne	0x686f2d <PyInit__native+0x4083ed>
  686e15: 31 c0                        	xorl	%eax, %eax
  686e17: 0f b6 0d d6 fc 46 00         	movzbl	0x46fcd6(%rip), %ecx    # 0xaf6af4
  686e1e: 84 c9                        	testb	%cl, %cl
  686e20: 0f 85 1d 01 00 00            	jne	0x686f43 <PyInit__native+0x408403>
  686e26: 48 b9 ff ff ff ff ff ff ff 7f	movabsq	$0x7fffffffffffffff, %rcx # imm = 0x7FFFFFFFFFFFFFFF
  686e30: 4c 8b 35 d1 fc 46 00         	movq	0x46fcd1(%rip), %r14    # 0xaf6b08
  686e37: 4d 85 f6                     	testq	%r14, %r14
  686e3a: 0f 84 9b 00 00 00            	je	0x686edb <PyInit__native+0x40839b>
  686e40: 4c 8b 3d b1 fc 46 00         	movq	0x46fcb1(%rip), %r15    # 0xaf6af8
  686e47: 48 8b 1d b2 fc 46 00         	movq	0x46fcb2(%rip), %rbx    # 0xaf6b00
  686e4e: 48 c7 05 9f fc 46 00 00 00 00 00     	movq	$0x0, 0x46fc9f(%rip) # 0xaf6af8
  686e59: 48 c7 05 9c fc 46 00 08 00 00 00     	movq	$0x8, 0x46fc9c(%rip) # 0xaf6b00
  686e64: 48 c7 05 99 fc 46 00 00 00 00 00     	movq	$0x0, 0x46fc99(%rip) # 0xaf6b08
  686e6f: 84 c0                        	testb	%al, %al
  686e71: 75 10                        	jne	0x686e83 <PyInit__native+0x408343>
  686e73: 48 8b 05 46 0d 47 00         	movq	0x470d46(%rip), %rax    # 0xaf7bc0
  686e7a: 48 85 c8                     	testq	%rcx, %rax
  686e7d: 0f 85 41 01 00 00            	jne	0x686fc4 <PyInit__native+0x408484>
  686e83: 31 c0                        	xorl	%eax, %eax
  686e85: 87 05 65 fc 46 00            	xchgl	%eax, 0x46fc65(%rip)    # 0xaf6af0
  686e8b: 83 f8 02                     	cmpl	$0x2, %eax
  686e8e: 0f 84 e2 00 00 00            	je	0x686f76 <PyInit__native+0x408436>
  686e94: 49 c1 e6 03                  	shlq	$0x3, %r14
  686e98: 45 31 e4                     	xorl	%r12d, %r12d
  686e9b: 4c 8b 2d de d6 46 00         	movq	0x46d6de(%rip), %r13    # 0xaf4580 ; ELF relocation: _Py_DecRef
  686ea2: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
  686eb0: 4a 8b 3c 23                  	movq	(%rbx,%r12), %rdi
  686eb4: 41 ff d5                     	callq	*%r13
  686eb7: 49 83 c4 08                  	addq	$0x8, %r12
  686ebb: 4d 39 e6                     	cmpq	%r12, %r14
  686ebe: 75 f0                        	jne	0x686eb0 <PyInit__native+0x408370>
  686ec0: 4d 85 ff                     	testq	%r15, %r15
  686ec3: 74 3b                        	je	0x686f00 <PyInit__native+0x4083c0>
  686ec5: 48 89 df                     	movq	%rbx, %rdi
  686ec8: 48 83 c4 10                  	addq	$0x10, %rsp
  686ecc: 5b                           	popq	%rbx
  686ecd: 41 5c                        	popq	%r12
  686ecf: 41 5d                        	popq	%r13
  686ed1: 41 5e                        	popq	%r14
  686ed3: 41 5f                        	popq	%r15
  686ed5: ff 25 95 d6 46 00            	jmpq	*0x46d695(%rip)         # 0xaf4570 ; ELF relocation: free
  686edb: 84 c0                        	testb	%al, %al
  686edd: 75 10                        	jne	0x686eef <PyInit__native+0x4083af>
  686edf: 48 8b 05 da 0c 47 00         	movq	0x470cda(%rip), %rax    # 0xaf7bc0
  686ee6: 48 85 c8                     	testq	%rcx, %rax
  686ee9: 0f 85 ee 00 00 00            	jne	0x686fdd <PyInit__native+0x40849d>
  686eef: 31 c0                        	xorl	%eax, %eax
  686ef1: 87 05 f9 fb 46 00            	xchgl	%eax, 0x46fbf9(%rip)    # 0xaf6af0
  686ef7: 83 f8 02                     	cmpl	$0x2, %eax
  686efa: 0f 84 99 00 00 00            	je	0x686f99 <PyInit__native+0x408459>
  686f00: 48 83 c4 10                  	addq	$0x10, %rsp
  686f04: 5b                           	popq	%rbx
  686f05: 41 5c                        	popq	%r12
  686f07: 41 5d                        	popq	%r13
  686f09: 41 5e                        	popq	%r14
  686f0b: 41 5f                        	popq	%r15
  686f0d: c3                           	retq
  686f0e: 48 8d 3d db fb 46 00         	leaq	0x46fbdb(%rip), %rdi    # 0xaf6af0
  686f15: e8 56 05 18 00               	callq	0x807470 <PyInit_pyo3_async_runtimes+0x1731f0>
  686f1a: 48 8b 05 9f 0c 47 00         	movq	0x470c9f(%rip), %rax    # 0xaf7bc0
  686f21: 48 d1 e0                     	shlq	%rax
  686f24: 48 85 c0                     	testq	%rax, %rax
  686f27: 0f 84 e8 fe ff ff            	je	0x686e15 <PyInit__native+0x4082d5>
  686f2d: e8 4e 03 18 00               	callq	0x807280 <PyInit_pyo3_async_runtimes+0x173000>
  686f32: 34 01                        	xorb	$0x1, %al
  686f34: 0f b6 0d b9 fb 46 00         	movzbl	0x46fbb9(%rip), %ecx    # 0xaf6af4
  686f3b: 84 c9                        	testb	%cl, %cl
  686f3d: 0f 84 e3 fe ff ff            	je	0x686e26 <PyInit__native+0x4082e6>
  686f43: 48 8d 0d a6 fb 46 00         	leaq	0x46fba6(%rip), %rcx    # 0xaf6af0
  686f4a: 48 89 0c 24                  	movq	%rcx, (%rsp)
  686f4e: 88 44 24 08                  	movb	%al, 0x8(%rsp)
  686f52: 48 8d 3d 49 01 ab ff         	leaq	-0x54feb7(%rip), %rdi   # 0x1370a2 ; rodata: "called `Result::unwrap()` on an `Err` value]<standaloneyes', 'no--version1.[>unexpected end of streaminvalid name tokenexpected , invalid referenceinvalid ExternalID'--' is not all"
  686f59: 48 8d 0d 20 e8 44 00         	leaq	0x44e820(%rip), %rcx    # 0xad5780 ; ELF relocation: local pointer 0x688e00
  686f60: 4c 8d 05 11 ea 44 00         	leaq	0x44ea11(%rip), %r8     # 0xad5978 ; ELF relocation: local pointer 0xd45ef
  686f67: 48 89 e2                     	movq	%rsp, %rdx
  686f6a: be 2b 00 00 00               	movl	$0x2b, %esi
  686f6f: e8 dc ed f0 ff               	callq	0x595d50 <PyInit__native+0x317210>
  686f74: 0f 0b                        	ud2
  686f76: 48 8d 35 73 fb 46 00         	leaq	0x46fb73(%rip), %rsi    # 0xaf6af0
  686f7d: bf ca 00 00 00               	movl	$0xca, %edi
  686f82: ba 81 00 00 00               	movl	$0x81, %edx
  686f87: b9 01 00 00 00               	movl	$0x1, %ecx
  686f8c: 31 c0                        	xorl	%eax, %eax
  686f8e: ff 15 54 d6 46 00            	callq	*0x46d654(%rip)         # 0xaf45e8 ; ELF relocation: syscall
  686f94: e9 fb fe ff ff               	jmp	0x686e94 <PyInit__native+0x408354>
  686f99: 48 8d 35 50 fb 46 00         	leaq	0x46fb50(%rip), %rsi    # 0xaf6af0
  686fa0: bf ca 00 00 00               	movl	$0xca, %edi
  686fa5: ba 81 00 00 00               	movl	$0x81, %edx
  686faa: b9 01 00 00 00               	movl	$0x1, %ecx
  686faf: 31 c0                        	xorl	%eax, %eax
  686fb1: 48 83 c4 10                  	addq	$0x10, %rsp
  686fb5: 5b                           	popq	%rbx
  686fb6: 41 5c                        	popq	%r12
  686fb8: 41 5d                        	popq	%r13
  686fba: 41 5e                        	popq	%r14
  686fbc: 41 5f                        	popq	%r15
  686fbe: ff 25 24 d6 46 00            	jmpq	*0x46d624(%rip)         # 0xaf45e8 ; ELF relocation: syscall
  686fc4: e8 b7 02 18 00               	callq	0x807280 <PyInit_pyo3_async_runtimes+0x173000>
  686fc9: 84 c0                        	testb	%al, %al
  686fcb: 0f 85 b2 fe ff ff            	jne	0x686e83 <PyInit__native+0x408343>
  686fd1: c6 05 1c fb 46 00 01         	movb	$0x1, 0x46fb1c(%rip)    # 0xaf6af4
  686fd8: e9 a6 fe ff ff               	jmp	0x686e83 <PyInit__native+0x408343>
  686fdd: e8 9e 02 18 00               	callq	0x807280 <PyInit_pyo3_async_runtimes+0x173000>
  686fe2: 84 c0                        	testb	%al, %al
  686fe4: 0f 85 05 ff ff ff            	jne	0x686eef <PyInit__native+0x4083af>
  686fea: c6 05 03 fb 46 00 01         	movb	$0x1, 0x46fb03(%rip)    # 0xaf6af4
  686ff1: e9 f9 fe ff ff               	jmp	0x686eef <PyInit__native+0x4083af>
  686ff6: 48 89 c3                     	movq	%rax, %rbx
  686ff9: 48 89 e7                     	movq	%rsp, %rdi
  686ffc: e8 ff 1d 00 00               	callq	0x688e00 <PyInit__native+0x40a2c0>
  687001: 48 89 df                     	movq	%rbx, %rdi
  687004: e8 c7 41 43 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
