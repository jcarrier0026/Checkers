
mytest:     file format elf64-x86-64


Disassembly of section .init:

00000000004003b0 <_init>:
  4003b0:	48 83 ec 08          	sub    rsp,0x8
  4003b4:	48 8b 05 3d 0c 20 00 	mov    rax,QWORD PTR [rip+0x200c3d]        # 600ff8 <__gmon_start__>
  4003bb:	48 85 c0             	test   rax,rax
  4003be:	74 02                	je     4003c2 <_init+0x12>
  4003c0:	ff d0                	call   rax
  4003c2:	48 83 c4 08          	add    rsp,0x8
  4003c6:	c3                   	ret    

Disassembly of section .text:

00000000004003d0 <_start>:
  4003d0:	31 ed                	xor    ebp,ebp
  4003d2:	49 89 d1             	mov    r9,rdx
  4003d5:	5e                   	pop    rsi
  4003d6:	48 89 e2             	mov    rdx,rsp
  4003d9:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  4003dd:	50                   	push   rax
  4003de:	54                   	push   rsp
  4003df:	49 c7 c0 20 0a 40 00 	mov    r8,0x400a20
  4003e6:	48 c7 c1 b0 09 40 00 	mov    rcx,0x4009b0
  4003ed:	48 c7 c7 b7 04 40 00 	mov    rdi,0x4004b7
  4003f4:	ff 15 f6 0b 20 00    	call   QWORD PTR [rip+0x200bf6]        # 600ff0 <__libc_start_main@GLIBC_2.2.5>
  4003fa:	f4                   	hlt    
  4003fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000400400 <_dl_relocate_static_pie>:
  400400:	f3 c3                	repz ret 
  400402:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  400409:	00 00 00 
  40040c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000400410 <deregister_tm_clones>:
  400410:	55                   	push   rbp
  400411:	b8 b0 10 60 00       	mov    eax,0x6010b0
  400416:	48 3d b0 10 60 00    	cmp    rax,0x6010b0
  40041c:	48 89 e5             	mov    rbp,rsp
  40041f:	74 17                	je     400438 <deregister_tm_clones+0x28>
  400421:	b8 00 00 00 00       	mov    eax,0x0
  400426:	48 85 c0             	test   rax,rax
  400429:	74 0d                	je     400438 <deregister_tm_clones+0x28>
  40042b:	5d                   	pop    rbp
  40042c:	bf b0 10 60 00       	mov    edi,0x6010b0
  400431:	ff e0                	jmp    rax
  400433:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400438:	5d                   	pop    rbp
  400439:	c3                   	ret    
  40043a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000400440 <register_tm_clones>:
  400440:	be b0 10 60 00       	mov    esi,0x6010b0
  400445:	55                   	push   rbp
  400446:	48 81 ee b0 10 60 00 	sub    rsi,0x6010b0
  40044d:	48 89 e5             	mov    rbp,rsp
  400450:	48 c1 fe 03          	sar    rsi,0x3
  400454:	48 89 f0             	mov    rax,rsi
  400457:	48 c1 e8 3f          	shr    rax,0x3f
  40045b:	48 01 c6             	add    rsi,rax
  40045e:	48 d1 fe             	sar    rsi,1
  400461:	74 15                	je     400478 <register_tm_clones+0x38>
  400463:	b8 00 00 00 00       	mov    eax,0x0
  400468:	48 85 c0             	test   rax,rax
  40046b:	74 0b                	je     400478 <register_tm_clones+0x38>
  40046d:	5d                   	pop    rbp
  40046e:	bf b0 10 60 00       	mov    edi,0x6010b0
  400473:	ff e0                	jmp    rax
  400475:	0f 1f 00             	nop    DWORD PTR [rax]
  400478:	5d                   	pop    rbp
  400479:	c3                   	ret    
  40047a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000400480 <__do_global_dtors_aux>:
  400480:	80 3d 25 0c 20 00 00 	cmp    BYTE PTR [rip+0x200c25],0x0        # 6010ac <completed.7698>
  400487:	75 17                	jne    4004a0 <__do_global_dtors_aux+0x20>
  400489:	55                   	push   rbp
  40048a:	48 89 e5             	mov    rbp,rsp
  40048d:	e8 7e ff ff ff       	call   400410 <deregister_tm_clones>
  400492:	c6 05 13 0c 20 00 01 	mov    BYTE PTR [rip+0x200c13],0x1        # 6010ac <completed.7698>
  400499:	5d                   	pop    rbp
  40049a:	c3                   	ret    
  40049b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4004a0:	f3 c3                	repz ret 
  4004a2:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4004a6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  4004ad:	00 00 00 

00000000004004b0 <frame_dummy>:
  4004b0:	55                   	push   rbp
  4004b1:	48 89 e5             	mov    rbp,rsp
  4004b4:	5d                   	pop    rbp
  4004b5:	eb 89                	jmp    400440 <register_tm_clones>

00000000004004b7 <main>:
  4004b7:	55                   	push   rbp
  4004b8:	48 89 e5             	mov    rbp,rsp
  4004bb:	b9 03 00 00 00       	mov    ecx,0x3
  4004c0:	ba 01 00 00 00       	mov    edx,0x1
  4004c5:	be 02 00 00 00       	mov    esi,0x2
  4004ca:	bf 00 00 00 00       	mov    edi,0x0
  4004cf:	e8 8d 00 00 00       	call   400561 <movePiece>
  4004d4:	b8 00 00 00 00       	mov    eax,0x0
  4004d9:	5d                   	pop    rbp
  4004da:	c3                   	ret    
  4004db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004004e0 <outputBoard>:
  4004e0:	b8 02 00 00 00       	mov    eax,0x2
  4004e5:	48 bf 68 10 60 00 00 	movabs rdi,0x601068
  4004ec:	00 00 00 
  4004ef:	be 41 00 00 00       	mov    esi,0x41
  4004f4:	ba a4 01 00 00       	mov    edx,0x1a4
  4004f9:	0f 05                	syscall 
  4004fb:	48 89 05 22 0c 20 00 	mov    QWORD PTR [rip+0x200c22],rax        # 601124 <fileDescriptor>
  400502:	48 31 c9             	xor    rcx,rcx

0000000000400505 <FOR_outB>:
  400505:	48 83 f9 20          	cmp    rcx,0x20
  400509:	7c 02                	jl     40050d <DOFOR_outB>
  40050b:	eb 14                	jmp    400521 <ENDFOR_outB>

000000000040050d <DOFOR_outB>:
  40050d:	48 8b 99 79 10 60 00 	mov    rbx,QWORD PTR [rcx+0x601079]
  400514:	51                   	push   rcx
  400515:	e8 16 00 00 00       	call   400530 <outputRow>
  40051a:	59                   	pop    rcx
  40051b:	48 83 c1 04          	add    rcx,0x4
  40051f:	eb e4                	jmp    400505 <FOR_outB>

0000000000400521 <ENDFOR_outB>:
  400521:	b8 03 00 00 00       	mov    eax,0x3
  400526:	48 8b 3d f7 0b 20 00 	mov    rdi,QWORD PTR [rip+0x200bf7]        # 601124 <fileDescriptor>
  40052d:	0f 05                	syscall 
  40052f:	c3                   	ret    

0000000000400530 <outputRow>:
  400530:	48 31 c9             	xor    rcx,rcx

0000000000400533 <FOR_outR>:
  400533:	48 83 f9 08          	cmp    rcx,0x8
  400537:	7c 02                	jl     40053b <DOFOR_outR>
  400539:	eb 25                	jmp    400560 <ENDFOR_outR>

000000000040053b <DOFOR_outR>:
  40053b:	48 31 c0             	xor    rax,rax
  40053e:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]
  400541:	48 8b 3d dc 0b 20 00 	mov    rdi,QWORD PTR [rip+0x200bdc]        # 601124 <fileDescriptor>
  400548:	48 83 c0 30          	add    rax,0x30
  40054c:	48 89 c6             	mov    rsi,rax
  40054f:	b8 01 00 00 00       	mov    eax,0x1
  400554:	ba 01 00 00 00       	mov    edx,0x1
  400559:	0f 05                	syscall 
  40055b:	48 ff c1             	inc    rcx
  40055e:	eb d3                	jmp    400533 <FOR_outR>

0000000000400560 <ENDFOR_outR>:
  400560:	c3                   	ret    

0000000000400561 <movePiece>:
  400561:	89 3d cd 0b 20 00    	mov    DWORD PTR [rip+0x200bcd],edi        # 601134 <startRow>
  400567:	89 35 c7 0c 20 00    	mov    DWORD PTR [rip+0x200cc7],esi        # 601234 <startCol>
  40056d:	89 15 c1 0d 20 00    	mov    DWORD PTR [rip+0x200dc1],edx        # 601334 <endRow>
  400573:	89 0d bb 0e 20 00    	mov    DWORD PTR [rip+0x200ebb],ecx        # 601434 <endCol>

0000000000400579 <strt_OOB_test>:
  400579:	83 3d b4 0b 20 00 00 	cmp    DWORD PTR [rip+0x200bb4],0x0        # 601134 <startRow>
  400580:	0f 8c cb 03 00 00    	jl     400951 <DO_NOT_MOVE>
  400586:	83 3d a7 0b 20 00 07 	cmp    DWORD PTR [rip+0x200ba7],0x7        # 601134 <startRow>
  40058d:	0f 8f be 03 00 00    	jg     400951 <DO_NOT_MOVE>
  400593:	83 3d 9a 0c 20 00 00 	cmp    DWORD PTR [rip+0x200c9a],0x0        # 601234 <startCol>
  40059a:	0f 8c b1 03 00 00    	jl     400951 <DO_NOT_MOVE>
  4005a0:	83 3d 8d 0c 20 00 07 	cmp    DWORD PTR [rip+0x200c8d],0x7        # 601234 <startCol>
  4005a7:	0f 8f a4 03 00 00    	jg     400951 <DO_NOT_MOVE>

00000000004005ad <dst_OOB_test>:
  4005ad:	83 3d 80 0d 20 00 00 	cmp    DWORD PTR [rip+0x200d80],0x0        # 601334 <endRow>
  4005b4:	0f 8c 97 03 00 00    	jl     400951 <DO_NOT_MOVE>
  4005ba:	83 3d 73 0d 20 00 07 	cmp    DWORD PTR [rip+0x200d73],0x7        # 601334 <endRow>
  4005c1:	0f 8f 8a 03 00 00    	jg     400951 <DO_NOT_MOVE>
  4005c7:	83 3d 66 0e 20 00 00 	cmp    DWORD PTR [rip+0x200e66],0x0        # 601434 <endCol>
  4005ce:	0f 8c 7d 03 00 00    	jl     400951 <DO_NOT_MOVE>
  4005d4:	83 3d 59 0e 20 00 07 	cmp    DWORD PTR [rip+0x200e59],0x7        # 601434 <endCol>
  4005db:	0f 8f 70 03 00 00    	jg     400951 <DO_NOT_MOVE>

00000000004005e1 <dst_BLK_test>:
  4005e1:	48 8b 05 4c 0d 20 00 	mov    rax,QWORD PTR [rip+0x200d4c]        # 601334 <endRow>
  4005e8:	48 03 05 45 0e 20 00 	add    rax,QWORD PTR [rip+0x200e45]        # 601434 <endCol>
  4005ef:	48 31 d2             	xor    rdx,rdx
  4005f2:	bb 02 00 00 00       	mov    ebx,0x2
  4005f7:	48 f7 f3             	div    rbx
  4005fa:	48 83 fa 01          	cmp    rdx,0x1
  4005fe:	0f 84 4d 03 00 00    	je     400951 <DO_NOT_MOVE>

0000000000400604 <dst_BACK_test>:
  400604:	48 8b 05 29 0b 20 00 	mov    rax,QWORD PTR [rip+0x200b29]        # 601134 <startRow>
  40060b:	bb 04 00 00 00       	mov    ebx,0x4
  400610:	48 f7 e3             	mul    rbx
  400613:	8b 98 79 10 60 00    	mov    ebx,DWORD PTR [rax+0x601079]
  400619:	48 8b 0d 14 0c 20 00 	mov    rcx,QWORD PTR [rip+0x200c14]        # 601234 <startCol>
  400620:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]

0000000000400623 <IF_P2>:
  400623:	3c 02                	cmp    al,0x2
  400625:	74 02                	je     400629 <THEN_P2>
  400627:	eb 38                	jmp    400661 <IF_P1>

0000000000400629 <THEN_P2>:
  400629:	48 8b 05 04 0b 20 00 	mov    rax,QWORD PTR [rip+0x200b04]        # 601134 <startRow>
  400630:	48 ff c0             	inc    rax
  400633:	48 3b 05 fa 0c 20 00 	cmp    rax,QWORD PTR [rip+0x200cfa]        # 601334 <endRow>
  40063a:	0f 85 11 03 00 00    	jne    400951 <DO_NOT_MOVE>
  400640:	eb 3f                	jmp    400681 <ENDIF_P12>
  400642:	48 8b 05 eb 0a 20 00 	mov    rax,QWORD PTR [rip+0x200aeb]        # 601134 <startRow>
  400649:	bb 04 00 00 00       	mov    ebx,0x4
  40064e:	48 f7 e3             	mul    rbx
  400651:	8b 98 79 10 60 00    	mov    ebx,DWORD PTR [rax+0x601079]
  400657:	48 8b 0d d6 0b 20 00 	mov    rcx,QWORD PTR [rip+0x200bd6]        # 601234 <startCol>
  40065e:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]

0000000000400661 <IF_P1>:
  400661:	3c 01                	cmp    al,0x1
  400663:	74 05                	je     40066a <THEN_P1>
  400665:	e9 e7 02 00 00       	jmp    400951 <DO_NOT_MOVE>

000000000040066a <THEN_P1>:
  40066a:	48 8b 05 c3 0a 20 00 	mov    rax,QWORD PTR [rip+0x200ac3]        # 601134 <startRow>
  400671:	48 ff c8             	dec    rax
  400674:	48 3b 05 b9 0c 20 00 	cmp    rax,QWORD PTR [rip+0x200cb9]        # 601334 <endRow>
  40067b:	0f 85 d0 02 00 00    	jne    400951 <DO_NOT_MOVE>

0000000000400681 <ENDIF_P12>:
  400681:	48 8b 05 ac 0a 20 00 	mov    rax,QWORD PTR [rip+0x200aac]        # 601134 <startRow>
  400688:	bb 04 00 00 00       	mov    ebx,0x4
  40068d:	48 f7 e3             	mul    rbx
  400690:	8b 98 79 10 60 00    	mov    ebx,DWORD PTR [rax+0x601079]
  400696:	48 8b 0d 97 0b 20 00 	mov    rcx,QWORD PTR [rip+0x200b97]        # 601234 <startCol>
  40069d:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]

00000000004006a0 <IF_O2>:
  4006a0:	3c 02                	cmp    al,0x2
  4006a2:	74 02                	je     4006a6 <THEN_O2>
  4006a4:	eb 2a                	jmp    4006d0 <IF_O1>

00000000004006a6 <THEN_O2>:
  4006a6:	48 8b 05 87 0c 20 00 	mov    rax,QWORD PTR [rip+0x200c87]        # 601334 <endRow>
  4006ad:	bb 04 00 00 00       	mov    ebx,0x4
  4006b2:	48 f7 e3             	mul    rbx
  4006b5:	48 8b 98 79 10 60 00 	mov    rbx,QWORD PTR [rax+0x601079]
  4006bc:	48 8b 0d 71 0d 20 00 	mov    rcx,QWORD PTR [rip+0x200d71]        # 601434 <endCol>
  4006c3:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]
  4006c6:	3c 02                	cmp    al,0x2
  4006c8:	0f 84 83 02 00 00    	je     400951 <DO_NOT_MOVE>
  4006ce:	eb 4d                	jmp    40071d <ENDIF_O12>

00000000004006d0 <IF_O1>:
  4006d0:	48 8b 05 5d 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a5d]        # 601134 <startRow>
  4006d7:	bb 04 00 00 00       	mov    ebx,0x4
  4006dc:	48 f7 e3             	mul    rbx
  4006df:	8b 98 79 10 60 00    	mov    ebx,DWORD PTR [rax+0x601079]
  4006e5:	48 8b 0d 48 0b 20 00 	mov    rcx,QWORD PTR [rip+0x200b48]        # 601234 <startCol>
  4006ec:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]
  4006ef:	3c 01                	cmp    al,0x1
  4006f1:	74 02                	je     4006f5 <THEN_O1>
  4006f3:	eb 28                	jmp    40071d <ENDIF_O12>

00000000004006f5 <THEN_O1>:
  4006f5:	48 8b 05 38 0c 20 00 	mov    rax,QWORD PTR [rip+0x200c38]        # 601334 <endRow>
  4006fc:	bb 04 00 00 00       	mov    ebx,0x4
  400701:	48 f7 e3             	mul    rbx
  400704:	48 8b 98 79 10 60 00 	mov    rbx,QWORD PTR [rax+0x601079]
  40070b:	48 8b 0d 22 0d 20 00 	mov    rcx,QWORD PTR [rip+0x200d22]        # 601434 <endCol>
  400712:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]
  400715:	3c 01                	cmp    al,0x1
  400717:	0f 84 34 02 00 00    	je     400951 <DO_NOT_MOVE>

000000000040071d <ENDIF_O12>:
  40071d:	48 8b 05 10 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a10]        # 601134 <startRow>
  400724:	bb 04 00 00 00       	mov    ebx,0x4
  400729:	48 f7 e3             	mul    rbx
  40072c:	8b 98 79 10 60 00    	mov    ebx,DWORD PTR [rax+0x601079]
  400732:	48 8b 0d fb 0a 20 00 	mov    rcx,QWORD PTR [rip+0x200afb]        # 601234 <startCol>
  400739:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]

000000000040073c <IF_J2>:
  40073c:	3c 02                	cmp    al,0x2
  40073e:	0f 84 62 ff ff ff    	je     4006a6 <THEN_O2>
  400744:	eb 8a                	jmp    4006d0 <IF_O1>

0000000000400746 <THEN_J2>:
  400746:	48 8b 05 e7 0b 20 00 	mov    rax,QWORD PTR [rip+0x200be7]        # 601334 <endRow>
  40074d:	bb 04 00 00 00       	mov    ebx,0x4
  400752:	48 f7 e3             	mul    rbx
  400755:	48 8b 98 79 10 60 00 	mov    rbx,QWORD PTR [rax+0x601079]
  40075c:	48 8b 0d d1 0c 20 00 	mov    rcx,QWORD PTR [rip+0x200cd1]        # 601434 <endCol>
  400763:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]
  400766:	3c 01                	cmp    al,0x1
  400768:	74 57                	je     4007c1 <ENDIF_J12>
  40076a:	e9 07 01 00 00       	jmp    400876 <legal_move>

000000000040076f <IF_J1>:
  40076f:	48 8b 05 be 09 20 00 	mov    rax,QWORD PTR [rip+0x2009be]        # 601134 <startRow>
  400776:	bb 04 00 00 00       	mov    ebx,0x4
  40077b:	48 f7 e3             	mul    rbx
  40077e:	8b 98 79 10 60 00    	mov    ebx,DWORD PTR [rax+0x601079]
  400784:	48 8b 0d a9 0a 20 00 	mov    rcx,QWORD PTR [rip+0x200aa9]        # 601234 <startCol>
  40078b:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]
  40078e:	3c 01                	cmp    al,0x1
  400790:	0f 84 5f ff ff ff    	je     4006f5 <THEN_O1>
  400796:	eb 85                	jmp    40071d <ENDIF_O12>

0000000000400798 <THEN_J1>:
  400798:	48 8b 05 95 0b 20 00 	mov    rax,QWORD PTR [rip+0x200b95]        # 601334 <endRow>
  40079f:	bb 04 00 00 00       	mov    ebx,0x4
  4007a4:	48 f7 e3             	mul    rbx
  4007a7:	48 8b 98 79 10 60 00 	mov    rbx,QWORD PTR [rax+0x601079]
  4007ae:	48 8b 0d 7f 0c 20 00 	mov    rcx,QWORD PTR [rip+0x200c7f]        # 601434 <endCol>
  4007b5:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]
  4007b8:	3c 02                	cmp    al,0x2
  4007ba:	74 05                	je     4007c1 <ENDIF_J12>
  4007bc:	e9 b5 00 00 00       	jmp    400876 <legal_move>

00000000004007c1 <ENDIF_J12>:
  4007c1:	48 8b 05 6c 0b 20 00 	mov    rax,QWORD PTR [rip+0x200b6c]        # 601334 <endRow>
  4007c8:	48 03 05 65 09 20 00 	add    rax,QWORD PTR [rip+0x200965]        # 601134 <startRow>
  4007cf:	bb 02 00 00 00       	mov    ebx,0x2
  4007d4:	48 f7 e3             	mul    rbx
  4007d7:	48 03 1d 56 09 20 00 	add    rbx,QWORD PTR [rip+0x200956]        # 601134 <startRow>
  4007de:	48 83 f8 00          	cmp    rax,0x0
  4007e2:	0f 8c 69 01 00 00    	jl     400951 <DO_NOT_MOVE>
  4007e8:	48 83 f8 07          	cmp    rax,0x7
  4007ec:	0f 8f 5f 01 00 00    	jg     400951 <DO_NOT_MOVE>
  4007f2:	48 8b 05 3b 0c 20 00 	mov    rax,QWORD PTR [rip+0x200c3b]        # 601434 <endCol>
  4007f9:	48 03 05 34 0a 20 00 	add    rax,QWORD PTR [rip+0x200a34]        # 601234 <startCol>
  400800:	b9 02 00 00 00       	mov    ecx,0x2
  400805:	48 f7 e1             	mul    rcx
  400808:	48 03 0d 25 0a 20 00 	add    rcx,QWORD PTR [rip+0x200a25]        # 601234 <startCol>
  40080f:	48 89 c1             	mov    rcx,rax
  400812:	48 83 f8 00          	cmp    rax,0x0
  400816:	0f 8c 35 01 00 00    	jl     400951 <DO_NOT_MOVE>
  40081c:	48 83 f8 07          	cmp    rax,0x7
  400820:	0f 8f 2b 01 00 00    	jg     400951 <DO_NOT_MOVE>

0000000000400826 <jmp_OCP_test>:
  400826:	48 8b 05 07 0b 20 00 	mov    rax,QWORD PTR [rip+0x200b07]        # 601334 <endRow>
  40082d:	48 03 05 00 09 20 00 	add    rax,QWORD PTR [rip+0x200900]        # 601134 <startRow>
  400834:	bb 02 00 00 00       	mov    ebx,0x2
  400839:	48 f7 e3             	mul    rbx
  40083c:	48 03 1d f1 08 20 00 	add    rbx,QWORD PTR [rip+0x2008f1]        # 601134 <startRow>
  400843:	48 8b 98 79 10 60 00 	mov    rbx,QWORD PTR [rax+0x601079]
  40084a:	48 8b 05 e3 0b 20 00 	mov    rax,QWORD PTR [rip+0x200be3]        # 601434 <endCol>
  400851:	48 03 05 dc 09 20 00 	add    rax,QWORD PTR [rip+0x2009dc]        # 601234 <startCol>
  400858:	b9 02 00 00 00       	mov    ecx,0x2
  40085d:	48 f7 e1             	mul    rcx
  400860:	48 03 0d cd 09 20 00 	add    rcx,QWORD PTR [rip+0x2009cd]        # 601234 <startCol>
  400867:	48 89 c1             	mov    rcx,rax
  40086a:	83 3c 8b 00          	cmp    DWORD PTR [rbx+rcx*4],0x0
  40086e:	0f 85 dd 00 00 00    	jne    400951 <DO_NOT_MOVE>
  400874:	eb 4a                	jmp    4008c0 <legal_jump>

0000000000400876 <legal_move>:
  400876:	48 8b 05 b7 08 20 00 	mov    rax,QWORD PTR [rip+0x2008b7]        # 601134 <startRow>
  40087d:	bb 04 00 00 00       	mov    ebx,0x4
  400882:	48 f7 e3             	mul    rbx
  400885:	8b 98 79 10 60 00    	mov    ebx,DWORD PTR [rax+0x601079]
  40088b:	48 8b 0d a2 09 20 00 	mov    rcx,QWORD PTR [rip+0x2009a2]        # 601234 <startCol>
  400892:	48 31 c0             	xor    rax,rax
  400895:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]
  400898:	50                   	push   rax
  400899:	48 31 c0             	xor    rax,rax
  40089c:	88 04 8b             	mov    BYTE PTR [rbx+rcx*4],al
  40089f:	48 8b 05 8e 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a8e]        # 601334 <endRow>
  4008a6:	bb 04 00 00 00       	mov    ebx,0x4
  4008ab:	48 f7 e3             	mul    rbx
  4008ae:	48 8b 98 79 10 60 00 	mov    rbx,QWORD PTR [rax+0x601079]
  4008b5:	48 8b 0d 78 0b 20 00 	mov    rcx,QWORD PTR [rip+0x200b78]        # 601434 <endCol>
  4008bc:	58                   	pop    rax
  4008bd:	88 04 8b             	mov    BYTE PTR [rbx+rcx*4],al

00000000004008c0 <legal_jump>:
  4008c0:	48 8b 05 6d 08 20 00 	mov    rax,QWORD PTR [rip+0x20086d]        # 601134 <startRow>
  4008c7:	bb 04 00 00 00       	mov    ebx,0x4
  4008cc:	48 f7 e3             	mul    rbx
  4008cf:	8b 98 79 10 60 00    	mov    ebx,DWORD PTR [rax+0x601079]
  4008d5:	48 8b 0d 58 09 20 00 	mov    rcx,QWORD PTR [rip+0x200958]        # 601234 <startCol>
  4008dc:	48 31 c0             	xor    rax,rax
  4008df:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]
  4008e2:	50                   	push   rax
  4008e3:	48 31 c0             	xor    rax,rax
  4008e6:	88 04 8b             	mov    BYTE PTR [rbx+rcx*4],al
  4008e9:	48 8b 05 44 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a44]        # 601334 <endRow>
  4008f0:	bb 04 00 00 00       	mov    ebx,0x4
  4008f5:	48 f7 e3             	mul    rbx
  4008f8:	48 8b 98 79 10 60 00 	mov    rbx,QWORD PTR [rax+0x601079]
  4008ff:	48 8b 0d 2e 0b 20 00 	mov    rcx,QWORD PTR [rip+0x200b2e]        # 601434 <endCol>
  400906:	88 04 8b             	mov    BYTE PTR [rbx+rcx*4],al
  400909:	48 8b 05 24 0a 20 00 	mov    rax,QWORD PTR [rip+0x200a24]        # 601334 <endRow>
  400910:	48 03 05 1d 08 20 00 	add    rax,QWORD PTR [rip+0x20081d]        # 601134 <startRow>
  400917:	bb 02 00 00 00       	mov    ebx,0x2
  40091c:	48 f7 e3             	mul    rbx
  40091f:	48 03 1d 0e 08 20 00 	add    rbx,QWORD PTR [rip+0x20080e]        # 601134 <startRow>
  400926:	48 8b 98 79 10 60 00 	mov    rbx,QWORD PTR [rax+0x601079]
  40092d:	48 8b 05 00 0b 20 00 	mov    rax,QWORD PTR [rip+0x200b00]        # 601434 <endCol>
  400934:	48 03 05 f9 08 20 00 	add    rax,QWORD PTR [rip+0x2008f9]        # 601234 <startCol>
  40093b:	b9 02 00 00 00       	mov    ecx,0x2
  400940:	48 f7 e1             	mul    rcx
  400943:	48 03 0d ea 08 20 00 	add    rcx,QWORD PTR [rip+0x2008ea]        # 601234 <startCol>
  40094a:	48 89 c1             	mov    rcx,rax
  40094d:	58                   	pop    rax
  40094e:	88 04 8b             	mov    BYTE PTR [rbx+rcx*4],al

0000000000400951 <DO_NOT_MOVE>:
  400951:	c3                   	ret    

0000000000400952 <kingCheck>:
  400952:	48 31 c9             	xor    rcx,rcx

0000000000400955 <FOR1_KC>:
  400955:	48 83 f9 08          	cmp    rcx,0x8
  400959:	7c 02                	jl     40095d <DO1_KC>
  40095b:	eb 1d                	jmp    40097a <ENDFOR1_KC>

000000000040095d <DO1_KC>:
  40095d:	48 31 c0             	xor    rax,rax
  400960:	48 8b 98 79 10 60 00 	mov    rbx,QWORD PTR [rax+0x601079]
  400967:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]
  40096a:	3c 01                	cmp    al,0x1
  40096c:	74 02                	je     400970 <KING_ONE>
  40096e:	eb 05                	jmp    400975 <FORNEXT1_KC>

0000000000400970 <KING_ONE>:
  400970:	b0 03                	mov    al,0x3
  400972:	88 04 8b             	mov    BYTE PTR [rbx+rcx*4],al

0000000000400975 <FORNEXT1_KC>:
  400975:	48 ff c1             	inc    rcx
  400978:	eb db                	jmp    400955 <FOR1_KC>

000000000040097a <ENDFOR1_KC>:
  40097a:	48 31 c9             	xor    rcx,rcx

000000000040097d <FOR2_KC>:
  40097d:	48 83 f9 08          	cmp    rcx,0x8
  400981:	7c 02                	jl     400985 <DO2_KC>
  400983:	eb 1f                	jmp    4009a4 <ENDFOR2_KC>

0000000000400985 <DO2_KC>:
  400985:	b8 1c 00 00 00       	mov    eax,0x1c
  40098a:	48 8b 98 79 10 60 00 	mov    rbx,QWORD PTR [rax+0x601079]
  400991:	8a 04 8b             	mov    al,BYTE PTR [rbx+rcx*4]
  400994:	3c 02                	cmp    al,0x2
  400996:	74 02                	je     40099a <KING_TWO>
  400998:	eb 05                	jmp    40099f <FORNEXT2_KC>

000000000040099a <KING_TWO>:
  40099a:	b0 04                	mov    al,0x4
  40099c:	88 04 8b             	mov    BYTE PTR [rbx+rcx*4],al

000000000040099f <FORNEXT2_KC>:
  40099f:	48 ff c1             	inc    rcx
  4009a2:	eb d9                	jmp    40097d <FOR2_KC>

00000000004009a4 <ENDFOR2_KC>:
  4009a4:	c3                   	ret    

00000000004009a5 <ENDPRGM>:
  4009a5:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  4009ac:	00 00 00 
  4009af:	90                   	nop

00000000004009b0 <__libc_csu_init>:
  4009b0:	41 57                	push   r15
  4009b2:	41 56                	push   r14
  4009b4:	49 89 d7             	mov    r15,rdx
  4009b7:	41 55                	push   r13
  4009b9:	41 54                	push   r12
  4009bb:	4c 8d 25 8e 04 20 00 	lea    r12,[rip+0x20048e]        # 600e50 <__frame_dummy_init_array_entry>
  4009c2:	55                   	push   rbp
  4009c3:	48 8d 2d 8e 04 20 00 	lea    rbp,[rip+0x20048e]        # 600e58 <__init_array_end>
  4009ca:	53                   	push   rbx
  4009cb:	41 89 fd             	mov    r13d,edi
  4009ce:	49 89 f6             	mov    r14,rsi
  4009d1:	4c 29 e5             	sub    rbp,r12
  4009d4:	48 83 ec 08          	sub    rsp,0x8
  4009d8:	48 c1 fd 03          	sar    rbp,0x3
  4009dc:	e8 cf f9 ff ff       	call   4003b0 <_init>
  4009e1:	48 85 ed             	test   rbp,rbp
  4009e4:	74 20                	je     400a06 <__libc_csu_init+0x56>
  4009e6:	31 db                	xor    ebx,ebx
  4009e8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4009ef:	00 
  4009f0:	4c 89 fa             	mov    rdx,r15
  4009f3:	4c 89 f6             	mov    rsi,r14
  4009f6:	44 89 ef             	mov    edi,r13d
  4009f9:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
  4009fd:	48 83 c3 01          	add    rbx,0x1
  400a01:	48 39 dd             	cmp    rbp,rbx
  400a04:	75 ea                	jne    4009f0 <__libc_csu_init+0x40>
  400a06:	48 83 c4 08          	add    rsp,0x8
  400a0a:	5b                   	pop    rbx
  400a0b:	5d                   	pop    rbp
  400a0c:	41 5c                	pop    r12
  400a0e:	41 5d                	pop    r13
  400a10:	41 5e                	pop    r14
  400a12:	41 5f                	pop    r15
  400a14:	c3                   	ret    
  400a15:	90                   	nop
  400a16:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  400a1d:	00 00 00 

0000000000400a20 <__libc_csu_fini>:
  400a20:	f3 c3                	repz ret 

Disassembly of section .fini:

0000000000400a24 <_fini>:
  400a24:	48 83 ec 08          	sub    rsp,0x8
  400a28:	48 83 c4 08          	add    rsp,0x8
  400a2c:	c3                   	ret    
