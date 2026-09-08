
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  68d050: 41 57                        	pushq	%r15
  68d052: 41 56                        	pushq	%r14
  68d054: 53                           	pushq	%rbx
  68d055: 4c 8b 3f                     	movq	(%rdi), %r15
  68d058: 48 8b 5f 08                  	movq	0x8(%rdi), %rbx
  68d05c: 48 8d 3d c5 1e 46 00         	leaq	0x461ec5(%rip), %rdi    # 0xaeef28 ; ELF relocation: local pointer 0x0
  68d063: e8 58 86 42 00               	callq	0xab56c0 <__tls_get_addr@plt>
  68d068: 49 89 c6                     	movq	%rax, %r14
  68d06b: 48 83 b8 d8 00 00 00 00      	cmpq	$0x0, 0xd8(%rax)
  68d073: 7e 24                        	jle	0x68d099 <PyInit__native+0x412599>
  68d075: 4c 89 ff                     	movq	%r15, %rdi
  68d078: ff 15 2a 1f 46 00            	callq	*0x461f2a(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  68d07e: 49 8d 86 d8 00 00 00         	leaq	0xd8(%r14), %rax
  68d085: 48 83 38 00                  	cmpq	$0x0, (%rax)
  68d089: 7e 18                        	jle	0x68d0a3 <PyInit__native+0x4125a3>
  68d08b: 48 89 df                     	movq	%rbx, %rdi
  68d08e: 5b                           	popq	%rbx
  68d08f: 41 5e                        	popq	%r14
  68d091: 41 5f                        	popq	%r15
  68d093: ff 25 0f 1f 46 00            	jmpq	*0x461f0f(%rip)         # 0xaeefa8 ; ELF relocation: _Py_DecRef
  68d099: 4c 89 ff                     	movq	%r15, %rdi
  68d09c: e8 0f ea ff ff               	callq	0x68bab0 <PyInit__native+0x410fb0>
  68d0a1: eb db                        	jmp	0x68d07e <PyInit__native+0x41257e>
  68d0a3: 48 89 df                     	movq	%rbx, %rdi
  68d0a6: 5b                           	popq	%rbx
  68d0a7: 41 5e                        	popq	%r14
  68d0a9: 41 5f                        	popq	%r15
  68d0ab: e9 00 ea ff ff               	jmp	0x68bab0 <PyInit__native+0x410fb0>
  68d0b0: 49 89 c6                     	movq	%rax, %r14
  68d0b3: 48 89 df                     	movq	%rbx, %rdi
  68d0b6: e8 a5 eb ff ff               	callq	0x68bc60 <PyInit__native+0x411160>
  68d0bb: 4c 89 f7                     	movq	%r14, %rdi
  68d0be: e8 cd 85 42 00               	callq	0xab5690 <_Unwind_Resume@plt>
  68d0c3: e8 e4 d6 ec ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
