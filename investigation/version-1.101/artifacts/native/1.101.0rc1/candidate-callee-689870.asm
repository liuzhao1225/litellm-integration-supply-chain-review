
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027eb40 <PyInit__native>:
  689870: 55                           	pushq	%rbp
  689871: 41 57                        	pushq	%r15
  689873: 41 56                        	pushq	%r14
  689875: 41 55                        	pushq	%r13
  689877: 41 54                        	pushq	%r12
  689879: 53                           	pushq	%rbx
  68987a: 48 83 ec 18                  	subq	$0x18, %rsp
  68987e: 49 89 d6                     	movq	%rdx, %r14
  689881: 48 89 f3                     	movq	%rsi, %rbx
  689884: 49 89 ff                     	movq	%rdi, %r15
  689887: 4c 8b 62 18                  	movq	0x18(%rdx), %r12
  68988b: 48 89 e7                     	movq	%rsp, %rdi
  68988e: 41 ff d4                     	callq	*%r12
  689891: 66 0f 6f 04 24               	movdqa	(%rsp), %xmm0
  689896: 66 0f 74 05 62 f9 a1 ff      	pcmpeqb	-0x5e069e(%rip), %xmm0  # 0xa9200
  68989e: 66 0f d7 c0                  	pmovmskb	%xmm0, %eax
  6898a2: 3d ff ff 00 00               	cmpl	$0xffff, %eax           # imm = 0xFFFF
  6898a7: 75 4b                        	jne	0x6898f4 <PyInit__native+0x40adb4>
  6898a9: 4c 8b 63 10                  	movq	0x10(%rbx), %r12
  6898ad: 4d 85 e4                     	testq	%r12, %r12
  6898b0: 0f 84 a6 00 00 00            	je	0x68995c <PyInit__native+0x40ae1c>
  6898b6: 48 8b 6b 08                  	movq	0x8(%rbx), %rbp
  6898ba: 4c 89 e7                     	movq	%r12, %rdi
  6898bd: ff 15 9d ac 46 00            	callq	*0x46ac9d(%rip)         # 0xaf4560 ; ELF relocation: malloc
  6898c3: 48 85 c0                     	testq	%rax, %rax
  6898c6: 0f 84 96 01 00 00            	je	0x689a62 <PyInit__native+0x40af22>
  6898cc: 49 89 c5                     	movq	%rax, %r13
  6898cf: 48 89 c7                     	movq	%rax, %rdi
  6898d2: 48 89 ee                     	movq	%rbp, %rsi
  6898d5: 4c 89 e2                     	movq	%r12, %rdx
  6898d8: ff 15 8a ac 46 00            	callq	*0x46ac8a(%rip)         # 0xaf4568 ; ELF relocation: memcpy
  6898de: bf 18 00 00 00               	movl	$0x18, %edi
  6898e3: ff 15 77 ac 46 00            	callq	*0x46ac77(%rip)         # 0xaf4560 ; ELF relocation: malloc
  6898e9: 48 85 c0                     	testq	%rax, %rax
  6898ec: 0f 85 d1 00 00 00            	jne	0x6899c3 <PyInit__native+0x40ae83>
  6898f2: eb 7e                        	jmp	0x689972 <PyInit__native+0x40ae32>
  6898f4: 48 89 e7                     	movq	%rsp, %rdi
  6898f7: 48 89 de                     	movq	%rbx, %rsi
  6898fa: 41 ff d4                     	callq	*%r12
  6898fd: 66 0f 6f 04 24               	movdqa	(%rsp), %xmm0
  689902: 66 0f 74 05 46 08 a2 ff      	pcmpeqb	-0x5df7ba(%rip), %xmm0  # 0xaa150
  68990a: 66 0f d7 c0                  	pmovmskb	%xmm0, %eax
  68990e: 3d ff ff 00 00               	cmpl	$0xffff, %eax           # imm = 0xFFFF
  689913: 75 18                        	jne	0x68992d <PyInit__native+0x40aded>
  689915: 4c 8b 63 08                  	movq	0x8(%rbx), %r12
  689919: 4d 85 e4                     	testq	%r12, %r12
  68991c: 79 68                        	jns	0x689986 <PyInit__native+0x40ae46>
  68991e: 31 ff                        	xorl	%edi, %edi
  689920: 4c 89 e6                     	movq	%r12, %rsi
  689923: e8 63 cd ce ff               	callq	0x37668b <PyInit__native+0xf7b4b>
  689928: e9 33 01 00 00               	jmp	0x689a60 <PyInit__native+0x40af20>
  68992d: bf 10 00 00 00               	movl	$0x10, %edi
  689932: ff 15 28 ac 46 00            	callq	*0x46ac28(%rip)         # 0xaf4560 ; ELF relocation: malloc
  689938: 48 85 c0                     	testq	%rax, %rax
  68993b: 0f 84 10 01 00 00            	je	0x689a51 <PyInit__native+0x40af11>
  689941: 48 8d 0d 59 12 a9 ff         	leaq	-0x56eda7(%rip), %rcx   # 0x11aba1 ; rodata: 'panic from Rust codePython major version missingPython minor version missingassertion failed: patch_str.is_none()Python major version not an integerassertion failed: self.has_trave'
  689948: 48 89 08                     	movq	%rcx, (%rax)
  68994b: 48 c7 40 08 14 00 00 00      	movq	$0x14, 0x8(%rax)
  689953: 48 8d 0d 4e bd 44 00         	leaq	0x44bd4e(%rip), %rcx    # 0xad56a8
  68995a: eb 79                        	jmp	0x6899d5 <PyInit__native+0x40ae95>
  68995c: 41 bd 01 00 00 00            	movl	$0x1, %r13d
  689962: bf 18 00 00 00               	movl	$0x18, %edi
  689967: ff 15 f3 ab 46 00            	callq	*0x46abf3(%rip)         # 0xaf4560 ; ELF relocation: malloc
  68996d: 48 85 c0                     	testq	%rax, %rax
  689970: 75 51                        	jne	0x6899c3 <PyInit__native+0x40ae83>
  689972: bf 08 00 00 00               	movl	$0x8, %edi
  689977: be 18 00 00 00               	movl	$0x18, %esi
  68997c: e8 11 ce ce ff               	callq	0x376792 <PyInit__native+0xf7c52>
  689981: e9 da 00 00 00               	jmp	0x689a60 <PyInit__native+0x40af20>
  689986: 0f 84 9e 00 00 00            	je	0x689a2a <PyInit__native+0x40aeea>
  68998c: 48 8b 2b                     	movq	(%rbx), %rbp
  68998f: 4c 89 e7                     	movq	%r12, %rdi
  689992: ff 15 c8 ab 46 00            	callq	*0x46abc8(%rip)         # 0xaf4560 ; ELF relocation: malloc
  689998: 48 85 c0                     	testq	%rax, %rax
  68999b: 0f 84 c1 00 00 00            	je	0x689a62 <PyInit__native+0x40af22>
  6899a1: 49 89 c5                     	movq	%rax, %r13
  6899a4: 48 89 c7                     	movq	%rax, %rdi
  6899a7: 48 89 ee                     	movq	%rbp, %rsi
  6899aa: 4c 89 e2                     	movq	%r12, %rdx
  6899ad: ff 15 b5 ab 46 00            	callq	*0x46abb5(%rip)         # 0xaf4568 ; ELF relocation: memcpy
  6899b3: bf 18 00 00 00               	movl	$0x18, %edi
  6899b8: ff 15 a2 ab 46 00            	callq	*0x46aba2(%rip)         # 0xaf4560 ; ELF relocation: malloc
  6899be: 48 85 c0                     	testq	%rax, %rax
  6899c1: 74 7d                        	je	0x689a40 <PyInit__native+0x40af00>
  6899c3: 4c 89 20                     	movq	%r12, (%rax)
  6899c6: 4c 89 68 08                  	movq	%r13, 0x8(%rax)
  6899ca: 4c 89 60 10                  	movq	%r12, 0x10(%rax)
  6899ce: 48 8d 0d f3 bc 44 00         	leaq	0x44bcf3(%rip), %rcx    # 0xad56c8 ; ELF relocation: local pointer 0x3cab60
  6899d5: 66 0f ef c0                  	pxor	%xmm0, %xmm0
  6899d9: f3 41 0f 7f 07               	movdqu	%xmm0, (%r15)
  6899de: 49 c7 47 10 01 00 00 00      	movq	$0x1, 0x10(%r15)
  6899e6: 49 c7 47 18 00 00 00 00      	movq	$0x0, 0x18(%r15)
  6899ee: 49 89 47 20                  	movq	%rax, 0x20(%r15)
  6899f2: 49 89 4f 28                  	movq	%rcx, 0x28(%r15)
  6899f6: 41 c7 47 38 03 00 00 00      	movl	$0x3, 0x38(%r15)
  6899fe: 49 8b 06                     	movq	(%r14), %rax
  689a01: 48 85 c0                     	testq	%rax, %rax
  689a04: 74 05                        	je	0x689a0b <PyInit__native+0x40aecb>
  689a06: 48 89 df                     	movq	%rbx, %rdi
  689a09: ff d0                        	callq	*%rax
  689a0b: 49 83 7e 08 00               	cmpq	$0x0, 0x8(%r14)
  689a10: 74 09                        	je	0x689a1b <PyInit__native+0x40aedb>
  689a12: 48 89 df                     	movq	%rbx, %rdi
  689a15: ff 15 55 ab 46 00            	callq	*0x46ab55(%rip)         # 0xaf4570 ; ELF relocation: free
  689a1b: 48 83 c4 18                  	addq	$0x18, %rsp
  689a1f: 5b                           	popq	%rbx
  689a20: 41 5c                        	popq	%r12
  689a22: 41 5d                        	popq	%r13
  689a24: 41 5e                        	popq	%r14
  689a26: 41 5f                        	popq	%r15
  689a28: 5d                           	popq	%rbp
  689a29: c3                           	retq
  689a2a: 41 bd 01 00 00 00            	movl	$0x1, %r13d
  689a30: bf 18 00 00 00               	movl	$0x18, %edi
  689a35: ff 15 25 ab 46 00            	callq	*0x46ab25(%rip)         # 0xaf4560 ; ELF relocation: malloc
  689a3b: 48 85 c0                     	testq	%rax, %rax
  689a3e: 75 83                        	jne	0x6899c3 <PyInit__native+0x40ae83>
  689a40: bf 08 00 00 00               	movl	$0x8, %edi
  689a45: be 18 00 00 00               	movl	$0x18, %esi
  689a4a: e8 43 cd ce ff               	callq	0x376792 <PyInit__native+0xf7c52>
  689a4f: eb 0f                        	jmp	0x689a60 <PyInit__native+0x40af20>
  689a51: bf 08 00 00 00               	movl	$0x8, %edi
  689a56: be 10 00 00 00               	movl	$0x10, %esi
  689a5b: e8 32 cd ce ff               	callq	0x376792 <PyInit__native+0xf7c52>
  689a60: 0f 0b                        	ud2
  689a62: bf 01 00 00 00               	movl	$0x1, %edi
  689a67: e9 b4 fe ff ff               	jmp	0x689920 <PyInit__native+0x40ade0>
  689a6c: 49 89 c7                     	movq	%rax, %r15
  689a6f: eb 25                        	jmp	0x689a96 <PyInit__native+0x40af56>
  689a71: eb 00                        	jmp	0x689a73 <PyInit__native+0x40af33>
  689a73: 49 89 c7                     	movq	%rax, %r15
  689a76: 4d 85 e4                     	testq	%r12, %r12
  689a79: 74 0e                        	je	0x689a89 <PyInit__native+0x40af49>
  689a7b: 4c 89 ef                     	movq	%r13, %rdi
  689a7e: ff 15 ec aa 46 00            	callq	*0x46aaec(%rip)         # 0xaf4570 ; ELF relocation: free
  689a84: eb 03                        	jmp	0x689a89 <PyInit__native+0x40af49>
  689a86: 49 89 c7                     	movq	%rax, %r15
  689a89: 49 8b 06                     	movq	(%r14), %rax
  689a8c: 48 85 c0                     	testq	%rax, %rax
  689a8f: 74 05                        	je	0x689a96 <PyInit__native+0x40af56>
  689a91: 48 89 df                     	movq	%rbx, %rdi
  689a94: ff d0                        	callq	*%rax
  689a96: 49 83 7e 08 00               	cmpq	$0x0, 0x8(%r14)
  689a9b: 74 09                        	je	0x689aa6 <PyInit__native+0x40af66>
  689a9d: 48 89 df                     	movq	%rbx, %rdi
  689aa0: ff 15 ca aa 46 00            	callq	*0x46aaca(%rip)         # 0xaf4570 ; ELF relocation: free
  689aa6: 4c 89 ff                     	movq	%r15, %rdi
  689aa9: e8 22 17 43 00               	callq	0xabb1d0 <_Unwind_Resume@plt>
  689aae: 49 83 7e 08 00               	cmpq	$0x0, 0x8(%r14)
  689ab3: 74 09                        	je	0x689abe <PyInit__native+0x40af7e>
  689ab5: 48 89 df                     	movq	%rbx, %rdi
  689ab8: ff 15 b2 aa 46 00            	callq	*0x46aab2(%rip)         # 0xaf4570 ; ELF relocation: free
  689abe: e8 49 c3 f0 ff               	callq	0x595e0c <PyInit__native+0x3172cc>
