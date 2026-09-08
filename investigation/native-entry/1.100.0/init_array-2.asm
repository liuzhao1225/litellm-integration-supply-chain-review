
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000069f890 <PyInit_pyo3_async_runtimes>:
  882480: e9 1b 31 03 00               	jmp	0x8b55a0 <PyInit_pyo3_async_runtimes+0x215d10>
  882485: cc                           	int3
  882486: cc                           	int3
  882487: cc                           	int3
  882488: cc                           	int3
  882489: cc                           	int3
  88248a: cc                           	int3
  88248b: cc                           	int3
  88248c: cc                           	int3
  88248d: cc                           	int3
  88248e: cc                           	int3
  88248f: cc                           	int3
  882490: c3                           	retq
  882491: cc                           	int3
  882492: cc                           	int3
  882493: cc                           	int3
  882494: cc                           	int3
  882495: cc                           	int3
  882496: cc                           	int3
  882497: cc                           	int3
  882498: cc                           	int3
  882499: cc                           	int3
  88249a: cc                           	int3
  88249b: cc                           	int3
  88249c: cc                           	int3
  88249d: cc                           	int3
  88249e: cc                           	int3
  88249f: cc                           	int3
  8824a0: 41 54                        	pushq	%r12
  8824a2: 55                           	pushq	%rbp
  8824a3: 48 89 fd                     	movq	%rdi, %rbp
  8824a6: 53                           	pushq	%rbx
  8824a7: 48 83 ec 10                  	subq	$0x10, %rsp
  8824ab: e8 00 50 03 00               	callq	0x8b74b0 <PyInit_pyo3_async_runtimes+0x217c20>
  8824b0: 48 85 c0                     	testq	%rax, %rax
  8824b3: 74 79                        	je	0x88252e <PyInit_pyo3_async_runtimes+0x1e2c9e>
  8824b5: ba 10 00 00 20               	movl	$0x20000010, %edx       # imm = 0x20000010
  8824ba: 48 89 e6                     	movq	%rsp, %rsi
  8824bd: 48 89 ef                     	movq	%rbp, %rdi
  8824c0: 48 89 c3                     	movq	%rax, %rbx
  8824c3: e8 98 f1 ff ff               	callq	0x881660 <PyInit_pyo3_async_runtimes+0x1e1dd0>
  8824c8: 85 c0                        	testl	%eax, %eax
  8824ca: 74 3c                        	je	0x882508 <PyInit_pyo3_async_runtimes+0x1e2c78>
  8824cc: 48 8b 33                     	movq	(%rbx), %rsi
  8824cf: 48 89 e7                     	movq	%rsp, %rdi
  8824d2: e8 c9 02 00 00               	callq	0x8827a0 <PyInit_pyo3_async_runtimes+0x1e2f10>
  8824d7: 85 c0                        	testl	%eax, %eax
  8824d9: 74 2d                        	je	0x882508 <PyInit_pyo3_async_runtimes+0x1e2c78>
  8824db: 48 8b 73 08                  	movq	0x8(%rbx), %rsi
  8824df: 48 89 e7                     	movq	%rsp, %rdi
  8824e2: e8 b9 02 00 00               	callq	0x8827a0 <PyInit_pyo3_async_runtimes+0x1e2f10>
  8824e7: 85 c0                        	testl	%eax, %eax
  8824e9: 74 1d                        	je	0x882508 <PyInit_pyo3_async_runtimes+0x1e2c78>
  8824eb: 48 89 e7                     	movq	%rsp, %rdi
  8824ee: e8 6d ec ff ff               	callq	0x881160 <PyInit_pyo3_async_runtimes+0x1e18d0>
  8824f3: 48 85 c0                     	testq	%rax, %rax
  8824f6: 75 10                        	jne	0x882508 <PyInit_pyo3_async_runtimes+0x1e2c78>
  8824f8: 48 83 c4 10                  	addq	$0x10, %rsp
  8824fc: 48 89 d8                     	movq	%rbx, %rax
  8824ff: 5b                           	popq	%rbx
  882500: 5d                           	popq	%rbp
  882501: 41 5c                        	popq	%r12
  882503: c3                           	retq
  882504: 0f 1f 40 00                  	nopl	(%rax)
  882508: bf 1a 00 00 00               	movl	$0x1a, %edi
  88250d: 41 b8 2e 00 00 00            	movl	$0x2e, %r8d
  882513: 48 8d 0d ee 82 8c ff         	leaq	-0x737d12(%rip), %rcx   # 0x14a808
  88251a: 31 f6                        	xorl	%esi, %esi
  88251c: ba 64 00 00 00               	movl	$0x64, %edx
  882521: e8 ba 1b 00 00               	callq	0x8840e0 <PyInit_pyo3_async_runtimes+0x1e4850>
  882526: 48 89 df                     	movq	%rbx, %rdi
  882529: e8 52 4f 03 00               	callq	0x8b7480 <PyInit_pyo3_async_runtimes+0x217bf0>
  88252e: 48 83 c4 10                  	addq	$0x10, %rsp
  882532: 31 db                        	xorl	%ebx, %ebx
  882534: 48 89 d8                     	movq	%rbx, %rax
  882537: 5b                           	popq	%rbx
  882538: 5d                           	popq	%rbp
  882539: 41 5c                        	popq	%r12
  88253b: c3                           	retq
  88253c: cc                           	int3
  88253d: cc                           	int3
  88253e: cc                           	int3
  88253f: cc                           	int3
  882540: 55                           	pushq	%rbp
  882541: 48 89 f2                     	movq	%rsi, %rdx
  882544: 48 89 fe                     	movq	%rdi, %rsi
  882547: 53                           	pushq	%rbx
  882548: 48 83 ec 18                  	subq	$0x18, %rsp
  88254c: 48 89 e7                     	movq	%rsp, %rdi
  88254f: e8 cc eb ff ff               	callq	0x881120 <PyInit_pyo3_async_runtimes+0x1e1890>
  882554: 48 89 e7                     	movq	%rsp, %rdi
  882557: e8 44 ff ff ff               	callq	0x8824a0 <PyInit_pyo3_async_runtimes+0x1e2c10>
  88255c: 48 89 c3                     	movq	%rax, %rbx
  88255f: 48 85 c0                     	testq	%rax, %rax
  882562: 74 1c                        	je	0x882580 <PyInit_pyo3_async_runtimes+0x1e2cf0>
  882564: 48 89 e7                     	movq	%rsp, %rdi
  882567: e8 f4 eb ff ff               	callq	0x881160 <PyInit_pyo3_async_runtimes+0x1e18d0>
  88256c: 48 85 c0                     	testq	%rax, %rax
  88256f: 75 0f                        	jne	0x882580 <PyInit_pyo3_async_runtimes+0x1e2cf0>
  882571: 48 83 c4 18                  	addq	$0x18, %rsp
  882575: 48 89 d8                     	movq	%rbx, %rax
  882578: 5b                           	popq	%rbx
  882579: 5d                           	popq	%rbp
  88257a: c3                           	retq
  88257b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  882580: 41 b8 3a 00 00 00            	movl	$0x3a, %r8d
  882586: 48 8d 0d 7b 82 8c ff         	leaq	-0x737d85(%rip), %rcx   # 0x14a808
  88258d: ba 64 00 00 00               	movl	$0x64, %edx
  882592: 31 f6                        	xorl	%esi, %esi
  882594: bf 1a 00 00 00               	movl	$0x1a, %edi
  882599: e8 42 1b 00 00               	callq	0x8840e0 <PyInit_pyo3_async_runtimes+0x1e4850>
  88259e: 48 89 df                     	movq	%rbx, %rdi
  8825a1: 31 db                        	xorl	%ebx, %ebx
  8825a3: e8 d8 4e 03 00               	callq	0x8b7480 <PyInit_pyo3_async_runtimes+0x217bf0>
  8825a8: 48 83 c4 18                  	addq	$0x18, %rsp
  8825ac: 48 89 d8                     	movq	%rbx, %rax
  8825af: 5b                           	popq	%rbx
  8825b0: 5d                           	popq	%rbp
  8825b1: c3                           	retq
  8825b2: cc                           	int3
  8825b3: cc                           	int3
  8825b4: cc                           	int3
  8825b5: cc                           	int3
  8825b6: cc                           	int3
  8825b7: cc                           	int3
  8825b8: cc                           	int3
  8825b9: cc                           	int3
  8825ba: cc                           	int3
  8825bb: cc                           	int3
  8825bc: cc                           	int3
  8825bd: cc                           	int3
  8825be: cc                           	int3
  8825bf: cc                           	int3
  8825c0: 41 54                        	pushq	%r12
  8825c2: ba 10 00 00 20               	movl	$0x20000010, %edx       # imm = 0x20000010
  8825c7: 55                           	pushq	%rbp
  8825c8: 48 89 f5                     	movq	%rsi, %rbp
  8825cb: 53                           	pushq	%rbx
  8825cc: 48 89 fb                     	movq	%rdi, %rbx
  8825cf: 48 83 ec 30                  	subq	$0x30, %rsp
  8825d3: 48 89 e6                     	movq	%rsp, %rsi
  8825d6: e8 05 e8 ff ff               	callq	0x880de0 <PyInit_pyo3_async_runtimes+0x1e1550>
  8825db: 85 c0                        	testl	%eax, %eax
  8825dd: 74 10                        	je	0x8825ef <PyInit_pyo3_async_runtimes+0x1e2d5f>
  8825df: 48 8b 75 00                  	movq	(%rbp), %rsi
  8825e3: 48 89 e7                     	movq	%rsp, %rdi
  8825e6: e8 75 02 00 00               	callq	0x882860 <PyInit_pyo3_async_runtimes+0x1e2fd0>
  8825eb: 85 c0                        	testl	%eax, %eax
  8825ed: 75 31                        	jne	0x882620 <PyInit_pyo3_async_runtimes+0x1e2d90>
  8825ef: 41 b8 47 00 00 00            	movl	$0x47, %r8d
  8825f5: 48 8d 0d 0c 82 8c ff         	leaq	-0x737df4(%rip), %rcx   # 0x14a808
  8825fc: ba 69 00 00 00               	movl	$0x69, %edx
  882601: 31 f6                        	xorl	%esi, %esi
  882603: bf 1a 00 00 00               	movl	$0x1a, %edi
  882608: e8 d3 1a 00 00               	callq	0x8840e0 <PyInit_pyo3_async_runtimes+0x1e4850>
  88260d: 48 83 c4 30                  	addq	$0x30, %rsp
  882611: 31 c0                        	xorl	%eax, %eax
  882613: 5b                           	popq	%rbx
  882614: 5d                           	popq	%rbp
  882615: 41 5c                        	popq	%r12
  882617: c3                           	retq
  882618: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
  882620: 48 8b 75 08                  	movq	0x8(%rbp), %rsi
  882624: 48 89 e7                     	movq	%rsp, %rdi
  882627: e8 34 02 00 00               	callq	0x882860 <PyInit_pyo3_async_runtimes+0x1e2fd0>
  88262c: 85 c0                        	testl	%eax, %eax
  88262e: 74 bf                        	je	0x8825ef <PyInit_pyo3_async_runtimes+0x1e2d5f>
  882630: 48 89 df                     	movq	%rbx, %rdi
  882633: e8 a8 e1 ff ff               	callq	0x8807e0 <PyInit_pyo3_async_runtimes+0x1e0f50>
  882638: 85 c0                        	testl	%eax, %eax
  88263a: 74 b3                        	je	0x8825ef <PyInit_pyo3_async_runtimes+0x1e2d5f>
  88263c: 48 83 c4 30                  	addq	$0x30, %rsp
  882640: b8 01 00 00 00               	movl	$0x1, %eax
  882645: 5b                           	popq	%rbx
  882646: 5d                           	popq	%rbp
  882647: 41 5c                        	popq	%r12
  882649: c3                           	retq
  88264a: cc                           	int3
  88264b: cc                           	int3
  88264c: cc                           	int3
  88264d: cc                           	int3
  88264e: cc                           	int3
  88264f: cc                           	int3
  882650: 41 55                        	pushq	%r13
  882652: 49 89 f5                     	movq	%rsi, %r13
  882655: 41 54                        	pushq	%r12
  882657: 49 89 fc                     	movq	%rdi, %r12
  88265a: 55                           	pushq	%rbp
  88265b: 48 89 d5                     	movq	%rdx, %rbp
  88265e: 53                           	pushq	%rbx
  88265f: 48 83 ec 38                  	subq	$0x38, %rsp
  882663: 48 89 e7                     	movq	%rsp, %rdi
  882666: 48 89 e3                     	movq	%rsp, %rbx
  882669: e8 72 e0 ff ff               	callq	0x8806e0 <PyInit_pyo3_async_runtimes+0x1e0e50>
  88266e: 31 f6                        	xorl	%esi, %esi
  882670: 48 89 e7                     	movq	%rsp, %rdi
  882673: e8 78 e0 ff ff               	callq	0x8806f0 <PyInit_pyo3_async_runtimes+0x1e0e60>
  882678: 85 c0                        	testl	%eax, %eax
  88267a: 74 0f                        	je	0x88268b <PyInit_pyo3_async_runtimes+0x1e2dfb>
  88267c: 48 89 ee                     	movq	%rbp, %rsi
  88267f: 48 89 e7                     	movq	%rsp, %rdi
