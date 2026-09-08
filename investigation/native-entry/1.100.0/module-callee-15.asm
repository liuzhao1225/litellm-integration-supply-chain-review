
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000027c700 <PyInit__native>:
  694fd0: 55                           	pushq	%rbp
  694fd1: 41 57                        	pushq	%r15
  694fd3: 41 56                        	pushq	%r14
  694fd5: 41 55                        	pushq	%r13
  694fd7: 41 54                        	pushq	%r12
  694fd9: 53                           	pushq	%rbx
  694fda: 48 83 ec 18                  	subq	$0x18, %rsp
  694fde: 49 89 d6                     	movq	%rdx, %r14
  694fe1: 48 89 f3                     	movq	%rsi, %rbx
  694fe4: 49 89 ff                     	movq	%rdi, %r15
  694fe7: 4c 8b 62 18                  	movq	0x18(%rdx), %r12
  694feb: 48 89 e7                     	movq	%rsp, %rdi
  694fee: 41 ff d4                     	callq	*%r12
  694ff1: 66 0f 6f 04 24               	movdqa	(%rsp), %xmm0
  694ff6: 66 0f 74 05 72 68 a1 ff      	pcmpeqb	-0x5e978e(%rip), %xmm0  # 0xab870
  694ffe: 66 0f d7 c0                  	pmovmskb	%xmm0, %eax
  695002: 3d ff ff 00 00               	cmpl	$0xffff, %eax           # imm = 0xFFFF
  695007: 75 4b                        	jne	0x695054 <PyInit__native+0x418954>
  695009: 4c 8b 63 10                  	movq	0x10(%rbx), %r12
  69500d: 4d 85 e4                     	testq	%r12, %r12
  695010: 0f 84 a6 00 00 00            	je	0x6950bc <PyInit__native+0x4189bc>
  695016: 48 8b 6b 08                  	movq	0x8(%rbx), %rbp
  69501a: 4c 89 e7                     	movq	%r12, %rdi
  69501d: ff 15 5d 28 46 00            	callq	*0x46285d(%rip)         # 0xaf7880 ; ELF relocation: malloc
  695023: 48 85 c0                     	testq	%rax, %rax
  695026: 0f 84 96 01 00 00            	je	0x6951c2 <PyInit__native+0x418ac2>
  69502c: 49 89 c5                     	movq	%rax, %r13
  69502f: 48 89 c7                     	movq	%rax, %rdi
  695032: 48 89 ee                     	movq	%rbp, %rsi
  695035: 4c 89 e2                     	movq	%r12, %rdx
  695038: ff 15 4a 28 46 00            	callq	*0x46284a(%rip)         # 0xaf7888 ; ELF relocation: memcpy
  69503e: bf 18 00 00 00               	movl	$0x18, %edi
  695043: ff 15 37 28 46 00            	callq	*0x462837(%rip)         # 0xaf7880 ; ELF relocation: malloc
  695049: 48 85 c0                     	testq	%rax, %rax
  69504c: 0f 85 d1 00 00 00            	jne	0x695123 <PyInit__native+0x418a23>
  695052: eb 7e                        	jmp	0x6950d2 <PyInit__native+0x4189d2>
  695054: 48 89 e7                     	movq	%rsp, %rdi
  695057: 48 89 de                     	movq	%rbx, %rsi
  69505a: 41 ff d4                     	callq	*%r12
  69505d: 66 0f 6f 04 24               	movdqa	(%rsp), %xmm0
  695062: 66 0f 74 05 56 71 a1 ff      	pcmpeqb	-0x5e8eaa(%rip), %xmm0  # 0xac1c0
  69506a: 66 0f d7 c0                  	pmovmskb	%xmm0, %eax
  69506e: 3d ff ff 00 00               	cmpl	$0xffff, %eax           # imm = 0xFFFF
  695073: 75 18                        	jne	0x69508d <PyInit__native+0x41898d>
  695075: 4c 8b 63 08                  	movq	0x8(%rbx), %r12
  695079: 4d 85 e4                     	testq	%r12, %r12
  69507c: 79 68                        	jns	0x6950e6 <PyInit__native+0x4189e6>
  69507e: 31 ff                        	xorl	%edi, %edi
  695080: 4c 89 e6                     	movq	%r12, %rsi
  695083: e8 e0 0f cc ff               	callq	0x356068 <PyInit__native+0xd9968>
  695088: e9 33 01 00 00               	jmp	0x6951c0 <PyInit__native+0x418ac0>
  69508d: bf 10 00 00 00               	movl	$0x10, %edi
  695092: ff 15 e8 27 46 00            	callq	*0x4627e8(%rip)         # 0xaf7880 ; ELF relocation: malloc
  695098: 48 85 c0                     	testq	%rax, %rax
  69509b: 0f 84 10 01 00 00            	je	0x6951b1 <PyInit__native+0x418ab1>
  6950a1: 48 8d 0d d9 71 a8 ff         	leaq	-0x578e27(%rip), %rcx   # 0x11c281 ; rodata: 'panic from Rust codePython major version missingPython minor version missingassertion failed: patch_str.is_none()Python major version not an integerassertion failed: self.has_trave'
  6950a8: 48 89 08                     	movq	%rcx, (%rax)
  6950ab: 48 c7 40 08 14 00 00 00      	movq	$0x14, 0x8(%rax)
  6950b3: 48 8d 0d 46 3a 44 00         	leaq	0x443a46(%rip), %rcx    # 0xad8b00
  6950ba: eb 79                        	jmp	0x695135 <PyInit__native+0x418a35>
  6950bc: 41 bd 01 00 00 00            	movl	$0x1, %r13d
  6950c2: bf 18 00 00 00               	movl	$0x18, %edi
  6950c7: ff 15 b3 27 46 00            	callq	*0x4627b3(%rip)         # 0xaf7880 ; ELF relocation: malloc
  6950cd: 48 85 c0                     	testq	%rax, %rax
  6950d0: 75 51                        	jne	0x695123 <PyInit__native+0x418a23>
  6950d2: bf 08 00 00 00               	movl	$0x8, %edi
  6950d7: be 18 00 00 00               	movl	$0x18, %esi
  6950dc: e8 91 10 cc ff               	callq	0x356172 <PyInit__native+0xd9a72>
  6950e1: e9 da 00 00 00               	jmp	0x6951c0 <PyInit__native+0x418ac0>
  6950e6: 0f 84 9e 00 00 00            	je	0x69518a <PyInit__native+0x418a8a>
  6950ec: 48 8b 2b                     	movq	(%rbx), %rbp
  6950ef: 4c 89 e7                     	movq	%r12, %rdi
  6950f2: ff 15 88 27 46 00            	callq	*0x462788(%rip)         # 0xaf7880 ; ELF relocation: malloc
  6950f8: 48 85 c0                     	testq	%rax, %rax
  6950fb: 0f 84 c1 00 00 00            	je	0x6951c2 <PyInit__native+0x418ac2>
  695101: 49 89 c5                     	movq	%rax, %r13
  695104: 48 89 c7                     	movq	%rax, %rdi
  695107: 48 89 ee                     	movq	%rbp, %rsi
  69510a: 4c 89 e2                     	movq	%r12, %rdx
  69510d: ff 15 75 27 46 00            	callq	*0x462775(%rip)         # 0xaf7888 ; ELF relocation: memcpy
  695113: bf 18 00 00 00               	movl	$0x18, %edi
  695118: ff 15 62 27 46 00            	callq	*0x462762(%rip)         # 0xaf7880 ; ELF relocation: malloc
  69511e: 48 85 c0                     	testq	%rax, %rax
  695121: 74 7d                        	je	0x6951a0 <PyInit__native+0x418aa0>
  695123: 4c 89 20                     	movq	%r12, (%rax)
  695126: 4c 89 68 08                  	movq	%r13, 0x8(%rax)
  69512a: 4c 89 60 10                  	movq	%r12, 0x10(%rax)
  69512e: 48 8d 0d eb 39 44 00         	leaq	0x4439eb(%rip), %rcx    # 0xad8b20 ; ELF relocation: local pointer 0x3a95f0
  695135: 66 0f ef c0                  	pxor	%xmm0, %xmm0
  695139: f3 41 0f 7f 07               	movdqu	%xmm0, (%r15)
  69513e: 49 c7 47 10 01 00 00 00      	movq	$0x1, 0x10(%r15)
  695146: 49 c7 47 18 00 00 00 00      	movq	$0x0, 0x18(%r15)
  69514e: 49 89 47 20                  	movq	%rax, 0x20(%r15)
  695152: 49 89 4f 28                  	movq	%rcx, 0x28(%r15)
  695156: 41 c7 47 38 03 00 00 00      	movl	$0x3, 0x38(%r15)
  69515e: 49 8b 06                     	movq	(%r14), %rax
  695161: 48 85 c0                     	testq	%rax, %rax
  695164: 74 05                        	je	0x69516b <PyInit__native+0x418a6b>
  695166: 48 89 df                     	movq	%rbx, %rdi
  695169: ff d0                        	callq	*%rax
  69516b: 49 83 7e 08 00               	cmpq	$0x0, 0x8(%r14)
  695170: 74 09                        	je	0x69517b <PyInit__native+0x418a7b>
  695172: 48 89 df                     	movq	%rbx, %rdi
  695175: ff 15 1d 27 46 00            	callq	*0x46271d(%rip)         # 0xaf7898 ; ELF relocation: free
  69517b: 48 83 c4 18                  	addq	$0x18, %rsp
  69517f: 5b                           	popq	%rbx
  695180: 41 5c                        	popq	%r12
  695182: 41 5d                        	popq	%r13
  695184: 41 5e                        	popq	%r14
  695186: 41 5f                        	popq	%r15
  695188: 5d                           	popq	%rbp
  695189: c3                           	retq
  69518a: 41 bd 01 00 00 00            	movl	$0x1, %r13d
  695190: bf 18 00 00 00               	movl	$0x18, %edi
  695195: ff 15 e5 26 46 00            	callq	*0x4626e5(%rip)         # 0xaf7880 ; ELF relocation: malloc
  69519b: 48 85 c0                     	testq	%rax, %rax
  69519e: 75 83                        	jne	0x695123 <PyInit__native+0x418a23>
  6951a0: bf 08 00 00 00               	movl	$0x8, %edi
  6951a5: be 18 00 00 00               	movl	$0x18, %esi
  6951aa: e8 c3 0f cc ff               	callq	0x356172 <PyInit__native+0xd9a72>
  6951af: eb 0f                        	jmp	0x6951c0 <PyInit__native+0x418ac0>
  6951b1: bf 08 00 00 00               	movl	$0x8, %edi
  6951b6: be 10 00 00 00               	movl	$0x10, %esi
  6951bb: e8 b2 0f cc ff               	callq	0x356172 <PyInit__native+0xd9a72>
  6951c0: 0f 0b                        	ud2
  6951c2: bf 01 00 00 00               	movl	$0x1, %edi
  6951c7: e9 b4 fe ff ff               	jmp	0x695080 <PyInit__native+0x418980>
  6951cc: 49 89 c7                     	movq	%rax, %r15
  6951cf: eb 25                        	jmp	0x6951f6 <PyInit__native+0x418af6>
  6951d1: eb 00                        	jmp	0x6951d3 <PyInit__native+0x418ad3>
  6951d3: 49 89 c7                     	movq	%rax, %r15
  6951d6: 4d 85 e4                     	testq	%r12, %r12
  6951d9: 74 0e                        	je	0x6951e9 <PyInit__native+0x418ae9>
  6951db: 4c 89 ef                     	movq	%r13, %rdi
  6951de: ff 15 b4 26 46 00            	callq	*0x4626b4(%rip)         # 0xaf7898 ; ELF relocation: free
  6951e4: eb 03                        	jmp	0x6951e9 <PyInit__native+0x418ae9>
  6951e6: 49 89 c7                     	movq	%rax, %r15
  6951e9: 49 8b 06                     	movq	(%r14), %rax
  6951ec: 48 85 c0                     	testq	%rax, %rax
  6951ef: 74 05                        	je	0x6951f6 <PyInit__native+0x418af6>
  6951f1: 48 89 df                     	movq	%rbx, %rdi
  6951f4: ff d0                        	callq	*%rax
  6951f6: 49 83 7e 08 00               	cmpq	$0x0, 0x8(%r14)
  6951fb: 74 09                        	je	0x695206 <PyInit__native+0x418b06>
  6951fd: 48 89 df                     	movq	%rbx, %rdi
  695200: ff 15 92 26 46 00            	callq	*0x462692(%rip)         # 0xaf7898 ; ELF relocation: free
  695206: 4c 89 ff                     	movq	%r15, %rdi
  695209: e8 c2 8b 42 00               	callq	0xabddd0 <_Unwind_Resume@plt>
  69520e: 49 83 7e 08 00               	cmpq	$0x0, 0x8(%r14)
  695213: 74 09                        	je	0x69521e <PyInit__native+0x418b1e>
  695215: 48 89 df                     	movq	%rbx, %rdi
  695218: ff 15 7a 26 46 00            	callq	*0x46267a(%rip)         # 0xaf7898 ; ELF relocation: free
  69521e: e8 b9 1e ee ff               	callq	0x5770dc <PyInit__native+0x2fa9dc>
