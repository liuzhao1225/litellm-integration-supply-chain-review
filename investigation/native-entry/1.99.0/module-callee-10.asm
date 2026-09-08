
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  2aff10: 41 57                        	pushq	%r15
  2aff12: 41 56                        	pushq	%r14
  2aff14: 41 54                        	pushq	%r12
  2aff16: 53                           	pushq	%rbx
  2aff17: 48 83 ec 48                  	subq	$0x48, %rsp
  2aff1b: 49 89 f6                     	movq	%rsi, %r14
  2aff1e: 48 89 fb                     	movq	%rdi, %rbx
  2aff21: 8b 05 b9 11 84 00            	movl	0x8411b9(%rip), %eax    # 0xaf10e0
  2aff27: 85 c0                        	testl	%eax, %eax
  2aff29: 75 49                        	jne	0x2aff74 <PyInit__native+0x35474>
  2aff2b: 48 8d 05 a6 11 84 00         	leaq	0x8411a6(%rip), %rax    # 0xaf10d8
  2aff32: 4c 8b 20                     	movq	(%rax), %r12
  2aff35: 48 8d 3d bb 83 e2 ff         	leaq	-0x1d7c45(%rip), %rdi   # 0xd82f7 ; rodata: 'ResponsesWebSocketConnectioncached_tokenscache_creation_tokenstext_tokensprompt_tokenscompletion_tokenstotal_tokensprompt_tokens_detailsfinish_reasoncreatedfailed to park threadFai'
  2aff3c: be 1c 00 00 00               	movl	$0x1c, %esi
  2aff41: ff 15 b1 f0 83 00            	callq	*0x83f0b1(%rip)         # 0xaeeff8 ; ELF relocation: PyUnicode_FromStringAndSize
  2aff47: 48 85 c0                     	testq	%rax, %rax
  2aff4a: 74 76                        	je	0x2affc2 <PyInit__native+0x354c2>
  2aff4c: 49 89 c7                     	movq	%rax, %r15
  2aff4f: 48 89 df                     	movq	%rbx, %rdi
  2aff52: 4c 89 f6                     	movq	%r14, %rsi
  2aff55: 48 89 c2                     	movq	%rax, %rdx
  2aff58: 4c 89 e1                     	movq	%r12, %rcx
  2aff5b: e8 b0 6a 3e 00               	callq	0x696a10 <PyInit__native+0x41bf10>
  2aff60: 4c 89 ff                     	movq	%r15, %rdi
  2aff63: 48 83 c4 48                  	addq	$0x48, %rsp
  2aff67: 5b                           	popq	%rbx
  2aff68: 41 5c                        	popq	%r12
  2aff6a: 41 5e                        	popq	%r14
  2aff6c: 41 5f                        	popq	%r15
  2aff6e: ff 25 34 f0 83 00            	jmpq	*0x83f034(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  2aff74: 48 89 e7                     	movq	%rsp, %rdi
  2aff77: e8 44 56 07 00               	callq	0x3255c0 <PyInit__native+0xaaac0>
  2aff7c: 48 8b 44 24 08               	movq	0x8(%rsp), %rax
  2aff81: 83 3c 24 01                  	cmpl	$0x1, (%rsp)
  2aff85: 75 ab                        	jne	0x2aff32 <PyInit__native+0x35432>
  2aff87: 48 8b 4c 24 40               	movq	0x40(%rsp), %rcx
  2aff8c: 48 89 4b 40                  	movq	%rcx, 0x40(%rbx)
  2aff90: 0f 10 44 24 10               	movups	0x10(%rsp), %xmm0
  2aff95: 0f 10 4c 24 20               	movups	0x20(%rsp), %xmm1
  2aff9a: 0f 10 54 24 30               	movups	0x30(%rsp), %xmm2
  2aff9f: 0f 11 53 30                  	movups	%xmm2, 0x30(%rbx)
  2affa3: 0f 11 4b 20                  	movups	%xmm1, 0x20(%rbx)
  2affa7: 0f 11 43 10                  	movups	%xmm0, 0x10(%rbx)
  2affab: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  2affaf: 48 c7 03 01 00 00 00         	movq	$0x1, (%rbx)
  2affb6: 48 83 c4 48                  	addq	$0x48, %rsp
  2affba: 5b                           	popq	%rbx
  2affbb: 41 5c                        	popq	%r12
  2affbd: 41 5e                        	popq	%r14
  2affbf: 41 5f                        	popq	%r15
  2affc1: c3                           	retq
  2affc2: 48 8d 3d 67 0a 82 00         	leaq	0x820a67(%rip), %rdi    # 0xad0a30 ; ELF relocation: local pointer 0xd39ea
  2affc9: e8 12 b8 3d 00               	callq	0x68b7e0 <PyInit__native+0x410ce0>
  2affce: 48 89 c3                     	movq	%rax, %rbx
  2affd1: 4c 89 ff                     	movq	%r15, %rdi
  2affd4: ff 15 ce ef 83 00            	callq	*0x83efce(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  2affda: 48 89 df                     	movq	%rbx, %rdi
  2affdd: e8 ae 56 80 00               	callq	0xab5690 <_Unwind_Resume@plt>
