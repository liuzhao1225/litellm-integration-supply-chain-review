
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  2bf410: 41 57                        	pushq	%r15
  2bf412: 41 56                        	pushq	%r14
  2bf414: 41 54                        	pushq	%r12
  2bf416: 53                           	pushq	%rbx
  2bf417: 48 83 ec 48                  	subq	$0x48, %rsp
  2bf41b: 49 89 f6                     	movq	%rsi, %r14
  2bf41e: 48 89 fb                     	movq	%rdi, %rbx
  2bf421: 8b 05 e9 a6 83 00            	movl	0x83a6e9(%rip), %eax    # 0xaf9b10
  2bf427: 85 c0                        	testl	%eax, %eax
  2bf429: 75 49                        	jne	0x2bf474 <PyInit__native+0x42d74>
  2bf42b: 48 8d 05 d6 a6 83 00         	leaq	0x83a6d6(%rip), %rax    # 0xaf9b08
  2bf432: 4c 8b 20                     	movq	(%rax), %r12
  2bf435: 48 8d 3d da a1 e1 ff         	leaq	-0x1e5e26(%rip), %rdi   # 0xd9616 ; rodata: 'ResponsesWebSocketConnectioncached_tokenscache_creation_tokenstext_tokensprompt_tokenscompletion_tokenstotal_tokensprompt_tokens_detailsfinish_reasoncreatedJSON number out of range'
  2bf43c: be 1c 00 00 00               	movl	$0x1c, %esi
  2bf441: ff 15 f1 84 83 00            	callq	*0x8384f1(%rip)         # 0xaf7938 ; ELF relocation: PyUnicode_FromStringAndSize
  2bf447: 48 85 c0                     	testq	%rax, %rax
  2bf44a: 74 76                        	je	0x2bf4c2 <PyInit__native+0x42dc2>
  2bf44c: 49 89 c7                     	movq	%rax, %r15
  2bf44f: 48 89 df                     	movq	%rbx, %rdi
  2bf452: 4c 89 f6                     	movq	%r14, %rsi
  2bf455: 48 89 c2                     	movq	%rax, %rdx
  2bf458: 4c 89 e1                     	movq	%r12, %rcx
  2bf45b: e8 10 d7 3d 00               	callq	0x69cb70 <PyInit__native+0x420470>
  2bf460: 4c 89 ff                     	movq	%r15, %rdi
  2bf463: 48 83 c4 48                  	addq	$0x48, %rsp
  2bf467: 5b                           	popq	%rbx
  2bf468: 41 5c                        	popq	%r12
  2bf46a: 41 5e                        	popq	%r14
  2bf46c: 41 5f                        	popq	%r15
  2bf46e: ff 25 34 84 83 00            	jmpq	*0x838434(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  2bf474: 48 89 e7                     	movq	%rsp, %rdi
  2bf477: e8 84 85 07 00               	callq	0x337a00 <PyInit__native+0xbb300>
  2bf47c: 48 8b 44 24 08               	movq	0x8(%rsp), %rax
  2bf481: 83 3c 24 01                  	cmpl	$0x1, (%rsp)
  2bf485: 75 ab                        	jne	0x2bf432 <PyInit__native+0x42d32>
  2bf487: 48 8b 4c 24 40               	movq	0x40(%rsp), %rcx
  2bf48c: 48 89 4b 40                  	movq	%rcx, 0x40(%rbx)
  2bf490: 0f 10 44 24 10               	movups	0x10(%rsp), %xmm0
  2bf495: 0f 10 4c 24 20               	movups	0x20(%rsp), %xmm1
  2bf49a: 0f 10 54 24 30               	movups	0x30(%rsp), %xmm2
  2bf49f: 0f 11 53 30                  	movups	%xmm2, 0x30(%rbx)
  2bf4a3: 0f 11 4b 20                  	movups	%xmm1, 0x20(%rbx)
  2bf4a7: 0f 11 43 10                  	movups	%xmm0, 0x10(%rbx)
  2bf4ab: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  2bf4af: 48 c7 03 01 00 00 00         	movq	$0x1, (%rbx)
  2bf4b6: 48 83 c4 48                  	addq	$0x48, %rsp
  2bf4ba: 5b                           	popq	%rbx
  2bf4bb: 41 5c                        	popq	%r12
  2bf4bd: 41 5e                        	popq	%r14
  2bf4bf: 41 5f                        	popq	%r15
  2bf4c1: c3                           	retq
  2bf4c2: 48 8d 3d 3f 9d 81 00         	leaq	0x819d3f(%rip), %rdi    # 0xad9208 ; ELF relocation: local pointer 0xd4bd6
  2bf4c9: e8 f2 22 3d 00               	callq	0x6917c0 <PyInit__native+0x4150c0>
  2bf4ce: 48 89 c3                     	movq	%rax, %rbx
  2bf4d1: 4c 89 ff                     	movq	%r15, %rdi
  2bf4d4: ff 15 ce 83 83 00            	callq	*0x8383ce(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  2bf4da: 48 89 df                     	movq	%rbx, %rdi
  2bf4dd: e8 ee e8 7f 00               	callq	0xabddd0 <_Unwind_Resume@plt>
