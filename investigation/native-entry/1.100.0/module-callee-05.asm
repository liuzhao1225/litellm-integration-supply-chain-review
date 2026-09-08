
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  691800: 53                           	pushq	%rbx
  691801: 48 83 ec 20                  	subq	$0x20, %rsp
  691805: 48 83 7f 10 01               	cmpq	$0x1, 0x10(%rdi)
  69180a: 75 52                        	jne	0x69185e <PyInit__native+0x41515e>
  69180c: 48 89 f8                     	movq	%rdi, %rax
  69180f: 48 8b 7f 18                  	movq	0x18(%rdi), %rdi
  691813: 48 8b 70 20                  	movq	0x20(%rax), %rsi
  691817: 48 8b 50 28                  	movq	0x28(%rax), %rdx
  69181b: 48 85 ff                     	testq	%rdi, %rdi
  69181e: 74 1a                        	je	0x69183a <PyInit__native+0x41513a>
  691820: 48 8b 40 30                  	movq	0x30(%rax), %rax
  691824: 48 c1 ea 20                  	shrq	$0x20, %rdx
  691828: 84 d2                        	testb	%dl, %dl
  69182a: 75 4a                        	jne	0x691876 <PyInit__native+0x415176>
  69182c: 48 89 c2                     	movq	%rax, %rdx
  69182f: 48 83 c4 20                  	addq	$0x20, %rsp
  691833: 5b                           	popq	%rbx
  691834: ff 25 1e 66 46 00            	jmpq	*0x46661e(%rip)         # 0xaf7e58 ; ELF relocation: PyErr_Restore
  69183a: 48 8d 7c 24 08               	leaq	0x8(%rsp), %rdi
  69183f: e8 bc 00 00 00               	callq	0x691900 <PyInit__native+0x415200>
  691844: 48 8b 7c 24 08               	movq	0x8(%rsp), %rdi
  691849: 48 8b 74 24 10               	movq	0x10(%rsp), %rsi
  69184e: 48 8b 54 24 18               	movq	0x18(%rsp), %rdx
  691853: 48 83 c4 20                  	addq	$0x20, %rsp
  691857: 5b                           	popq	%rbx
  691858: ff 25 fa 65 46 00            	jmpq	*0x4665fa(%rip)         # 0xaf7e58 ; ELF relocation: PyErr_Restore
  69185e: 48 8d 3d 65 ab a8 ff         	leaq	-0x57549b(%rip), %rdi   # 0x11c3ca ; rodata: 'PyErr state should never be invalid outside of normalizationException type missingException value missingargumentswaskeywordpositionalAttaching a thread to the interpreter is curre'
  691865: 48 8d 15 34 75 44 00         	leaq	0x447534(%rip), %rdx    # 0xad8da0 ; ELF relocation: local pointer 0xcf97d
  69186c: be 3c 00 00 00               	movl	$0x3c, %esi
  691871: e8 6a 57 ee ff               	callq	0x576fe0 <PyInit__native+0x2fa8e0>
  691876: 48 89 04 24                  	movq	%rax, (%rsp)
  69187a: 48 8d 3d 21 60 aa ff         	leaq	-0x559fdf(%rip), %rdi   # 0x1378a2 ; rodata: "called `Result::unwrap()` on an `Err` value]<standaloneyes', 'no--version1.[>unexpected end of streaminvalid name tokenexpected , invalid referenceinvalid ExternalID'--' is not all"
  691881: 48 8d 0d d0 72 44 00         	leaq	0x4472d0(%rip), %rcx    # 0xad8b58 ; ELF relocation: local pointer 0x6918c0
  691888: 4c 8d 05 e9 75 44 00         	leaq	0x4475e9(%rip), %r8     # 0xad8e78 ; ELF relocation: local pointer 0xcf97d
  69188f: 48 89 e2                     	movq	%rsp, %rdx
  691892: be 2b 00 00 00               	movl	$0x2b, %esi
  691897: e8 84 57 ee ff               	callq	0x577020 <PyInit__native+0x2fa920>
  69189c: 0f 0b                        	ud2
  69189e: 48 89 c3                     	movq	%rax, %rbx
  6918a1: 48 89 e7                     	movq	%rsp, %rdi
  6918a4: e8 17 00 00 00               	callq	0x6918c0 <PyInit__native+0x4151c0>
  6918a9: 48 89 df                     	movq	%rbx, %rdi
  6918ac: e8 1f c5 42 00               	callq	0xabddd0 <_Unwind_Resume@plt>
  6918b1: e8 26 58 ee ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
