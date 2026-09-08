
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  686090: 53                           	pushq	%rbx
  686091: 48 83 ec 50                  	subq	$0x50, %rsp
  686095: 48 89 fb                     	movq	%rdi, %rbx
  686098: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  68609d: e8 7e fa ff ff               	callq	0x685b20 <PyInit__native+0x406fe0>
  6860a2: 83 7c 24 08 01               	cmpl	$0x1, 0x8(%rsp)
  6860a7: 75 12                        	jne	0x6860bb <PyInit__native+0x40757b>
  6860a9: 48 8d 7c 24 10               	leaq	0x10(%rsp), %rdi
  6860ae: e8 1d 00 00 00               	callq	0x6860d0 <PyInit__native+0x407590>
  6860b3: 31 ff                        	xorl	%edi, %edi
  6860b5: ff 15 15 e5 46 00            	callq	*0x46e515(%rip)         # 0xaf45d0 ; ELF relocation: PyErr_WriteUnraisable
  6860bb: 48 8d 3d eb 4d a9 ff         	leaq	-0x56b215(%rip), %rdi   # 0x11aead ; rodata: 'PyObject pointer is null<unprintable object>PyBaseObject_Type should have tp_free__all__base type without tp_new__qualname__could not append __name__ to __all__io<failed to extract'
  6860c2: be 31 00 00 00               	movl	$0x31, %esi
  6860c7: 48 89 da                     	movq	%rbx, %rdx
  6860ca: e8 c1 a9 f0 ff               	callq	0x590a90 <PyInit__native+0x311f50>
