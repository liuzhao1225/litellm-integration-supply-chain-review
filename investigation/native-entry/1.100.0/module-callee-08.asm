
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  691490: 53                           	pushq	%rbx
  691491: 48 89 fb                     	movq	%rdi, %rbx
  691494: bf 10 00 00 00               	movl	$0x10, %edi
  691499: ff 15 e1 63 46 00            	callq	*0x4663e1(%rip)         # 0xaf7880 ; ELF relocation: malloc
  69149f: 48 85 c0                     	testq	%rax, %rax
  6914a2: 74 40                        	je	0x6914e4 <PyInit__native+0x414de4>
  6914a4: 48 8d 0d b5 b0 a8 ff         	leaq	-0x574f4b(%rip), %rcx   # 0x11c560 ; rodata: 'attempted to fetch exception but none was setPyObject pointer is null<unprintable object>PyBaseObject_Type should have tp_free__all__base type without tp_new__qualname__could not a'
  6914ab: 48 89 08                     	movq	%rcx, (%rax)
  6914ae: 48 c7 40 08 2d 00 00 00      	movq	$0x2d, 0x8(%rax)
  6914b6: 0f 57 c0                     	xorps	%xmm0, %xmm0
  6914b9: 0f 11 03                     	movups	%xmm0, (%rbx)
  6914bc: 48 c7 43 10 01 00 00 00      	movq	$0x1, 0x10(%rbx)
  6914c4: 48 c7 43 18 00 00 00 00      	movq	$0x0, 0x18(%rbx)
  6914cc: 48 89 43 20                  	movq	%rax, 0x20(%rbx)
  6914d0: 48 8d 05 59 7a 44 00         	leaq	0x447a59(%rip), %rax    # 0xad8f30
  6914d7: 48 89 43 28                  	movq	%rax, 0x28(%rbx)
  6914db: c7 43 38 03 00 00 00         	movl	$0x3, 0x38(%rbx)
  6914e2: 5b                           	popq	%rbx
  6914e3: c3                           	retq
  6914e4: bf 08 00 00 00               	movl	$0x8, %edi
  6914e9: be 10 00 00 00               	movl	$0x10, %esi
  6914ee: e8 7f 4c cc ff               	callq	0x356172 <PyInit__native+0xd9a72>
