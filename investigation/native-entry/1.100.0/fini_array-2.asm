
<native-member>:	file format elf64-x86-64

Disassembly of section .text:

000000000069f890 <PyInit_pyo3_async_runtimes>:
  8d13d0: 55                           	pushq	%rbp
  8d13d1: 48 8d 2d 48 9c 22 00         	leaq	0x229c48(%rip), %rbp    # 0xafb020
  8d13d8: 53                           	pushq	%rbx
  8d13d9: 48 89 ef                     	movq	%rbp, %rdi
  8d13dc: 48 83 ec 08                  	subq	$0x8, %rsp
  8d13e0: e8 fb 10 03 00               	callq	0x9024e0 <PyInit_pyo3_async_runtimes+0x262c50>
  8d13e5: 48 8b 1d 74 9c 22 00         	movq	0x229c74(%rip), %rbx    # 0xafb060
  8d13ec: 48 85 db                     	testq	%rbx, %rbx
  8d13ef: 74 28                        	je	0x8d1419 <PyInit_pyo3_async_runtimes+0x231b89>
  8d13f1: 80 3b 01                     	cmpb	$0x1, (%rbx)
  8d13f4: 0f 85 c5 ff ff ff            	jne	0x8d13bf <PyInit_pyo3_async_runtimes+0x231b2f>
  8d13fa: 48 8b bb 48 01 00 00         	movq	0x148(%rbx), %rdi
  8d1401: e8 94 7b 1a 00               	callq	0xa78f9a <PyInit_pyo3_async_runtimes+0x3d970a>
  8d1406: 48 89 df                     	movq	%rbx, %rdi
  8d1409: e8 22 aa 02 00               	callq	0x8fbe30 <PyInit_pyo3_async_runtimes+0x25c5a0>
  8d140e: 48 c7 05 47 9c 22 00 00 00 00 00     	movq	$0x0, 0x229c47(%rip) # 0xafb060
  8d1419: 48 83 c4 08                  	addq	$0x8, %rsp
  8d141d: 48 89 ef                     	movq	%rbp, %rdi
  8d1420: 5b                           	popq	%rbx
  8d1421: 5d                           	popq	%rbp
  8d1422: e9 f9 10 03 00               	jmp	0x902520 <PyInit_pyo3_async_runtimes+0x262c90>
  8d1427: cc                           	int3
  8d1428: cc                           	int3
  8d1429: cc                           	int3
  8d142a: cc                           	int3
  8d142b: cc                           	int3
  8d142c: cc                           	int3
  8d142d: cc                           	int3
  8d142e: cc                           	int3
  8d142f: cc                           	int3
  8d1430: 48 85 ff                     	testq	%rdi, %rdi
  8d1433: 74 23                        	je	0x8d1458 <PyInit_pyo3_async_runtimes+0x231bc8>
  8d1435: 53                           	pushq	%rbx
  8d1436: 48 89 fb                     	movq	%rdi, %rbx
  8d1439: 48 8b 3f                     	movq	(%rdi), %rdi
  8d143c: e8 4f 0a fc ff               	callq	0x891e90 <PyInit_pyo3_async_runtimes+0x1f2600>
  8d1441: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  8d1445: e8 46 0a fc ff               	callq	0x891e90 <PyInit_pyo3_async_runtimes+0x1f2600>
  8d144a: 48 89 df                     	movq	%rbx, %rdi
  8d144d: 5b                           	popq	%rbx
  8d144e: e9 dd a9 02 00               	jmp	0x8fbe30 <PyInit_pyo3_async_runtimes+0x25c5a0>
  8d1453: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  8d1458: c3                           	retq
  8d1459: cc                           	int3
  8d145a: cc                           	int3
  8d145b: cc                           	int3
  8d145c: cc                           	int3
  8d145d: cc                           	int3
  8d145e: cc                           	int3
  8d145f: cc                           	int3
  8d1460: 53                           	pushq	%rbx
  8d1461: bf 18 00 00 00               	movl	$0x18, %edi
  8d1466: e8 25 a9 02 00               	callq	0x8fbd90 <PyInit_pyo3_async_runtimes+0x25c500>
  8d146b: 48 85 c0                     	testq	%rax, %rax
  8d146e: 74 38                        	je	0x8d14a8 <PyInit_pyo3_async_runtimes+0x231c18>
  8d1470: 48 89 c3                     	movq	%rax, %rbx
  8d1473: e8 88 82 fd ff               	callq	0x8a9700 <PyInit_pyo3_async_runtimes+0x209e70>
  8d1478: 48 89 03                     	movq	%rax, (%rbx)
  8d147b: 48 85 c0                     	testq	%rax, %rax
  8d147e: 74 20                        	je	0x8d14a0 <PyInit_pyo3_async_runtimes+0x231c10>
  8d1480: e8 7b 82 fd ff               	callq	0x8a9700 <PyInit_pyo3_async_runtimes+0x209e70>
  8d1485: 48 89 43 08                  	movq	%rax, 0x8(%rbx)
  8d1489: 48 85 c0                     	testq	%rax, %rax
  8d148c: 74 12                        	je	0x8d14a0 <PyInit_pyo3_async_runtimes+0x231c10>
  8d148e: 48 89 d8                     	movq	%rbx, %rax
  8d1491: c7 43 10 1f 00 00 00         	movl	$0x1f, 0x10(%rbx)
  8d1498: 5b                           	popq	%rbx
  8d1499: c3                           	retq
  8d149a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  8d14a0: 48 89 df                     	movq	%rbx, %rdi
  8d14a3: e8 88 ff ff ff               	callq	0x8d1430 <PyInit_pyo3_async_runtimes+0x231ba0>
  8d14a8: 31 db                        	xorl	%ebx, %ebx
  8d14aa: 48 89 d8                     	movq	%rbx, %rax
  8d14ad: 5b                           	popq	%rbx
  8d14ae: c3                           	retq
  8d14af: cc                           	int3
  8d14b0: c7 47 10 1f 00 00 00         	movl	$0x1f, 0x10(%rdi)
  8d14b7: c3                           	retq
  8d14b8: cc                           	int3
  8d14b9: cc                           	int3
  8d14ba: cc                           	int3
  8d14bb: cc                           	int3
  8d14bc: cc                           	int3
  8d14bd: cc                           	int3
  8d14be: cc                           	int3
  8d14bf: cc                           	int3
  8d14c0: 41 57                        	pushq	%r15
  8d14c2: 41 56                        	pushq	%r14
  8d14c4: 41 55                        	pushq	%r13
  8d14c6: 49 89 fd                     	movq	%rdi, %r13
  8d14c9: 41 54                        	pushq	%r12
  8d14cb: 4d 89 c4                     	movq	%r8, %r12
  8d14ce: 55                           	pushq	%rbp
  8d14cf: 48 89 cd                     	movq	%rcx, %rbp
  8d14d2: 53                           	pushq	%rbx
  8d14d3: 48 89 f3                     	movq	%rsi, %rbx
  8d14d6: 48 83 ec 18                  	subq	$0x18, %rsp
  8d14da: 8b 46 10                     	movl	0x10(%rsi), %eax
  8d14dd: 48 8b 3e                     	movq	(%rsi), %rdi
  8d14e0: 83 c0 01                     	addl	$0x1, %eax
  8d14e3: 89 46 10                     	movl	%eax, 0x10(%rsi)
  8d14e6: 83 f8 20                     	cmpl	$0x20, %eax
  8d14e9: 74 75                        	je	0x8d1560 <PyInit_pyo3_async_runtimes+0x231cd0>
  8d14eb: 48 89 fa                     	movq	%rdi, %rdx
  8d14ee: 48 89 fe                     	movq	%rdi, %rsi
  8d14f1: e8 5a d0 fd ff               	callq	0x8ae550 <PyInit_pyo3_async_runtimes+0x20ecc0>
  8d14f6: 85 c0                        	testl	%eax, %eax
  8d14f8: 75 1e                        	jne	0x8d1518 <PyInit_pyo3_async_runtimes+0x231c88>
  8d14fa: c7 43 10 1f 00 00 00         	movl	$0x1f, 0x10(%rbx)
  8d1501: 48 83 c4 18                  	addq	$0x18, %rsp
  8d1505: 31 c0                        	xorl	%eax, %eax
  8d1507: 5b                           	popq	%rbx
  8d1508: 5d                           	popq	%rbp
  8d1509: 41 5c                        	popq	%r12
  8d150b: 41 5d                        	popq	%r13
  8d150d: 41 5e                        	popq	%r14
  8d150f: 41 5f                        	popq	%r15
  8d1511: c3                           	retq
  8d1512: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  8d1518: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  8d151c: 4d 89 e0                     	movq	%r12, %r8
  8d151f: 48 89 e9                     	movq	%rbp, %rcx
  8d1522: 48 89 fa                     	movq	%rdi, %rdx
  8d1525: 48 89 fe                     	movq	%rdi, %rsi
  8d1528: e8 23 d0 fd ff               	callq	0x8ae550 <PyInit_pyo3_async_runtimes+0x20ecc0>
  8d152d: 85 c0                        	testl	%eax, %eax
  8d152f: 74 c9                        	je	0x8d14fa <PyInit_pyo3_async_runtimes+0x231c6a>
  8d1531: 48 8b 13                     	movq	(%rbx), %rdx
  8d1534: 4d 89 e0                     	movq	%r12, %r8
  8d1537: 48 89 e9                     	movq	%rbp, %rcx
  8d153a: 4c 89 ee                     	movq	%r13, %rsi
  8d153d: 4c 89 ef                     	movq	%r13, %rdi
  8d1540: e8 0b d0 fd ff               	callq	0x8ae550 <PyInit_pyo3_async_runtimes+0x20ecc0>
  8d1545: 85 c0                        	testl	%eax, %eax
  8d1547: 0f 95 c0                     	setne	%al
  8d154a: 48 83 c4 18                  	addq	$0x18, %rsp
  8d154e: 5b                           	popq	%rbx
  8d154f: 0f b6 c0                     	movzbl	%al, %eax
  8d1552: 5d                           	popq	%rbp
  8d1553: 41 5c                        	popq	%r12
  8d1555: 41 5d                        	popq	%r13
  8d1557: 41 5e                        	popq	%r14
  8d1559: 41 5f                        	popq	%r15
  8d155b: c3                           	retq
  8d155c: 0f 1f 40 00                  	nopl	(%rax)
  8d1560: 4c 8d 79 18                  	leaq	0x18(%rcx), %r15
  8d1564: 49 89 d6                     	movq	%rdx, %r14
  8d1567: be 01 00 00 00               	movl	$0x1, %esi
  8d156c: 4c 89 fa                     	movq	%r15, %rdx
  8d156f: e8 9c cd ff ff               	callq	0x8ce310 <PyInit_pyo3_async_runtimes+0x22ea80>
  8d1574: 85 c0                        	testl	%eax, %eax
  8d1576: 74 16                        	je	0x8d158e <PyInit_pyo3_async_runtimes+0x231cfe>
  8d1578: 48 8b 33                     	movq	(%rbx), %rsi
  8d157b: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  8d157f: 4c 89 e1                     	movq	%r12, %rcx
  8d1582: 48 89 ea                     	movq	%rbp, %rdx
  8d1585: e8 e6 bd fd ff               	callq	0x8ad370 <PyInit_pyo3_async_runtimes+0x20dae0>
  8d158a: 85 c0                        	testl	%eax, %eax
  8d158c: 75 2a                        	jne	0x8d15b8 <PyInit_pyo3_async_runtimes+0x231d28>
  8d158e: 41 b8 84 00 00 00            	movl	$0x84, %r8d
  8d1594: 48 8d 0d 6d 9e 87 ff         	leaq	-0x786193(%rip), %rcx   # 0x14b408
  8d159b: ba 44 00 00 00               	movl	$0x44, %edx
  8d15a0: 31 f6                        	xorl	%esi, %esi
  8d15a2: bf 04 00 00 00               	movl	$0x4, %edi
  8d15a7: e8 34 2b fb ff               	callq	0x8840e0 <PyInit_pyo3_async_runtimes+0x1e4850>
  8d15ac: e9 49 ff ff ff               	jmp	0x8d14fa <PyInit_pyo3_async_runtimes+0x231c6a>
  8d15b1: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  8d15b8: 48 8b 7b 08                  	movq	0x8(%rbx), %rdi
  8d15bc: 48 8d 74 24 0c               	leaq	0xc(%rsp), %rsi
  8d15c1: 4d 89 e0                     	movq	%r12, %r8
  8d15c4: 48 89 e9                     	movq	%rbp, %rcx
  8d15c7: 48 89 fa                     	movq	%rdi, %rdx
  8d15ca: e8 a1 cd ff ff               	callq	0x8ce370 <PyInit_pyo3_async_runtimes+0x22eae0>
  8d15cf: 85 c0                        	testl	%eax, %eax
