
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027ab00 <PyInit__native>:
  68b820: 53                           	pushq	%rbx
  68b821: 48 83 ec 20                  	subq	$0x20, %rsp
  68b825: 48 83 7f 10 01               	cmpq	$0x1, 0x10(%rdi)
  68b82a: 75 52                        	jne	0x68b87e <PyInit__native+0x410d7e>
  68b82c: 48 89 f8                     	movq	%rdi, %rax
  68b82f: 48 8b 7f 18                  	movq	0x18(%rdi), %rdi
  68b833: 48 8b 70 20                  	movq	0x20(%rax), %rsi
  68b837: 48 8b 50 28                  	movq	0x28(%rax), %rdx
  68b83b: 48 85 ff                     	testq	%rdi, %rdi
  68b83e: 74 1a                        	je	0x68b85a <PyInit__native+0x410d5a>
  68b840: 48 8b 40 30                  	movq	0x30(%rax), %rax
  68b844: 48 c1 ea 20                  	shrq	$0x20, %rdx
  68b848: 84 d2                        	testb	%dl, %dl
  68b84a: 75 4a                        	jne	0x68b896 <PyInit__native+0x410d96>
  68b84c: 48 89 c2                     	movq	%rax, %rdx
  68b84f: 48 83 c4 20                  	addq	$0x20, %rsp
  68b853: 5b                           	popq	%rbx
  68b854: ff 25 e6 3b 46 00            	jmpq	*0x463be6(%rip)         # 0xaef440 ; ELF relocation: PyErr_Restore
  68b85a: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  68b85f: e8 bc 00 00 00               	callq	0x68b920 <PyInit__native+0x410e20>
  68b864: 48 8b 7c 24 08               	movq	0x8(%rsp), %rdi
  68b869: 48 8b 74 24 10               	movq	0x10(%rsp), %rsi
  68b86e: 48 8b 54 24 18               	movq	0x18(%rsp), %rdx
  68b873: 48 83 c4 20                  	addq	$0x20, %rsp
  68b877: 5b                           	popq	%rbx
  68b878: ff 25 c2 3b 46 00            	jmpq	*0x463bc2(%rip)         # 0xaef440 ; ELF relocation: PyErr_Restore
  68b87e: 48 8d 3d 03 f8 a8 ff         	leaq	-0x5707fd(%rip), %rdi   # 0x11b088 ; rodata: 'PyErr state should never be invalid outside of normalizationException type missingException value missingargumentswaskeywordpositionalAttaching a thread to the interpreter is curre'
  68b885: 48 8d 15 3c 4d 44 00         	leaq	0x444d3c(%rip), %rdx    # 0xad05c8 ; ELF relocation: local pointer 0xce9a5
  68b88c: be 3c 00 00 00               	movl	$0x3c, %esi
  68b891: e8 1a ee ec ff               	callq	0x55a6b0 <PyInit__native+0x2dfbb0>
  68b896: 48 89 04 24                  	movq	%rax, (%rsp)
  68b89a: 48 8d 3d c1 ab aa ff         	leaq	-0x55543f(%rip), %rdi   # 0x136462 ; rodata: "called `Result::unwrap()` on an `Err` value]<standaloneyes', 'no--version1.[>unexpected end of streaminvalid name tokenexpected , invalid referenceinvalid ExternalID'--' is not all"
  68b8a1: 48 8d 0d d8 4a 44 00         	leaq	0x444ad8(%rip), %rcx    # 0xad0380 ; ELF relocation: local pointer 0x68b8e0
  68b8a8: 4c 8d 05 f1 4d 44 00         	leaq	0x444df1(%rip), %r8     # 0xad06a0 ; ELF relocation: local pointer 0xce9a5
  68b8af: 48 89 e2                     	movq	%rsp, %rdx
  68b8b2: be 2b 00 00 00               	movl	$0x2b, %esi
  68b8b7: e8 34 ee ec ff               	callq	0x55a6f0 <PyInit__native+0x2dfbf0>
  68b8bc: 0f 0b                        	ud2
  68b8be: 48 89 c3                     	movq	%rax, %rbx
  68b8c1: 48 89 e7                     	movq	%rsp, %rdi
  68b8c4: e8 17 00 00 00               	callq	0x68b8e0 <PyInit__native+0x410de0>
  68b8c9: 48 89 df                     	movq	%rbx, %rdi
  68b8cc: e8 bf 9d 42 00               	callq	0xab5690 <_Unwind_Resume@plt>
  68b8d1: e8 d6 ee ec ff               	callq	0x55a7ac <PyInit__native+0x2dfcac>
