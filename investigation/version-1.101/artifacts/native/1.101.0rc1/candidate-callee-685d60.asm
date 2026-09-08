
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  685d60: 53                           	pushq	%rbx
  685d61: 48 89 fb                     	movq	%rdi, %rbx
  685d64: bf 10 00 00 00               	movl	$0x10, %edi
  685d69: ff 15 f1 e7 46 00            	callq	*0x46e7f1(%rip)         # 0xaf4560 ; ELF relocation: malloc
  685d6f: 48 85 c0                     	testq	%rax, %rax
  685d72: 74 40                        	je	0x685db4 <PyInit__native+0x407274>
  685d74: 48 8d 0d 05 51 a9 ff         	leaq	-0x56aefb(%rip), %rcx   # 0x11ae80 ; rodata: 'attempted to fetch exception but none was setPyObject pointer is null<unprintable object>PyBaseObject_Type should have tp_free__all__base type without tp_new__qualname__could not a'
  685d7b: 48 89 08                     	movq	%rcx, (%rax)
  685d7e: 48 c7 40 08 2d 00 00 00      	movq	$0x2d, 0x8(%rax)
  685d86: 0f 57 c0                     	xorps	%xmm0, %xmm0
  685d89: 0f 11 03                     	movups	%xmm0, (%rbx)
  685d8c: 48 c7 43 10 01 00 00 00      	movq	$0x1, 0x10(%rbx)
  685d94: 48 c7 43 18 00 00 00 00      	movq	$0x0, 0x18(%rbx)
  685d9c: 48 89 43 20                  	movq	%rax, 0x20(%rbx)
  685da0: 48 8d 05 31 fd 44 00         	leaq	0x44fd31(%rip), %rax    # 0xad5ad8
  685da7: 48 89 43 28                  	movq	%rax, 0x28(%rbx)
  685dab: c7 43 38 03 00 00 00         	movl	$0x3, 0x38(%rbx)
  685db2: 5b                           	popq	%rbx
  685db3: c3                           	retq
  685db4: bf 08 00 00 00               	movl	$0x8, %edi
  685db9: be 10 00 00 00               	movl	$0x10, %esi
  685dbe: e8 cf 09 cf ff               	callq	0x376792 <PyInit__native+0xf7c52>
