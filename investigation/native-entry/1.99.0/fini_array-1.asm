
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

0000000000699660 <PyInit_pyo3_async_runtimes>:
  8c5490: 55                           	pushq	%rbp
  8c5491: 48 8d 2d 08 d2 22 00         	leaq	0x22d208(%rip), %rbp    # 0xaf26a0
  8c5498: 53                           	pushq	%rbx
  8c5499: 48 89 ef                     	movq	%rbp, %rdi
  8c549c: 48 83 ec 08                  	subq	$0x8, %rsp
  8c54a0: e8 fb 48 03 00               	callq	0x8f9da0 <PyInit_pyo3_async_runtimes+0x260740>
  8c54a5: 8b 05 dd d1 22 00            	movl	0x22d1dd(%rip), %eax    # 0xaf2688
  8c54ab: 85 c0                        	testl	%eax, %eax
  8c54ad: 75 6b                        	jne	0x8c551a <PyInit_pyo3_async_runtimes+0x22beba>
  8c54af: 48 8b 1d 22 d2 22 00         	movq	0x22d222(%rip), %rbx    # 0xaf26d8
  8c54b6: c7 05 c8 d1 22 00 01 00 00 00	movl	$0x1, 0x22d1c8(%rip)    # 0xaf2688
  8c54c0: 48 85 db                     	testq	%rbx, %rbx
  8c54c3: 74 55                        	je	0x8c551a <PyInit_pyo3_async_runtimes+0x22beba>
  8c54c5: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  8c54d0: 48 8d bb 50 01 00 00         	leaq	0x150(%rbx), %rdi
  8c54d7: e8 34 48 03 00               	callq	0x8f9d10 <PyInit_pyo3_async_runtimes+0x2606b0>
  8c54dc: 48 89 df                     	movq	%rbx, %rdi
  8c54df: e8 9c ff ff ff               	callq	0x8c5480 <PyInit_pyo3_async_runtimes+0x22be20>
  8c54e4: 48 8b 9b 40 01 00 00         	movq	0x140(%rbx), %rbx
  8c54eb: 48 85 db                     	testq	%rbx, %rbx
  8c54ee: 75 e0                        	jne	0x8c54d0 <PyInit_pyo3_async_runtimes+0x22be70>
  8c54f0: 48 8b 1d e1 d1 22 00         	movq	0x22d1e1(%rip), %rbx    # 0xaf26d8
  8c54f7: 48 85 db                     	testq	%rbx, %rbx
  8c54fa: 74 1e                        	je	0x8c551a <PyInit_pyo3_async_runtimes+0x22beba>
  8c54fc: 0f 1f 40 00                  	nopl	(%rax)
  8c5500: 48 8b bb 38 01 00 00         	movq	0x138(%rbx), %rdi
  8c5507: 48 8b 47 08                  	movq	0x8(%rdi), %rax
  8c550b: ff 50 08                     	callq	*0x8(%rax)
  8c550e: 48 8b 9b 40 01 00 00         	movq	0x140(%rbx), %rbx
  8c5515: 48 85 db                     	testq	%rbx, %rbx
  8c5518: 75 e6                        	jne	0x8c5500 <PyInit_pyo3_async_runtimes+0x22bea0>
  8c551a: 48 83 c4 08                  	addq	$0x8, %rsp
  8c551e: 48 89 ef                     	movq	%rbp, %rdi
  8c5521: 5b                           	popq	%rbx
  8c5522: 5d                           	popq	%rbp
  8c5523: e9 b8 48 03 00               	jmp	0x8f9de0 <PyInit_pyo3_async_runtimes+0x260780>
  8c5528: cc                           	int3
  8c5529: cc                           	int3
  8c552a: cc                           	int3
  8c552b: cc                           	int3
  8c552c: cc                           	int3
  8c552d: cc                           	int3
  8c552e: cc                           	int3
  8c552f: cc                           	int3
  8c5530: 53                           	pushq	%rbx
  8c5531: bf 10 00 00 00               	movl	$0x10, %edi
  8c5536: e8 15 e1 02 00               	callq	0x8f3650 <PyInit_pyo3_async_runtimes+0x259ff0>
  8c553b: 48 85 c0                     	testq	%rax, %rax
  8c553e: 74 78                        	je	0x8c55b8 <PyInit_pyo3_async_runtimes+0x22bf58>
  8c5540: 83 3d 31 d1 22 00 01         	cmpl	$0x1, 0x22d131(%rip)    # 0xaf2678
  8c5547: 48 89 c3                     	movq	%rax, %rbx
  8c554a: 74 54                        	je	0x8c55a0 <PyInit_pyo3_async_runtimes+0x22bf40>
  8c554c: e8 ff 4f 03 00               	callq	0x8fa550 <PyInit_pyo3_async_runtimes+0x260ef0>
  8c5551: 83 f8 01                     	cmpl	$0x1, %eax
  8c5554: 74 6a                        	je	0x8c55c0 <PyInit_pyo3_async_runtimes+0x22bf60>
  8c5556: 48 8d 35 23 35 fc ff         	leaq	-0x3cadd(%rip), %rsi    # 0x888a80 <PyInit_pyo3_async_runtimes+0x1ef420>
  8c555d: 48 8d 3d d4 d0 22 00         	leaq	0x22d0d4(%rip), %rdi    # 0xaf2638
  8c5564: e8 97 48 03 00               	callq	0x8f9e00 <PyInit_pyo3_async_runtimes+0x2607a0>
  8c5569: 48 8d 05 d0 d0 22 00         	leaq	0x22d0d0(%rip), %rax    # 0xaf2640
  8c5570: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  8c5574: 48 83 78 08 00               	cmpq	$0x0, 0x8(%rax)
  8c5579: 74 35                        	je	0x8c55b0 <PyInit_pyo3_async_runtimes+0x22bf50>
  8c557b: 48 83 78 10 00               	cmpq	$0x0, 0x10(%rax)
  8c5580: 74 2e                        	je	0x8c55b0 <PyInit_pyo3_async_runtimes+0x22bf50>
  8c5582: 48 83 78 18 00               	cmpq	$0x0, 0x18(%rax)
  8c5587: 74 27                        	je	0x8c55b0 <PyInit_pyo3_async_runtimes+0x22bf50>
  8c5589: 48 8b 00                     	movq	(%rax), %rax
  8c558c: 48 85 c0                     	testq	%rax, %rax
  8c558f: 74 1f                        	je	0x8c55b0 <PyInit_pyo3_async_runtimes+0x22bf50>
  8c5591: 48 89 df                     	movq	%rbx, %rdi
  8c5594: ff d0                        	callq	*%rax
  8c5596: 83 f8 01                     	cmpl	$0x1, %eax
  8c5599: 75 15                        	jne	0x8c55b0 <PyInit_pyo3_async_runtimes+0x22bf50>
  8c559b: 48 89 d8                     	movq	%rbx, %rax
  8c559e: 5b                           	popq	%rbx
  8c559f: c3                           	retq
  8c55a0: 48 8b 05 d9 d0 22 00         	movq	0x22d0d9(%rip), %rax    # 0xaf2680
  8c55a7: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  8c55ab: 48 85 c0                     	testq	%rax, %rax
  8c55ae: 75 c4                        	jne	0x8c5574 <PyInit_pyo3_async_runtimes+0x22bf14>
  8c55b0: 48 89 df                     	movq	%rbx, %rdi
  8c55b3: e8 38 e1 02 00               	callq	0x8f36f0 <PyInit_pyo3_async_runtimes+0x25a090>
  8c55b8: 31 db                        	xorl	%ebx, %ebx
  8c55ba: 48 89 d8                     	movq	%rbx, %rax
  8c55bd: 5b                           	popq	%rbx
  8c55be: c3                           	retq
  8c55bf: 90                           	nop
  8c55c0: 48 8d 35 39 35 fc ff         	leaq	-0x3cac7(%rip), %rsi    # 0x888b00 <PyInit_pyo3_async_runtimes+0x1ef4a0>
  8c55c7: 48 8d 3d 1a d0 22 00         	leaq	0x22d01a(%rip), %rdi    # 0xaf25e8
  8c55ce: e8 2d 48 03 00               	callq	0x8f9e00 <PyInit_pyo3_async_runtimes+0x2607a0>
  8c55d3: 48 8d 05 26 d0 22 00         	leaq	0x22d026(%rip), %rax    # 0xaf2600
  8c55da: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  8c55de: eb 94                        	jmp	0x8c5574 <PyInit_pyo3_async_runtimes+0x22bf14>
  8c55e0: e8 cb 01 1f 00               	callq	0xab57b0 <abort@plt>
  8c55e5: e8 c6 01 1f 00               	callq	0xab57b0 <abort@plt>
  8c55ea: cc                           	int3
  8c55eb: cc                           	int3
  8c55ec: cc                           	int3
  8c55ed: cc                           	int3
  8c55ee: cc                           	int3
  8c55ef: cc                           	int3
  8c55f0: 41 57                        	pushq	%r15
  8c55f2: 41 56                        	pushq	%r14
  8c55f4: 41 89 fe                     	movl	%edi, %r14d
  8c55f7: 41 55                        	pushq	%r13
  8c55f9: 49 89 f5                     	movq	%rsi, %r13
  8c55fc: 41 54                        	pushq	%r12
  8c55fe: 49 89 d4                     	movq	%rdx, %r12
  8c5601: 55                           	pushq	%rbp
  8c5602: 48 89 cd                     	movq	%rcx, %rbp
  8c5605: 53                           	pushq	%rbx
  8c5606: 48 81 ec 08 01 00 00         	subq	$0x108, %rsp            # imm = 0x108
  8c560d: 44 89 44 24 10               	movl	%r8d, 0x10(%rsp)
  8c5612: e8 09 48 03 00               	callq	0x8f9e20 <PyInit_pyo3_async_runtimes+0x2607c0>
  8c5617: c7 44 24 18 01 00 00 00      	movl	$0x1, 0x18(%rsp)
  8c561f: 48 85 c0                     	testq	%rax, %rax
  8c5622: 0f 84 b8 02 00 00            	je	0x8c58e0 <PyInit_pyo3_async_runtimes+0x22c280>
  8c5628: 48 89 c3                     	movq	%rax, %rbx
  8c562b: 4d 85 ed                     	testq	%r13, %r13
  8c562e: 0f 84 b1 ff ff ff            	je	0x8c55e5 <PyInit_pyo3_async_runtimes+0x22bf85>
  8c5634: 48 8d 84 24 d0 00 00 00      	leaq	0xd0(%rsp), %rax
  8c563c: 48 c7 84 24 d0 00 00 00 00 00 00 00  	movq	$0x0, 0xd0(%rsp)
  8c5648: 48 89 c7                     	movq	%rax, %rdi
  8c564b: 48 89 44 24 08               	movq	%rax, 0x8(%rsp)
  8c5650: e8 ab 4b 03 00               	callq	0x8fa200 <PyInit_pyo3_async_runtimes+0x260ba0>
  8c5655: 83 f8 01                     	cmpl	$0x1, %eax
  8c5658: 75 1c                        	jne	0x8c5676 <PyInit_pyo3_async_runtimes+0x22c016>
  8c565a: 48 8b 84 24 d0 00 00 00      	movq	0xd0(%rsp), %rax
  8c5662: 48 39 83 30 01 00 00         	cmpq	%rax, 0x130(%rbx)
  8c5669: 0f 84 09 02 00 00            	je	0x8c5878 <PyInit_pyo3_async_runtimes+0x22c218>
  8c566f: 48 89 83 30 01 00 00         	movq	%rax, 0x130(%rbx)
  8c5676: 48 8b bb 38 01 00 00         	movq	0x138(%rbx), %rdi
  8c567d: 66 0f ef c0                  	pxor	%xmm0, %xmm0
  8c5681: 0f 29 44 24 20               	movaps	%xmm0, 0x20(%rsp)
  8c5686: 0f 29 44 24 30               	movaps	%xmm0, 0x30(%rsp)
  8c568b: 48 85 ff                     	testq	%rdi, %rdi
  8c568e: 0f 84 51 ff ff ff            	je	0x8c55e5 <PyInit_pyo3_async_runtimes+0x22bf85>
