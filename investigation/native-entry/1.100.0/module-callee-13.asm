
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  693030: 41 57                        	pushq	%r15
  693032: 41 56                        	pushq	%r14
  693034: 53                           	pushq	%rbx
  693035: 4c 8b 3f                     	movq	(%rdi), %r15
  693038: 48 8b 5f 08                  	movq	0x8(%rdi), %rbx
  69303c: 48 8d 3d 05 48 46 00         	leaq	0x464805(%rip), %rdi    # 0xaf7848 ; ELF relocation: local pointer 0x0
  693043: e8 b8 ad 42 00               	callq	0xabde00 <__tls_get_addr@plt>
  693048: 49 89 c6                     	movq	%rax, %r14
  69304b: 48 83 b8 d8 00 00 00 00      	cmpq	$0x0, 0xd8(%rax)
  693053: 7e 24                        	jle	0x693079 <PyInit__native+0x416979>
  693055: 4c 89 ff                     	movq	%r15, %rdi
  693058: ff 15 4a 48 46 00            	callq	*0x46484a(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  69305e: 49 8d 86 d8 00 00 00         	leaq	0xd8(%r14), %rax
  693065: 48 83 38 00                  	cmpq	$0x0, (%rax)
  693069: 7e 18                        	jle	0x693083 <PyInit__native+0x416983>
  69306b: 48 89 df                     	movq	%rbx, %rdi
  69306e: 5b                           	popq	%rbx
  69306f: 41 5e                        	popq	%r14
  693071: 41 5f                        	popq	%r15
  693073: ff 25 2f 48 46 00            	jmpq	*0x46482f(%rip)         # 0xaf78a8 ; ELF relocation: _Py_DecRef
  693079: 4c 89 ff                     	movq	%r15, %rdi
  69307c: e8 0f ea ff ff               	callq	0x691a90 <PyInit__native+0x415390>
  693081: eb db                        	jmp	0x69305e <PyInit__native+0x41695e>
  693083: 48 89 df                     	movq	%rbx, %rdi
  693086: 5b                           	popq	%rbx
  693087: 41 5e                        	popq	%r14
  693089: 41 5f                        	popq	%r15
  69308b: e9 00 ea ff ff               	jmp	0x691a90 <PyInit__native+0x415390>
  693090: 49 89 c6                     	movq	%rax, %r14
  693093: 48 89 df                     	movq	%rbx, %rdi
  693096: e8 a5 eb ff ff               	callq	0x691c40 <PyInit__native+0x415540>
  69309b: 4c 89 f7                     	movq	%r14, %rdi
  69309e: e8 2d ad 42 00               	callq	0xabddd0 <_Unwind_Resume@plt>
  6930a3: e8 34 40 ee ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
