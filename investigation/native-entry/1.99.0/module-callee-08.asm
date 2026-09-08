
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  68b4b0: 53                           	pushq	%rbx
  68b4b1: 48 89 fb                     	movq	%rdi, %rbx
  68b4b4: bf 10 00 00 00               	movl	$0x10, %edi
  68b4b9: ff 15 a1 3a 46 00            	callq	*0x463aa1(%rip)         # 0xaeef60 ; ELF relocation: malloc
  68b4bf: 48 85 c0                     	testq	%rax, %rax
  68b4c2: 74 40                        	je	0x68b504 <PyInit__native+0x410a04>
  68b4c4: 48 8d 0d 53 fd a8 ff         	leaq	-0x5702ad(%rip), %rcx   # 0x11b21e ; rodata: 'attempted to fetch exception but none was setPyObject pointer is null<unprintable object>PyBaseObject_Type should have tp_free__all__base type without tp_new__qualname__could not a'
  68b4cb: 48 89 08                     	movq	%rcx, (%rax)
  68b4ce: 48 c7 40 08 2d 00 00 00      	movq	$0x2d, 0x8(%rax)
  68b4d6: 0f 57 c0                     	xorps	%xmm0, %xmm0
  68b4d9: 0f 11 03                     	movups	%xmm0, (%rbx)
  68b4dc: 48 c7 43 10 01 00 00 00      	movq	$0x1, 0x10(%rbx)
  68b4e4: 48 c7 43 18 00 00 00 00      	movq	$0x0, 0x18(%rbx)
  68b4ec: 48 89 43 20                  	movq	%rax, 0x20(%rbx)
  68b4f0: 48 8d 05 61 52 44 00         	leaq	0x445261(%rip), %rax    # 0xad0758
  68b4f7: 48 89 43 28                  	movq	%rax, 0x28(%rbx)
  68b4fb: c7 43 38 03 00 00 00         	movl	$0x3, 0x38(%rbx)
  68b502: 5b                           	popq	%rbx
  68b503: c3                           	retq
  68b504: bf 08 00 00 00               	movl	$0x8, %edi
  68b509: be 10 00 00 00               	movl	$0x10, %esi
  68b50e: e8 2f 04 cb ff               	callq	0x33b942 <PyInit__native+0xc0e42>
