
<native-member>:	file format elf64-x86-64

Disassembly of section .plt:

0000000000abb190 <.plt>:
  abb190: ff 35 6a a2 03 00            	pushq	0x3a26a(%rip)           # 0xaf5400
  abb196: ff 25 6c a2 03 00            	jmpq	*0x3a26c(%rip)          # 0xaf5408
  abb19c: 0f 1f 40 00                  	nopl	(%rax)

0000000000abb1a0 <__cxa_finalize@plt>:
  abb1a0: ff 25 6a a2 03 00            	jmpq	*0x3a26a(%rip)          # 0xaf5410 ; ELF relocation: __cxa_finalize
  abb1a6: 68 00 00 00 00               	pushq	$0x0
  abb1ab: e9 e0 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb1b0 <malloc@plt>:
  abb1b0: ff 25 62 a2 03 00            	jmpq	*0x3a262(%rip)          # 0xaf5418 ; ELF relocation: malloc
  abb1b6: 68 01 00 00 00               	pushq	$0x1
  abb1bb: e9 d0 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb1c0 <memcpy@plt>:
  abb1c0: ff 25 5a a2 03 00            	jmpq	*0x3a25a(%rip)          # 0xaf5420 ; ELF relocation: memcpy
  abb1c6: 68 02 00 00 00               	pushq	$0x2
  abb1cb: e9 c0 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb1d0 <_Unwind_Resume@plt>:
  abb1d0: ff 25 52 a2 03 00            	jmpq	*0x3a252(%rip)          # 0xaf5428 ; ELF relocation: _Unwind_Resume
  abb1d6: 68 03 00 00 00               	pushq	$0x3
  abb1db: e9 b0 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb1e0 <free@plt>:
  abb1e0: ff 25 4a a2 03 00            	jmpq	*0x3a24a(%rip)          # 0xaf5430 ; ELF relocation: free
  abb1e6: 68 04 00 00 00               	pushq	$0x4
  abb1eb: e9 a0 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb1f0 <memmove@plt>:
  abb1f0: ff 25 42 a2 03 00            	jmpq	*0x3a242(%rip)          # 0xaf5438 ; ELF relocation: memmove
  abb1f6: 68 05 00 00 00               	pushq	$0x5
  abb1fb: e9 90 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb200 <__tls_get_addr@plt>:
  abb200: ff 25 3a a2 03 00            	jmpq	*0x3a23a(%rip)          # 0xaf5440 ; ELF relocation: __tls_get_addr
  abb206: 68 06 00 00 00               	pushq	$0x6
  abb20b: e9 80 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb210 <close@plt>:
  abb210: ff 25 32 a2 03 00            	jmpq	*0x3a232(%rip)          # 0xaf5448 ; ELF relocation: close
  abb216: 68 07 00 00 00               	pushq	$0x7
  abb21b: e9 70 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb220 <syscall@plt>:
  abb220: ff 25 2a a2 03 00            	jmpq	*0x3a22a(%rip)          # 0xaf5450 ; ELF relocation: syscall
  abb226: 68 08 00 00 00               	pushq	$0x8
  abb22b: e9 60 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb230 <__errno_location@plt>:
  abb230: ff 25 22 a2 03 00            	jmpq	*0x3a222(%rip)          # 0xaf5458 ; ELF relocation: __errno_location
  abb236: 68 09 00 00 00               	pushq	$0x9
  abb23b: e9 50 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb240 <calloc@plt>:
  abb240: ff 25 1a a2 03 00            	jmpq	*0x3a21a(%rip)          # 0xaf5460 ; ELF relocation: calloc
  abb246: 68 0a 00 00 00               	pushq	$0xa
  abb24b: e9 40 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb250 <memset@plt>:
  abb250: ff 25 12 a2 03 00            	jmpq	*0x3a212(%rip)          # 0xaf5468 ; ELF relocation: memset
  abb256: 68 0b 00 00 00               	pushq	$0xb
  abb25b: e9 30 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb260 <fcntl@plt>:
  abb260: ff 25 0a a2 03 00            	jmpq	*0x3a20a(%rip)          # 0xaf5470 ; ELF relocation: fcntl
  abb266: 68 0c 00 00 00               	pushq	$0xc
  abb26b: e9 20 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb270 <pthread_mutex_lock@plt>:
  abb270: ff 25 02 a2 03 00            	jmpq	*0x3a202(%rip)          # 0xaf5478 ; ELF relocation: pthread_mutex_lock
  abb276: 68 0d 00 00 00               	pushq	$0xd
  abb27b: e9 10 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb280 <pthread_mutex_unlock@plt>:
  abb280: ff 25 fa a1 03 00            	jmpq	*0x3a1fa(%rip)          # 0xaf5480 ; ELF relocation: pthread_mutex_unlock
  abb286: 68 0e 00 00 00               	pushq	$0xe
  abb28b: e9 00 ff ff ff               	jmp	0xabb190 <.plt>

0000000000abb290 <read@plt>:
  abb290: ff 25 f2 a1 03 00            	jmpq	*0x3a1f2(%rip)          # 0xaf5488 ; ELF relocation: read
  abb296: 68 0f 00 00 00               	pushq	$0xf
  abb29b: e9 f0 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb2a0 <open@plt>:
  abb2a0: ff 25 ea a1 03 00            	jmpq	*0x3a1ea(%rip)          # 0xaf5490 ; ELF relocation: open
  abb2a6: 68 10 00 00 00               	pushq	$0x10
  abb2ab: e9 e0 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb2b0 <munmap@plt>:
  abb2b0: ff 25 e2 a1 03 00            	jmpq	*0x3a1e2(%rip)          # 0xaf5498 ; ELF relocation: munmap
  abb2b6: 68 11 00 00 00               	pushq	$0x11
  abb2bb: e9 d0 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb2c0 <pthread_setspecific@plt>:
  abb2c0: ff 25 da a1 03 00            	jmpq	*0x3a1da(%rip)          # 0xaf54a0 ; ELF relocation: pthread_setspecific
  abb2c6: 68 12 00 00 00               	pushq	$0x12
  abb2cb: e9 c0 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb2d0 <pthread_key_create@plt>:
  abb2d0: ff 25 d2 a1 03 00            	jmpq	*0x3a1d2(%rip)          # 0xaf54a8 ; ELF relocation: pthread_key_create
  abb2d6: 68 13 00 00 00               	pushq	$0x13
  abb2db: e9 b0 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb2e0 <getenv@plt>:
  abb2e0: ff 25 ca a1 03 00            	jmpq	*0x3a1ca(%rip)          # 0xaf54b0 ; ELF relocation: getenv
  abb2e6: 68 14 00 00 00               	pushq	$0x14
  abb2eb: e9 a0 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb2f0 <abort@plt>:
  abb2f0: ff 25 c2 a1 03 00            	jmpq	*0x3a1c2(%rip)          # 0xaf54b8 ; ELF relocation: abort
  abb2f6: 68 15 00 00 00               	pushq	$0x15
  abb2fb: e9 90 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb300 <sysconf@plt>:
  abb300: ff 25 ba a1 03 00            	jmpq	*0x3a1ba(%rip)          # 0xaf54c0 ; ELF relocation: sysconf
  abb306: 68 16 00 00 00               	pushq	$0x16
  abb30b: e9 80 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb310 <__assert_fail@plt>:
  abb310: ff 25 b2 a1 03 00            	jmpq	*0x3a1b2(%rip)          # 0xaf54c8 ; ELF relocation: __assert_fail
  abb316: 68 17 00 00 00               	pushq	$0x17
  abb31b: e9 70 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb320 <memchr@plt>:
  abb320: ff 25 aa a1 03 00            	jmpq	*0x3a1aa(%rip)          # 0xaf54d0 ; ELF relocation: memchr
  abb326: 68 18 00 00 00               	pushq	$0x18
  abb32b: e9 60 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb330 <fwrite@plt>:
  abb330: ff 25 a2 a1 03 00            	jmpq	*0x3a1a2(%rip)          # 0xaf54d8 ; ELF relocation: fwrite
  abb336: 68 19 00 00 00               	pushq	$0x19
  abb33b: e9 50 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb340 <strchr@plt>:
  abb340: ff 25 9a a1 03 00            	jmpq	*0x3a19a(%rip)          # 0xaf54e0 ; ELF relocation: strchr
  abb346: 68 1a 00 00 00               	pushq	$0x1a
  abb34b: e9 40 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb350 <vsnprintf@plt>:
  abb350: ff 25 92 a1 03 00            	jmpq	*0x3a192(%rip)          # 0xaf54e8 ; ELF relocation: vsnprintf
  abb356: 68 1b 00 00 00               	pushq	$0x1b
  abb35b: e9 30 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb360 <strcmp@plt>:
  abb360: ff 25 8a a1 03 00            	jmpq	*0x3a18a(%rip)          # 0xaf54f0 ; ELF relocation: strcmp
  abb366: 68 1c 00 00 00               	pushq	$0x1c
  abb36b: e9 20 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb370 <strtol@plt>:
  abb370: ff 25 82 a1 03 00            	jmpq	*0x3a182(%rip)          # 0xaf54f8 ; ELF relocation: strtol
  abb376: 68 1d 00 00 00               	pushq	$0x1d
  abb37b: e9 10 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb380 <sscanf@plt>:
  abb380: ff 25 7a a1 03 00            	jmpq	*0x3a17a(%rip)          # 0xaf5500 ; ELF relocation: sscanf
  abb386: 68 1e 00 00 00               	pushq	$0x1e
  abb38b: e9 00 fe ff ff               	jmp	0xabb190 <.plt>

0000000000abb390 <fprintf@plt>:
  abb390: ff 25 72 a1 03 00            	jmpq	*0x3a172(%rip)          # 0xaf5508 ; ELF relocation: fprintf
  abb396: 68 1f 00 00 00               	pushq	$0x1f
  abb39b: e9 f0 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb3a0 <OPENSSL_memory_alloc@plt>:
  abb3a0: ff 25 6a a1 03 00            	jmpq	*0x3a16a(%rip)          # 0xaf5510 ; ELF relocation: OPENSSL_memory_alloc
  abb3a6: 68 20 00 00 00               	pushq	$0x20
  abb3ab: e9 e0 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb3b0 <OPENSSL_memory_realloc@plt>:
  abb3b0: ff 25 62 a1 03 00            	jmpq	*0x3a162(%rip)          # 0xaf5518 ; ELF relocation: OPENSSL_memory_realloc
  abb3b6: 68 21 00 00 00               	pushq	$0x21
  abb3bb: e9 d0 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb3c0 <OPENSSL_memory_free@plt>:
  abb3c0: ff 25 5a a1 03 00            	jmpq	*0x3a15a(%rip)          # 0xaf5520 ; ELF relocation: OPENSSL_memory_free
  abb3c6: 68 22 00 00 00               	pushq	$0x22
  abb3cb: e9 c0 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb3d0 <OPENSSL_memory_get_size@plt>:
  abb3d0: ff 25 52 a1 03 00            	jmpq	*0x3a152(%rip)          # 0xaf5528 ; ELF relocation: OPENSSL_memory_get_size
  abb3d6: 68 23 00 00 00               	pushq	$0x23
  abb3db: e9 b0 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb3e0 <sdallocx@plt>:
  abb3e0: ff 25 4a a1 03 00            	jmpq	*0x3a14a(%rip)          # 0xaf5530 ; ELF relocation: sdallocx
  abb3e6: 68 24 00 00 00               	pushq	$0x24
  abb3eb: e9 a0 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb3f0 <nanosleep@plt>:
  abb3f0: ff 25 42 a1 03 00            	jmpq	*0x3a142(%rip)          # 0xaf5538 ; ELF relocation: nanosleep
  abb3f6: 68 25 00 00 00               	pushq	$0x25
  abb3fb: e9 90 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb400 <perror@plt>:
  abb400: ff 25 3a a1 03 00            	jmpq	*0x3a13a(%rip)          # 0xaf5540 ; ELF relocation: perror
  abb406: 68 26 00 00 00               	pushq	$0x26
  abb40b: e9 80 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb410 <ioctl@plt>:
  abb410: ff 25 32 a1 03 00            	jmpq	*0x3a132(%rip)          # 0xaf5548 ; ELF relocation: ioctl
  abb416: 68 27 00 00 00               	pushq	$0x27
  abb41b: e9 70 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb420 <getauxval@plt>:
  abb420: ff 25 2a a1 03 00            	jmpq	*0x3a12a(%rip)          # 0xaf5550 ; ELF relocation: getauxval
  abb426: 68 28 00 00 00               	pushq	$0x28
  abb42b: e9 60 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb430 <pthread_rwlock_init@plt>:
  abb430: ff 25 22 a1 03 00            	jmpq	*0x3a122(%rip)          # 0xaf5558 ; ELF relocation: pthread_rwlock_init
  abb436: 68 29 00 00 00               	pushq	$0x29
  abb43b: e9 50 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb440 <pthread_rwlock_rdlock@plt>:
  abb440: ff 25 1a a1 03 00            	jmpq	*0x3a11a(%rip)          # 0xaf5560 ; ELF relocation: pthread_rwlock_rdlock
  abb446: 68 2a 00 00 00               	pushq	$0x2a
  abb44b: e9 40 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb450 <pthread_rwlock_wrlock@plt>:
  abb450: ff 25 12 a1 03 00            	jmpq	*0x3a112(%rip)          # 0xaf5568 ; ELF relocation: pthread_rwlock_wrlock
  abb456: 68 2b 00 00 00               	pushq	$0x2b
  abb45b: e9 30 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb460 <pthread_rwlock_unlock@plt>:
  abb460: ff 25 0a a1 03 00            	jmpq	*0x3a10a(%rip)          # 0xaf5570 ; ELF relocation: pthread_rwlock_unlock
  abb466: 68 2c 00 00 00               	pushq	$0x2c
  abb46b: e9 20 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb470 <pthread_rwlock_destroy@plt>:
  abb470: ff 25 02 a1 03 00            	jmpq	*0x3a102(%rip)          # 0xaf5578 ; ELF relocation: pthread_rwlock_destroy
  abb476: 68 2d 00 00 00               	pushq	$0x2d
  abb47b: e9 10 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb480 <pthread_once@plt>:
  abb480: ff 25 fa a0 03 00            	jmpq	*0x3a0fa(%rip)          # 0xaf5580 ; ELF relocation: pthread_once
  abb486: 68 2e 00 00 00               	pushq	$0x2e
  abb48b: e9 00 fd ff ff               	jmp	0xabb190 <.plt>

0000000000abb490 <pthread_getspecific@plt>:
  abb490: ff 25 f2 a0 03 00            	jmpq	*0x3a0f2(%rip)          # 0xaf5588 ; ELF relocation: pthread_getspecific
  abb496: 68 2f 00 00 00               	pushq	$0x2f
  abb49b: e9 f0 fc ff ff               	jmp	0xabb190 <.plt>

0000000000abb4a0 <mmap@plt>:
  abb4a0: ff 25 ea a0 03 00            	jmpq	*0x3a0ea(%rip)          # 0xaf5590 ; ELF relocation: mmap
  abb4a6: 68 30 00 00 00               	pushq	$0x30
  abb4ab: e9 e0 fc ff ff               	jmp	0xabb190 <.plt>

0000000000abb4b0 <madvise@plt>:
  abb4b0: ff 25 e2 a0 03 00            	jmpq	*0x3a0e2(%rip)          # 0xaf5598 ; ELF relocation: madvise
  abb4b6: 68 31 00 00 00               	pushq	$0x31
  abb4bb: e9 d0 fc ff ff               	jmp	0xabb190 <.plt>

0000000000abb4c0 <__xstat@plt>:
  abb4c0: ff 25 da a0 03 00            	jmpq	*0x3a0da(%rip)          # 0xaf55a0 ; ELF relocation: __xstat
  abb4c6: 68 32 00 00 00               	pushq	$0x32
  abb4cb: e9 c0 fc ff ff               	jmp	0xabb190 <.plt>

0000000000abb4d0 <__register_atfork@plt>:
  abb4d0: ff 25 d2 a0 03 00            	jmpq	*0x3a0d2(%rip)          # 0xaf55a8 ; ELF relocation: __register_atfork
  abb4d6: 68 33 00 00 00               	pushq	$0x33
  abb4db: e9 b0 fc ff ff               	jmp	0xabb190 <.plt>

0000000000abb4e0 <__fxstat64@plt>:
  abb4e0: ff 25 ca a0 03 00            	jmpq	*0x3a0ca(%rip)          # 0xaf55b0 ; ELF relocation: __fxstat64
  abb4e6: 68 34 00 00 00               	pushq	$0x34
  abb4eb: e9 a0 fc ff ff               	jmp	0xabb190 <.plt>

0000000000abb4f0 <__xstat64@plt>:
  abb4f0: ff 25 c2 a0 03 00            	jmpq	*0x3a0c2(%rip)          # 0xaf55b8 ; ELF relocation: __xstat64
  abb4f6: 68 35 00 00 00               	pushq	$0x35
  abb4fb: e9 90 fc ff ff               	jmp	0xabb190 <.plt>
