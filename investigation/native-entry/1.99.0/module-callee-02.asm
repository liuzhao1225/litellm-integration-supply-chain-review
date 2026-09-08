
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  697080: 41 57                        	pushq	%r15
  697082: 41 56                        	pushq	%r14
  697084: 41 55                        	pushq	%r13
  697086: 41 54                        	pushq	%r12
  697088: 53                           	pushq	%rbx
  697089: 48 81 ec 90 00 00 00         	subq	$0x90, %rsp
  697090: 49 89 d4                     	movq	%rdx, %r12
  697093: 49 89 f7                     	movq	%rsi, %r15
  697096: 48 89 fb                     	movq	%rdi, %rbx
  697099: 48 89 f7                     	movq	%rsi, %rdi
  69709c: ff 15 86 84 45 00            	callq	*0x458486(%rip)         # 0xaef528 ; ELF relocation: PyModule_GetNameObject
  6970a2: 48 85 c0                     	testq	%rax, %rax
  6970a5: 0f 84 a9 00 00 00            	je	0x697154 <PyInit__native+0x41c654>
  6970ab: 49 89 c6                     	movq	%rax, %r14
  6970ae: 45 31 ed                     	xorl	%r13d, %r13d
  6970b1: 4c 89 e7                     	movq	%r12, %rdi
  6970b4: 4c 89 fe                     	movq	%r15, %rsi
  6970b7: 48 89 c2                     	movq	%rax, %rdx
  6970ba: 31 c9                        	xorl	%ecx, %ecx
  6970bc: ff 15 6e 84 45 00            	callq	*0x45846e(%rip)         # 0xaef530 ; ELF relocation: PyCMethod_New
  6970c2: 48 85 c0                     	testq	%rax, %rax
  6970c5: 75 6d                        	jne	0x697134 <PyInit__native+0x41c634>
  6970c7: 48 8d 7c 24 48               	leaq	0x48(%rsp), %rdi
  6970cc: e8 9f 41 ff ff               	callq	0x68b270 <PyInit__native+0x410770>
  6970d1: 83 7c 24 48 01               	cmpl	$0x1, 0x48(%rsp)
  6970d6: 0f 85 01 01 00 00            	jne	0x6971dd <PyInit__native+0x41c6dd>
  6970dc: 0f 10 44 24 50               	movups	0x50(%rsp), %xmm0
  6970e1: 0f 10 4c 24 60               	movups	0x60(%rsp), %xmm1
  6970e6: 0f 10 54 24 70               	movups	0x70(%rsp), %xmm2
  6970eb: 0f 10 9c 24 80 00 00 00      	movups	0x80(%rsp), %xmm3
  6970f3: 0f 29 5c 24 30               	movaps	%xmm3, 0x30(%rsp)
  6970f8: 0f 29 54 24 20               	movaps	%xmm2, 0x20(%rsp)
  6970fd: 0f 29 4c 24 10               	movaps	%xmm1, 0x10(%rsp)
  697102: 0f 29 04 24                  	movaps	%xmm0, (%rsp)
  697106: 48 8b 04 24                  	movq	(%rsp), %rax
  69710a: 48 8b 4c 24 38               	movq	0x38(%rsp), %rcx
  69710f: 48 89 4b 40                  	movq	%rcx, 0x40(%rbx)
  697113: 0f 10 44 24 28               	movups	0x28(%rsp), %xmm0
  697118: 0f 11 43 30                  	movups	%xmm0, 0x30(%rbx)
  69711c: 0f 10 44 24 18               	movups	0x18(%rsp), %xmm0
  697121: 0f 11 43 20                  	movups	%xmm0, 0x20(%rbx)
  697125: 0f 10 44 24 08               	movups	0x8(%rsp), %xmm0
  69712a: 0f 11 43 10                  	movups	%xmm0, 0x10(%rbx)
  69712e: 41 bd 01 00 00 00            	movl	$0x1, %r13d
  697134: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  697138: 4c 89 2b                     	movq	%r13, (%rbx)
  69713b: 4c 89 f7                     	movq	%r14, %rdi
  69713e: 48 81 c4 90 00 00 00         	addq	$0x90, %rsp
  697145: 5b                           	popq	%rbx
  697146: 41 5c                        	popq	%r12
  697148: 41 5d                        	popq	%r13
  69714a: 41 5e                        	popq	%r14
  69714c: 41 5f                        	popq	%r15
  69714e: ff 25 54 7e 45 00            	jmpq	*0x457e54(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  697154: 48 8d 7c 24 48               	leaq	0x48(%rsp), %rdi
  697159: e8 12 41 ff ff               	callq	0x68b270 <PyInit__native+0x410770>
  69715e: 83 7c 24 48 01               	cmpl	$0x1, 0x48(%rsp)
  697163: 75 6e                        	jne	0x6971d3 <PyInit__native+0x41c6d3>
  697165: 0f 10 44 24 50               	movups	0x50(%rsp), %xmm0
  69716a: 0f 10 4c 24 60               	movups	0x60(%rsp), %xmm1
  69716f: 0f 10 54 24 70               	movups	0x70(%rsp), %xmm2
  697174: 0f 10 9c 24 80 00 00 00      	movups	0x80(%rsp), %xmm3
  69717c: 0f 29 5c 24 30               	movaps	%xmm3, 0x30(%rsp)
  697181: 0f 29 54 24 20               	movaps	%xmm2, 0x20(%rsp)
  697186: 0f 29 4c 24 10               	movaps	%xmm1, 0x10(%rsp)
  69718b: 0f 29 04 24                  	movaps	%xmm0, (%rsp)
  69718f: 48 8b 04 24                  	movq	(%rsp), %rax
  697193: 48 8b 4c 24 38               	movq	0x38(%rsp), %rcx
  697198: 48 89 4b 40                  	movq	%rcx, 0x40(%rbx)
  69719c: 0f 10 44 24 28               	movups	0x28(%rsp), %xmm0
  6971a1: 0f 11 43 30                  	movups	%xmm0, 0x30(%rbx)
  6971a5: 0f 10 44 24 18               	movups	0x18(%rsp), %xmm0
  6971aa: 0f 11 43 20                  	movups	%xmm0, 0x20(%rbx)
  6971ae: 0f 10 44 24 08               	movups	0x8(%rsp), %xmm0
  6971b3: 0f 11 43 10                  	movups	%xmm0, 0x10(%rbx)
  6971b7: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  6971bb: 48 c7 03 01 00 00 00         	movq	$0x1, (%rbx)
  6971c2: 48 81 c4 90 00 00 00         	addq	$0x90, %rsp
  6971c9: 5b                           	popq	%rbx
  6971ca: 41 5c                        	popq	%r12
  6971cc: 41 5d                        	popq	%r13
  6971ce: 41 5e                        	popq	%r14
  6971d0: 41 5f                        	popq	%r15
  6971d2: c3                           	retq
  6971d3: 48 89 e7                     	movq	%rsp, %rdi
  6971d6: e8 d5 42 ff ff               	callq	0x68b4b0 <PyInit__native+0x4109b0>
  6971db: eb b2                        	jmp	0x69718f <PyInit__native+0x41c68f>
  6971dd: 48 89 e7                     	movq	%rsp, %rdi
  6971e0: e8 cb 42 ff ff               	callq	0x68b4b0 <PyInit__native+0x4109b0>
  6971e5: e9 1c ff ff ff               	jmp	0x697106 <PyInit__native+0x41c606>
  6971ea: 48 89 c3                     	movq	%rax, %rbx
  6971ed: 4c 89 f7                     	movq	%r14, %rdi
  6971f0: ff 15 b2 7d 45 00            	callq	*0x457db2(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  6971f6: 48 89 df                     	movq	%rbx, %rdi
  6971f9: e8 92 e4 41 00               	callq	0xab5690 <_Unwind_Resume@plt>
