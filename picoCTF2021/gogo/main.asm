TEXT runtime.main(SB) /usr/lib/go-1.10/src/runtime/proc.go
  proc.go:109		0x806d640		658b0d00000000		MOVL GS:0, CX					
  proc.go:109		0x806d647		8b89fcffffff		MOVL 0xfffffffc(CX), CX				
  proc.go:109		0x806d64d		3b6108			CMPL 0x8(CX), SP				
  proc.go:109		0x806d650		0f8651030000		JBE 0x806d9a7					
  proc.go:109		0x806d656		83ec24			SUBL $0x24, SP					
  proc.go:110		0x806d659		658b0500000000		MOVL GS:0, AX					
  proc.go:110		0x806d660		8b80fcffffff		MOVL 0xfffffffc(AX), AX				
  proc.go:110		0x806d666		89442420		MOVL AX, 0x20(SP)				
  proc.go:114		0x806d66a		8b4818			MOVL 0x18(AX), CX				
  proc.go:114		0x806d66d		8b09			MOVL 0(CX), CX					
  proc.go:114		0x806d66f		c781b000000000000000	MOVL $0x0, 0xb0(CX)				
  proc.go:122		0x806d679		c70518e0150880b2e60e	MOVL $0xee6b280, runtime.maxstacksize(SB)	
  proc.go:126		0x806d683		c6051cf7170801		MOVB $0x1, runtime.mainStarted(SB)		
  proc.go:128		0x806d68a		8d0db4471008		LEAL 0x81047b4, CX				
  proc.go:128		0x806d690		890c24			MOVL CX, 0(SP)					
  proc.go:128		0x806d693		e838190200		CALL runtime.systemstack(SB)			
  proc.go:3506		0x806d698		658b0500000000		MOVL GS:0, AX					
  proc.go:3506		0x806d69f		8b80fcffffff		MOVL 0xfffffffc(AX), AX				
  proc.go:3506		0x806d6a5		8b4018			MOVL 0x18(AX), AX				
  proc.go:3506		0x806d6a8		8b88ec010000		MOVL 0x1ec(AX), CX				
  proc.go:3506		0x806d6ae		41			INCL CX						
  proc.go:3506		0x806d6af		8988ec010000		MOVL CX, 0x1ec(AX)				
  proc.go:3471		0x806d6b5		658b0500000000		MOVL GS:0, AX					
  proc.go:3471		0x806d6bc		8b80fcffffff		MOVL 0xfffffffc(AX), AX				
  proc.go:3472		0x806d6c2		8b4818			MOVL 0x18(AX), CX				
  proc.go:3472		0x806d6c5		8d91e0000000		LEAL 0xe0(CX), DX				
  runtime2.go:205	0x806d6cb		8402			TESTB AL, 0(DX)					
  runtime2.go:205	0x806d6cd		89c2			MOVL AX, DX					
  runtime2.go:205	0x806d6cf		8981e0000000		MOVL AX, 0xe0(CX)				
  proc.go:3473		0x806d6d5		8d8288000000		LEAL 0x88(DX), AX				
  runtime2.go:243	0x806d6db		8400			TESTB AL, 0(AX)					
  proc.go:3473		0x806d6dd		8b4218			MOVL 0x18(DX), AX				
  runtime2.go:243	0x806d6e0		898288000000		MOVL AX, 0x88(DX)				
  runtime2.go:243	0x806d6e6		8b442420		MOVL 0x20(SP), AX				
  proc.go:140		0x806d6ea		8b4018			MOVL 0x18(AX), AX				
  proc.go:140		0x806d6ed		8d0d60e81608		LEAL runtime.m0(SB), CX				
  proc.go:140		0x806d6f3		39c8			CMPL CX, AX					
  proc.go:140		0x806d6f5		0f8594020000		JNE 0x806d98f					
  proc.go:144		0x806d6fb		e8c0130200		CALL runtime.init(SB)				
  proc.go:145		0x806d700		e80b3f0200		CALL runtime.nanotime(SB)			
  proc.go:145		0x806d705		8b442404		MOVL 0x4(SP), AX				
  proc.go:145		0x806d709		8b0c24			MOVL 0(SP), CX					
  proc.go:145		0x806d70c		85c9			TESTL CX, CX					
  proc.go:145		0x806d70e		0f94c1			SETE CL						
  proc.go:145		0x806d711		85c0			TESTL AX, AX					
  proc.go:145		0x806d713		0f94c0			SETE AL						
  proc.go:145		0x806d716		21c8			ANDL CX, AX					
  proc.go:145		0x806d718		84c0			TESTL AL, AL					
  proc.go:145		0x806d71a		0f8557020000		JNE 0x806d977					
  proc.go:150		0x806d720		c644241b01		MOVB $0x1, 0x1b(SP)				
  proc.go:155		0x806d725		8d44241b		LEAL 0x1b(SP), AX				
  proc.go:155		0x806d729		89442408		MOVL AX, 0x8(SP)				
  proc.go:151		0x806d72d		c7042404000000		MOVL $0x4, 0(SP)				
  proc.go:151		0x806d734		8d05b8471008		LEAL 0x81047b8, AX				
  proc.go:151		0x806d73a		89442404		MOVL AX, 0x4(SP)				
  proc.go:151		0x806d73e		e8ddd5ffff		CALL runtime.deferproc(SB)			
  proc.go:151		0x806d743		85c0			TESTL AX, AX					
  proc.go:151		0x806d745		0f85c2010000		JNE 0x806d90d					
  proc.go:159		0x806d74b		e8c03e0200		CALL runtime.nanotime(SB)			
  proc.go:159		0x806d750		8b442404		MOVL 0x4(SP), AX				
  proc.go:159		0x806d754		8b0c24			MOVL 0(SP), CX					
  proc.go:159		0x806d757		890d10f81708		MOVL CX, runtime.runtimeInitTime(SB)		
  proc.go:159		0x806d75d		890514f81708		MOVL AX, runtime.runtimeInitTime+4(SB)		
  proc.go:161		0x806d763		e818c5feff		CALL runtime.gcenable(SB)			
  proc.go:163		0x806d768		8d0500330e08		LEAL 0x80e3300, AX				
  proc.go:163		0x806d76e		890424			MOVL AX, 0(SP)					
  proc.go:163		0x806d771		c744240400000000	MOVL $0x0, 0x4(SP)				
  proc.go:163		0x806d779		e842d5fdff		CALL runtime.makechan(SB)			
  proc.go:163		0x806d77e		8b0580f81708		MOVL runtime.writeBarrier(SB), AX		
  proc.go:163		0x806d784		8b4c2408		MOVL 0x8(SP), CX				
  proc.go:163		0x806d788		85c0			TESTL AX, AX					
  proc.go:163		0x806d78a		0f8566010000		JNE 0x806d8f6					
  proc.go:163		0x806d790		890df4e01608		MOVL CX, runtime.main_init_done(SB)		
  proc.go:164		0x806d796		0fb60519f71708		MOVZX runtime.iscgo(SB), AX			
  proc.go:164		0x806d79d		84c0			TESTL AL, AL					
  proc.go:164		0x806d79f		7453			JE 0x806d7f4					
  proc.go:165		0x806d7a1		8b05a8e01608		MOVL _cgo_thread_start(SB), AX			
  proc.go:165		0x806d7a7		85c0			TESTL AX, AX					
  proc.go:165		0x806d7a9		0f84b0010000		JE 0x806d95f					
  proc.go:169		0x806d7af		8b05c0e01608		MOVL runtime._cgo_setenv(SB), AX		
  proc.go:169		0x806d7b5		85c0			TESTL AX, AX					
  proc.go:169		0x806d7b7		0f848a010000		JE 0x806d947					
  proc.go:172		0x806d7bd		8b05c4e01608		MOVL runtime._cgo_unsetenv(SB), AX		
  proc.go:172		0x806d7c3		85c0			TESTL AX, AX					
  proc.go:172		0x806d7c5		0f8464010000		JE 0x806d92f					
  proc.go:176		0x806d7cb		8b05a4e01608		MOVL _cgo_notify_runtime_init_done(SB), AX	
  proc.go:176		0x806d7d1		85c0			TESTL AX, AX					
  proc.go:176		0x806d7d3		0f843e010000		JE 0x806d917					
  proc.go:181		0x806d7d9		e8723b0000		CALL runtime.startTemplateThread(SB)		
  proc.go:182		0x806d7de		8b05a4e01608		MOVL _cgo_notify_runtime_init_done(SB), AX	
  proc.go:182		0x806d7e4		890424			MOVL AX, 0(SP)					
  proc.go:182		0x806d7e7		c744240400000000	MOVL $0x0, 0x4(SP)				
  proc.go:182		0x806d7ef		e86cccfdff		CALL runtime.cgocall(SB)			
  proc.go:186		0x806d7f4		8b05bc471008		MOVL 0x81047bc, AX				
  proc.go:186		0x806d7fa		8d15bc471008		LEAL 0x81047bc, DX				
  proc.go:186		0x806d800		ffd0			CALL AX						
  proc.go:187		0x806d802		8b05f4e01608		MOVL runtime.main_init_done(SB), AX		
  proc.go:187		0x806d808		890424			MOVL AX, 0(SP)					
  proc.go:187		0x806d80b		e870dffdff		CALL runtime.closechan(SB)			
  proc.go:189		0x806d810		c644241b00		MOVB $0x0, 0x1b(SP)				
  proc.go:190		0x806d815		e816750000		CALL runtime.unlockOSThread(SB)			
  proc.go:192		0x806d81a		0fb60518f71708		MOVZX runtime.isarchive(SB), AX			
  proc.go:192		0x806d821		84c0			TESTL AL, AL					
  proc.go:192		0x806d823		0f85c3000000		JNE 0x806d8ec					
  proc.go:192		0x806d829		0fb6051af71708		MOVZX runtime.islibrary(SB), AX			
  proc.go:192		0x806d830		84c0			TESTL AL, AL					
  proc.go:192		0x806d832		0f85b4000000		JNE 0x806d8ec					
  proc.go:198		0x806d838		8b05c0471008		MOVL 0x81047c0, AX				
  proc.go:198		0x806d83e		8d15c0471008		LEAL 0x81047c0, DX				
  proc.go:198		0x806d844		ffd0			CALL AX						
  proc.go:207		0x806d846		8d05b4f71708		LEAL runtime.runningPanicDefers(SB), AX		
  proc.go:207		0x806d84c		890424			MOVL AX, 0(SP)					
  proc.go:207		0x806d84f		e88cbafdff		CALL runtime/internal/atomic.Load(SB)		
  proc.go:207		0x806d854		8b442404		MOVL 0x4(SP), AX				
  proc.go:207		0x806d858		85c0			TESTL AX, AX					
  proc.go:207		0x806d85a		742f			JE 0x806d88b					
  proc.go:207		0x806d85c		31c0			XORL AX, AX					
  proc.go:209		0x806d85e		eb0a			JMP 0x806d86a					
  proc.go:213		0x806d860		e8fb020000		CALL runtime.Gosched(SB)			
  proc.go:213		0x806d865		8b44241c		MOVL 0x1c(SP), AX				
  proc.go:209		0x806d869		40			INCL AX						
  proc.go:209		0x806d86a		3de8030000		CMPL $0x3e8, AX					
  proc.go:209		0x806d86f		7d1a			JGE 0x806d88b					
  proc.go:209		0x806d871		8944241c		MOVL AX, 0x1c(SP)				
  proc.go:210		0x806d875		8d05b4f71708		LEAL runtime.runningPanicDefers(SB), AX		
  proc.go:210		0x806d87b		890424			MOVL AX, 0(SP)					
  proc.go:210		0x806d87e		e85dbafdff		CALL runtime/internal/atomic.Load(SB)		
  proc.go:210		0x806d883		8b442404		MOVL 0x4(SP), AX				
  proc.go:210		0x806d887		85c0			TESTL AX, AX					
  proc.go:210		0x806d889		75d5			JNE 0x806d860					
  proc.go:216		0x806d88b		8d059cf71708		LEAL runtime.panicking(SB), AX			
  proc.go:216		0x806d891		890424			MOVL AX, 0(SP)					
  proc.go:216		0x806d894		e847bafdff		CALL runtime/internal/atomic.Load(SB)		
  proc.go:216		0x806d899		8b442404		MOVL 0x4(SP), AX				
  proc.go:216		0x806d89d		85c0			TESTL AX, AX					
  proc.go:216		0x806d89f		7516			JNE 0x806d8b7					
  proc.go:220		0x806d8a1		c7042400000000		MOVL $0x0, 0(SP)				
  proc.go:220		0x806d8a8		e8233b0200		CALL runtime.exit(SB)				
  proc.go:223		0x806d8ad		31c0			XORL AX, AX					
  proc.go:223		0x806d8af		c70000000000		MOVL $0x0, 0(AX)				
  proc.go:223		0x806d8b5		ebf6			JMP 0x806d8ad					
  proc.go:217		0x806d8b7		c7042400000000		MOVL $0x0, 0(SP)				
  proc.go:217		0x806d8be		c744240400000000	MOVL $0x0, 0x4(SP)				
  proc.go:217		0x806d8c6		8d05b1db0f08		LEAL 0x80fdbb1, AX				
  proc.go:217		0x806d8cc		89442408		MOVL AX, 0x8(SP)				
  proc.go:217		0x806d8d0		c744240c09000000	MOVL $0x9, 0xc(SP)				
  proc.go:217		0x806d8d8		c644241010		MOVB $0x10, 0x10(SP)				
  proc.go:217		0x806d8dd		c744241401000000	MOVL $0x1, 0x14(SP)				
  proc.go:217		0x806d8e5		e896020000		CALL runtime.gopark(SB)				
  proc.go:217		0x806d8ea		ebb5			JMP 0x806d8a1					
  proc.go:195		0x806d8ec		90			NOPL						
  proc.go:195		0x806d8ed		e84edcffff		CALL runtime.deferreturn(SB)			
  proc.go:195		0x806d8f2		83c424			ADDL $0x24, SP					
  proc.go:195		0x806d8f5		c3			RET						
  proc.go:163		0x806d8f6		8d05f4e01608		LEAL runtime.main_init_done(SB), AX		
  proc.go:163		0x806d8fc		890424			MOVL AX, 0(SP)					
  proc.go:163		0x806d8ff		894c2404		MOVL CX, 0x4(SP)				
  proc.go:163		0x806d903		e8e877feff		CALL runtime.writebarrierptr(SB)		
  proc.go:163		0x806d908		e989feffff		JMP 0x806d796					
  proc.go:151		0x806d90d		90			NOPL						
  proc.go:151		0x806d90e		e82ddcffff		CALL runtime.deferreturn(SB)			
  proc.go:151		0x806d913		83c424			ADDL $0x24, SP					
  proc.go:151		0x806d916		c3			RET						
  proc.go:177		0x806d917		8d05b2291008		LEAL 0x81029b2, AX				
  proc.go:177		0x806d91d		890424			MOVL AX, 0(SP)					
  proc.go:177		0x806d920		c744240425000000	MOVL $0x25, 0x4(SP)				
  proc.go:177		0x806d928		e8f3e6ffff		CALL runtime.throw(SB)				
  proc.go:177		0x806d92d		0f0b			UD2						
  proc.go:173		0x806d92f		8d05d8f90f08		LEAL 0x80ff9d8, AX				
  proc.go:173		0x806d935		890424			MOVL AX, 0(SP)					
  proc.go:173		0x806d938		c744240415000000	MOVL $0x15, 0x4(SP)				
  proc.go:173		0x806d940		e8dbe6ffff		CALL runtime.throw(SB)				
  proc.go:173		0x806d945		0f0b			UD2						
  proc.go:170		0x806d947		8d05b1f20f08		LEAL 0x80ff2b1, AX				
  proc.go:170		0x806d94d		890424			MOVL AX, 0(SP)					
  proc.go:170		0x806d950		c744240413000000	MOVL $0x13, 0x4(SP)				
  proc.go:170		0x806d958		e8c3e6ffff		CALL runtime.throw(SB)				
  proc.go:170		0x806d95d		0f0b			UD2						
  proc.go:166		0x806d95f		8d0564051008		LEAL 0x8100564, AX				
  proc.go:166		0x806d965		890424			MOVL AX, 0(SP)					
  proc.go:166		0x806d968		c744240419000000	MOVL $0x19, 0x4(SP)				
  proc.go:166		0x806d970		e8abe6ffff		CALL runtime.throw(SB)				
  proc.go:166		0x806d975		0f0b			UD2						
  proc.go:146		0x806d977		8d0526011008		LEAL 0x8100126, AX				
  proc.go:146		0x806d97d		890424			MOVL AX, 0(SP)					
  proc.go:146		0x806d980		c744240417000000	MOVL $0x17, 0x4(SP)				
  proc.go:146		0x806d988		e893e6ffff		CALL runtime.throw(SB)				
  proc.go:146		0x806d98d		0f0b			UD2						
  proc.go:141		0x806d98f		8d0522fe0f08		LEAL 0x80ffe22, AX				
  proc.go:141		0x806d995		890424			MOVL AX, 0(SP)					
  proc.go:141		0x806d998		c744240416000000	MOVL $0x16, 0x4(SP)				
  proc.go:141		0x806d9a0		e87be6ffff		CALL runtime.throw(SB)				
  proc.go:141		0x806d9a5		0f0b			UD2						
  proc.go:109		0x806d9a7		e844170200		CALL runtime.morestack_noctxt(SB)		
  proc.go:109		0x806d9ac		e98ffcffff		JMP runtime.main(SB)				

TEXT runtime.main.func1(SB) /usr/lib/go-1.10/src/runtime/proc.go
  proc.go:128		0x808def0		658b0d00000000		MOVL GS:0, CX				
  proc.go:128		0x808def7		8b89fcffffff		MOVL 0xfffffffc(CX), CX			
  proc.go:128		0x808defd		3b6108			CMPL 0x8(CX), SP			
  proc.go:128		0x808df00		761d			JBE 0x808df1f				
  proc.go:128		0x808df02		83ec08			SUBL $0x8, SP				
  proc.go:129		0x808df05		8d0568481008		LEAL 0x8104868, AX			
  proc.go:129		0x808df0b		890424			MOVL AX, 0(SP)				
  proc.go:129		0x808df0e		c744240400000000	MOVL $0x0, 0x4(SP)			
  proc.go:129		0x808df16		e8f531feff		CALL runtime.newm(SB)			
  proc.go:130		0x808df1b		83c408			ADDL $0x8, SP				
  proc.go:130		0x808df1e		c3			RET					
  proc.go:128		0x808df1f		e8cc110000		CALL runtime.morestack_noctxt(SB)	
  proc.go:128		0x808df24		ebca			JMP runtime.main.func1(SB)		

TEXT runtime.main.func2(SB) /usr/lib/go-1.10/src/runtime/proc.go
  proc.go:151		0x808df30		658b0d00000000		MOVL GS:0, CX				
  proc.go:151		0x808df37		8b89fcffffff		MOVL 0xfffffffc(CX), CX			
  proc.go:151		0x808df3d		3b6108			CMPL 0x8(CX), SP			
  proc.go:151		0x808df40		7613			JBE 0x808df55				
  proc.go:151		0x808df42		8b442404		MOVL 0x4(SP), AX			
  proc.go:152		0x808df46		0fb600			MOVZX 0(AX), AX				
  proc.go:152		0x808df49		84c0			TESTL AL, AL				
  proc.go:152		0x808df4b		7501			JNE 0x808df4e				
  proc.go:152		0x808df4d		c3			RET					
  proc.go:153		0x808df4e		e8dd6dfeff		CALL runtime.unlockOSThread(SB)		
  proc.go:153		0x808df53		ebf8			JMP 0x808df4d				
  proc.go:151		0x808df55		e896110000		CALL runtime.morestack_noctxt(SB)	
  proc.go:151		0x808df5a		ebd4			JMP runtime.main.func2(SB)		

TEXT main.main(SB) /opt/hacksports/shared/staging/gogo_4_5078111871735553/problem_files/enter_password.go
  enter_password.go:13	0x80d4800		658b0d00000000		MOVL GS:0, CX				
  enter_password.go:13	0x80d4807		8b89fcffffff		MOVL 0xfffffffc(CX), CX			
  enter_password.go:13	0x80d480d		3b6108			CMPL 0x8(CX), SP			
  enter_password.go:13	0x80d4810		0f8660020000		JBE 0x80d4a76				
  enter_password.go:13	0x80d4816		83ec58			SUBL $0x58, SP				
  enter_password.go:14	0x80d4819		8d0560880e08		LEAL 0x80e8860, AX			
  enter_password.go:14	0x80d481f		890424			MOVL AX, 0(SP)				
  enter_password.go:14	0x80d4822		e8f9fff7ff		CALL runtime.newobject(SB)		
  enter_password.go:14	0x80d4827		8b442404		MOVL 0x4(SP), AX			
  enter_password.go:14	0x80d482b		89442424		MOVL AX, 0x24(SP)			
  enter_password.go:15	0x80d482f		8d0d50ea0f08		LEAL 0x80fea50, CX			
  enter_password.go:15	0x80d4835		890c24			MOVL CX, 0(SP)				
  enter_password.go:15	0x80d4838		c744240410000000	MOVL $0x10, 0x4(SP)			
  enter_password.go:15	0x80d4840		c744240800000000	MOVL $0x0, 0x8(SP)			
  enter_password.go:15	0x80d4848		c744240c00000000	MOVL $0x0, 0xc(SP)			
  enter_password.go:15	0x80d4850		c744241000000000	MOVL $0x0, 0x10(SP)			
  enter_password.go:15	0x80d4858		e8133bffff		CALL fmt.Printf(SB)			
  enter_password.go:16	0x80d485d		c744244000000000	MOVL $0x0, 0x40(SP)			
  enter_password.go:16	0x80d4865		c744244400000000	MOVL $0x0, 0x44(SP)			
  enter_password.go:16	0x80d486d		8d0500130e08		LEAL 0x80e1300, AX			
  enter_password.go:16	0x80d4873		89442440		MOVL AX, 0x40(SP)			
  enter_password.go:16	0x80d4877		8b4c2424		MOVL 0x24(SP), CX			
  enter_password.go:16	0x80d487b		894c2444		MOVL CX, 0x44(SP)			
  enter_password.go:16	0x80d487f		8d15b6d10f08		LEAL 0x80fd1b6, DX			
  enter_password.go:16	0x80d4885		891424			MOVL DX, 0(SP)				
  enter_password.go:16	0x80d4888		c744240403000000	MOVL $0x3, 0x4(SP)			
  enter_password.go:16	0x80d4890		8d5c2440		LEAL 0x40(SP), BX			
  enter_password.go:16	0x80d4894		895c2408		MOVL BX, 0x8(SP)			
  enter_password.go:16	0x80d4898		c744240c01000000	MOVL $0x1, 0xc(SP)			
  enter_password.go:16	0x80d48a0		c744241001000000	MOVL $0x1, 0x10(SP)			
  enter_password.go:16	0x80d48a8		e8f3aaffff		CALL fmt.Scanf(SB)			
  enter_password.go:13	0x80d48ad		8b442424		MOVL 0x24(SP), AX			
  enter_password.go:17	0x80d48b1		8b08			MOVL 0(AX), CX				
  enter_password.go:17	0x80d48b3		8b4004			MOVL 0x4(AX), AX			
  enter_password.go:17	0x80d48b6		890c24			MOVL CX, 0(SP)				
  enter_password.go:17	0x80d48b9		89442404		MOVL AX, 0x4(SP)			
  enter_password.go:17	0x80d48bd		e8be010000		CALL main.checkPassword(SB)		
  enter_password.go:17	0x80d48c2		0fb6442408		MOVZX 0x8(SP), AX			
  enter_password.go:17	0x80d48c7		84c0			TESTL AL, AL				
  enter_password.go:17	0x80d48c9		0f8465010000		JE 0x80d4a34				
  enter_password.go:18	0x80d48cf		c744243800000000	MOVL $0x0, 0x38(SP)			
  enter_password.go:18	0x80d48d7		c744243c00000000	MOVL $0x0, 0x3c(SP)			
  enter_password.go:18	0x80d48df		8d0560880e08		LEAL 0x80e8860, AX			
  enter_password.go:18	0x80d48e5		89442438		MOVL AX, 0x38(SP)			
  enter_password.go:18	0x80d48e9		8d0d98f61008		LEAL main.statictmp_0(SB), CX		
  enter_password.go:18	0x80d48ef		894c243c		MOVL CX, 0x3c(SP)			
  enter_password.go:18	0x80d48f3		8d4c2438		LEAL 0x38(SP), CX			
  enter_password.go:18	0x80d48f7		890c24			MOVL CX, 0(SP)				
  enter_password.go:18	0x80d48fa		c744240401000000	MOVL $0x1, 0x4(SP)			
  enter_password.go:18	0x80d4902		c744240801000000	MOVL $0x1, 0x8(SP)			
  enter_password.go:18	0x80d490a		e8a13bffff		CALL fmt.Println(SB)			
  enter_password.go:19	0x80d490f		c744243000000000	MOVL $0x0, 0x30(SP)			
  enter_password.go:19	0x80d4917		c744243400000000	MOVL $0x0, 0x34(SP)			
  enter_password.go:19	0x80d491f		8d0560880e08		LEAL 0x80e8860, AX			
  enter_password.go:19	0x80d4925		89442430		MOVL AX, 0x30(SP)			
  enter_password.go:19	0x80d4929		8d0da0f61008		LEAL main.statictmp_1(SB), CX		
  enter_password.go:19	0x80d492f		894c2434		MOVL CX, 0x34(SP)			
  enter_password.go:19	0x80d4933		8d4c2430		LEAL 0x30(SP), CX			
  enter_password.go:19	0x80d4937		890c24			MOVL CX, 0(SP)				
  enter_password.go:19	0x80d493a		c744240401000000	MOVL $0x1, 0x4(SP)			
  enter_password.go:19	0x80d4942		c744240801000000	MOVL $0x1, 0x8(SP)			
  enter_password.go:19	0x80d494a		e8613bffff		CALL fmt.Println(SB)			
  enter_password.go:20	0x80d494f		c744242800000000	MOVL $0x0, 0x28(SP)			
  enter_password.go:20	0x80d4957		c744242c00000000	MOVL $0x0, 0x2c(SP)			
  enter_password.go:20	0x80d495f		8d0560880e08		LEAL 0x80e8860, AX			
  enter_password.go:20	0x80d4965		89442428		MOVL AX, 0x28(SP)			
  enter_password.go:20	0x80d4969		8d0da8f61008		LEAL main.statictmp_2(SB), CX		
  enter_password.go:20	0x80d496f		894c242c		MOVL CX, 0x2c(SP)			
  enter_password.go:20	0x80d4973		8d4c2428		LEAL 0x28(SP), CX			
  enter_password.go:20	0x80d4977		890c24			MOVL CX, 0(SP)				
  enter_password.go:20	0x80d497a		c744240401000000	MOVL $0x1, 0x4(SP)			
  enter_password.go:20	0x80d4982		c744240801000000	MOVL $0x1, 0x8(SP)			
  enter_password.go:20	0x80d498a		e8213bffff		CALL fmt.Println(SB)			
  enter_password.go:21	0x80d498f		8d0560880e08		LEAL 0x80e8860, AX			
  enter_password.go:21	0x80d4995		890424			MOVL AX, 0(SP)				
  enter_password.go:21	0x80d4998		e883fef7ff		CALL runtime.newobject(SB)		
  enter_password.go:21	0x80d499d		8b442404		MOVL 0x4(SP), AX			
  enter_password.go:21	0x80d49a1		89442420		MOVL AX, 0x20(SP)			
  enter_password.go:22	0x80d49a5		c744245000000000	MOVL $0x0, 0x50(SP)			
  enter_password.go:22	0x80d49ad		c744245400000000	MOVL $0x0, 0x54(SP)			
  enter_password.go:22	0x80d49b5		8d0d00130e08		LEAL 0x80e1300, CX			
  enter_password.go:22	0x80d49bb		894c2450		MOVL CX, 0x50(SP)			
  enter_password.go:22	0x80d49bf		89442454		MOVL AX, 0x54(SP)			
  enter_password.go:22	0x80d49c3		8d0db6d10f08		LEAL 0x80fd1b6, CX			
  enter_password.go:22	0x80d49c9		890c24			MOVL CX, 0(SP)				
  enter_password.go:22	0x80d49cc		c744240403000000	MOVL $0x3, 0x4(SP)			
  enter_password.go:22	0x80d49d4		8d4c2450		LEAL 0x50(SP), CX			
  enter_password.go:22	0x80d49d8		894c2408		MOVL CX, 0x8(SP)			
  enter_password.go:22	0x80d49dc		c744240c01000000	MOVL $0x1, 0xc(SP)			
  enter_password.go:22	0x80d49e4		c744241001000000	MOVL $0x1, 0x10(SP)			
  enter_password.go:22	0x80d49ec		e8afa9ffff		CALL fmt.Scanf(SB)			
  enter_password.go:17	0x80d49f1		8b442420		MOVL 0x20(SP), AX			
  enter_password.go:23	0x80d49f5		8b08			MOVL 0(AX), CX				
  enter_password.go:23	0x80d49f7		8b4004			MOVL 0x4(AX), AX			
  enter_password.go:23	0x80d49fa		890c24			MOVL CX, 0(SP)				
  enter_password.go:23	0x80d49fd		89442404		MOVL AX, 0x4(SP)			
  enter_password.go:23	0x80d4a01		e8da020000		CALL main.ambush(SB)			
  enter_password.go:24	0x80d4a06		c7042400000000		MOVL $0x0, 0(SP)			
  enter_password.go:24	0x80d4a0d		8d05a0461008		LEAL 0x81046a0, AX			
  enter_password.go:24	0x80d4a13		89442404		MOVL AX, 0x4(SP)			
  enter_password.go:24	0x80d4a17		e80463f9ff		CALL runtime.deferproc(SB)		
  enter_password.go:24	0x80d4a1c		85c0			TESTL AX, AX				
  enter_password.go:24	0x80d4a1e		750a			JNE 0x80d4a2a				
  enter_password.go:28	0x80d4a20		90			NOPL					
  enter_password.go:28	0x80d4a21		e81a6bf9ff		CALL runtime.deferreturn(SB)		
  enter_password.go:28	0x80d4a26		83c458			ADDL $0x58, SP				
  enter_password.go:28	0x80d4a29		c3			RET					
  enter_password.go:24	0x80d4a2a		90			NOPL					
  enter_password.go:24	0x80d4a2b		e8106bf9ff		CALL runtime.deferreturn(SB)		
  enter_password.go:24	0x80d4a30		83c458			ADDL $0x58, SP				
  enter_password.go:24	0x80d4a33		c3			RET					
  enter_password.go:26	0x80d4a34		c744244800000000	MOVL $0x0, 0x48(SP)			
  enter_password.go:26	0x80d4a3c		c744244c00000000	MOVL $0x0, 0x4c(SP)			
  enter_password.go:26	0x80d4a44		8d0560880e08		LEAL 0x80e8860, AX			
  enter_password.go:26	0x80d4a4a		89442448		MOVL AX, 0x48(SP)			
  enter_password.go:26	0x80d4a4e		8d05b0f61008		LEAL main.statictmp_3(SB), AX		
  enter_password.go:26	0x80d4a54		8944244c		MOVL AX, 0x4c(SP)			
  enter_password.go:26	0x80d4a58		8d442448		LEAL 0x48(SP), AX			
  enter_password.go:26	0x80d4a5c		890424			MOVL AX, 0(SP)				
  enter_password.go:26	0x80d4a5f		c744240401000000	MOVL $0x1, 0x4(SP)			
  enter_password.go:26	0x80d4a67		c744240801000000	MOVL $0x1, 0x8(SP)			
  enter_password.go:26	0x80d4a6f		e83c3affff		CALL fmt.Println(SB)			
  enter_password.go:26	0x80d4a74		ebaa			JMP 0x80d4a20				
  enter_password.go:13	0x80d4a76		e875a6fbff		CALL runtime.morestack_noctxt(SB)	
  enter_password.go:13	0x80d4a7b		e980fdffff		JMP main.main(SB)			

TEXT main.checkPassword(SB) /opt/hacksports/shared/staging/gogo_4_5078111871735553/problem_files/enter_password.go
  enter_password.go:30	0x80d4a80		658b0d00000000		MOVL GS:0, CX				
  enter_password.go:30	0x80d4a87		8b89fcffffff		MOVL 0xfffffffc(CX), CX			
  enter_password.go:30	0x80d4a8d		3b6108			CMPL 0x8(CX), SP			
  enter_password.go:30	0x80d4a90		0f86d7000000		JBE 0x80d4b6d				
  enter_password.go:30	0x80d4a96		83ec44			SUBL $0x44, SP				
  enter_password.go:30	0x80d4a99		8b4c244c		MOVL 0x4c(SP), CX			
  enter_password.go:31	0x80d4a9d		83f920			CMPL $0x20, CX				
  enter_password.go:31	0x80d4aa0		0f8cab000000		JL 0x80d4b51				
  enter_password.go:34	0x80d4aa6		8d7c2404		LEAL 0x4(SP), DI			
  enter_password.go:34	0x80d4aaa		31c0			XORL AX, AX				
  enter_password.go:34	0x80d4aac		e867c0fbff		CALL 0x8090b18				
  enter_password.go:39	0x80d4ab1		c744240438363138	MOVL $0x38313638, 0x4(SP)		
  enter_password.go:43	0x80d4ab9		c744240833366631	MOVL $0x31663633, 0x8(SP)		
  enter_password.go:47	0x80d4ac1		c744240c33653364	MOVL $0x64336533, 0xc(SP)		
  enter_password.go:51	0x80d4ac9		c744241036323764	MOVL $0x64373236, 0x10(SP)		
  enter_password.go:55	0x80d4ad1		c744241466613337	MOVL $0x37336166, 0x14(SP)		
  enter_password.go:59	0x80d4ad9		c744241835626462	MOVL $0x62646235, 0x18(SP)		
  enter_password.go:63	0x80d4ae1		c744241c38333839	MOVL $0x39383338, 0x1c(SP)		
  enter_password.go:67	0x80d4ae9		c744242032313465	MOVL $0x65343132, 0x20(SP)		
  enter_password.go:68	0x80d4af1		8d7c2424		LEAL 0x24(SP), DI			
  enter_password.go:68	0x80d4af5		8d3500fe1008		LEAL main.statictmp_4(SB), SI		
  enter_password.go:68	0x80d4afb		e8e0c4fbff		CALL 0x8090fe0				
  enter_password.go:68	0x80d4b00		8b4c2448		MOVL 0x48(SP), CX			
  enter_password.go:68	0x80d4b04		8b54244c		MOVL 0x4c(SP), DX			
  enter_password.go:68	0x80d4b08		31c0			XORL AX, AX				
  enter_password.go:68	0x80d4b0a		31db			XORL BX, BX				
  enter_password.go:70	0x80d4b0c		eb01			JMP 0x80d4b0f				
  enter_password.go:70	0x80d4b0e		40			INCL AX					
  enter_password.go:70	0x80d4b0f		83f820			CMPL $0x20, AX				
  enter_password.go:70	0x80d4b12		7d26			JGE 0x80d4b3a				
  enter_password.go:71	0x80d4b14		39d0			CMPL DX, AX				
  enter_password.go:71	0x80d4b16		734e			JAE 0x80d4b66				
  enter_password.go:71	0x80d4b18		0fb62c01		MOVZX 0(CX)(AX*1), BP			
  enter_password.go:70	0x80d4b1c		83f820			CMPL $0x20, AX				
  enter_password.go:71	0x80d4b1f		7345			JAE 0x80d4b66				
  enter_password.go:71	0x80d4b21		0fb6740404		MOVZX 0x4(SP)(AX*1), SI			
  enter_password.go:71	0x80d4b26		31f5			XORL SI, BP				
  enter_password.go:71	0x80d4b28		0fb6740424		MOVZX 0x24(SP)(AX*1), SI		
                                                    // compare
  enter_password.go:71	0x80d4b2d		95			XCHGL AX, BP				
  enter_password.go:71	0x80d4b2e		87de			XCHGL BX, SI				
  enter_password.go:71	0x80d4b30		38d8			CMPL BL, AL				
  enter_password.go:71	0x80d4b32		87de			XCHGL BX, SI				
  enter_password.go:71	0x80d4b34		95			XCHGL AX, BP				
                                                    // end compare
  enter_password.go:71	0x80d4b35		75d7			JNE 0x80d4b0e				
  enter_password.go:72	0x80d4b37		43			INCL BX					
  enter_password.go:72	0x80d4b38		ebd4			JMP 0x80d4b0e				
  enter_password.go:75	0x80d4b3a		83fb20			CMPL $0x20, BX				
  enter_password.go:75	0x80d4b3d		7509			JNE 0x80d4b48				
  enter_password.go:76	0x80d4b3f		c644245001		MOVB $0x1, 0x50(SP)			
  enter_password.go:76	0x80d4b44		83c444			ADDL $0x44, SP				
  enter_password.go:76	0x80d4b47		c3			RET					
  enter_password.go:78	0x80d4b48		c644245000		MOVB $0x0, 0x50(SP)			
  enter_password.go:78	0x80d4b4d		83c444			ADDL $0x44, SP				
  enter_password.go:78	0x80d4b50		c3			RET					
  enter_password.go:32	0x80d4b51		c7042400000000		MOVL $0x0, 0(SP)			
  enter_password.go:32	0x80d4b58		e883f3fdff		CALL os.Exit(SB)			
  enter_password.go:32	0x80d4b5d		8b4c244c		MOVL 0x4c(SP), CX			
  enter_password.go:32	0x80d4b61		e940ffffff		JMP 0x80d4aa6				
  enter_password.go:71	0x80d4b66		e8355ff9ff		CALL runtime.panicindex(SB)		
  enter_password.go:71	0x80d4b6b		0f0b			UD2					
  enter_password.go:30	0x80d4b6d		e87ea5fbff		CALL runtime.morestack_noctxt(SB)	
  enter_password.go:30	0x80d4b72		e909ffffff		JMP main.checkPassword(SB)		

TEXT main.get_flag(SB) /opt/hacksports/shared/staging/gogo_4_5078111871735553/problem_files/enter_password.go
  enter_password.go:81	0x80d4b80		658b0d00000000		MOVL GS:0, CX				
  enter_password.go:81	0x80d4b87		8b89fcffffff		MOVL 0xfffffffc(CX), CX			
  enter_password.go:81	0x80d4b8d		3b6108			CMPL 0x8(CX), SP			
  enter_password.go:81	0x80d4b90		0f86f9000000		JBE 0x80d4c8f				
  enter_password.go:81	0x80d4b96		83ec40			SUBL $0x40, SP				
  enter_password.go:82	0x80d4b99		8d0557d90f08		LEAL 0x80fd957, AX			
  enter_password.go:82	0x80d4b9f		890424			MOVL AX, 0(SP)				
  enter_password.go:82	0x80d4ba2		c744240408000000	MOVL $0x8, 0x4(SP)			
  enter_password.go:82	0x80d4baa		e861f9ffff		CALL io/ioutil.ReadFile(SB)		
  enter_password.go:82	0x80d4baf		8b442414		MOVL 0x14(SP), AX			
  enter_password.go:82	0x80d4bb3		8b4c2418		MOVL 0x18(SP), CX			
  enter_password.go:82	0x80d4bb7		8b542408		MOVL 0x8(SP), DX			
  enter_password.go:82	0x80d4bbb		89542424		MOVL DX, 0x24(SP)			
  enter_password.go:82	0x80d4bbf		8b5c240c		MOVL 0xc(SP), BX			
  enter_password.go:82	0x80d4bc3		895c241c		MOVL BX, 0x1c(SP)			
  enter_password.go:82	0x80d4bc7		8b6c2410		MOVL 0x10(SP), BP			
  enter_password.go:82	0x80d4bcb		896c2420		MOVL BP, 0x20(SP)			
  enter_password.go:83	0x80d4bcf		890424			MOVL AX, 0(SP)				
  enter_password.go:83	0x80d4bd2		894c2404		MOVL CX, 0x4(SP)			
  enter_password.go:83	0x80d4bd6		e8c5000000		CALL main.check(SB)			
  enter_password.go:84	0x80d4bdb		c7042400000000		MOVL $0x0, 0(SP)			
  enter_password.go:84	0x80d4be2		8b442424		MOVL 0x24(SP), AX			
  enter_password.go:84	0x80d4be6		89442404		MOVL AX, 0x4(SP)			
  enter_password.go:84	0x80d4bea		8b44241c		MOVL 0x1c(SP), AX			
  enter_password.go:84	0x80d4bee		89442408		MOVL AX, 0x8(SP)			
  enter_password.go:84	0x80d4bf2		8b442420		MOVL 0x20(SP), AX			
  enter_password.go:84	0x80d4bf6		8944240c		MOVL AX, 0xc(SP)			
  enter_password.go:84	0x80d4bfa		e8f1c4faff		CALL runtime.slicebytetostring(SB)	
  enter_password.go:84	0x80d4bff		8b442410		MOVL 0x10(SP), AX			
  enter_password.go:84	0x80d4c03		8b4c2414		MOVL 0x14(SP), CX			
  enter_password.go:84	0x80d4c07		89442428		MOVL AX, 0x28(SP)			
  enter_password.go:84	0x80d4c0b		894c242c		MOVL CX, 0x2c(SP)			
  enter_password.go:84	0x80d4c0f		c744243000000000	MOVL $0x0, 0x30(SP)			
  enter_password.go:84	0x80d4c17		c744243400000000	MOVL $0x0, 0x34(SP)			
  enter_password.go:84	0x80d4c1f		c744243800000000	MOVL $0x0, 0x38(SP)			
  enter_password.go:84	0x80d4c27		c744243c00000000	MOVL $0x0, 0x3c(SP)			
  enter_password.go:84	0x80d4c2f		8d0560880e08		LEAL 0x80e8860, AX			
  enter_password.go:84	0x80d4c35		89442430		MOVL AX, 0x30(SP)			
  enter_password.go:84	0x80d4c39		8d0db8f61008		LEAL main.statictmp_5(SB), CX		
  enter_password.go:84	0x80d4c3f		894c2434		MOVL CX, 0x34(SP)			
  enter_password.go:84	0x80d4c43		890424			MOVL AX, 0(SP)				
  enter_password.go:84	0x80d4c46		8d442428		LEAL 0x28(SP), AX			
  enter_password.go:84	0x80d4c4a		89442404		MOVL AX, 0x4(SP)			
  enter_password.go:84	0x80d4c4e		e80dd9f7ff		CALL runtime.convT2Estring(SB)		
  enter_password.go:84	0x80d4c53		8b442408		MOVL 0x8(SP), AX			
  enter_password.go:84	0x80d4c57		8b4c240c		MOVL 0xc(SP), CX			
  enter_password.go:84	0x80d4c5b		89442438		MOVL AX, 0x38(SP)			
  enter_password.go:84	0x80d4c5f		894c243c		MOVL CX, 0x3c(SP)			
  enter_password.go:84	0x80d4c63		8d442430		LEAL 0x30(SP), AX			
  enter_password.go:84	0x80d4c67		890424			MOVL AX, 0(SP)				
  enter_password.go:84	0x80d4c6a		c744240402000000	MOVL $0x2, 0x4(SP)			
  enter_password.go:84	0x80d4c72		c744240802000000	MOVL $0x2, 0x8(SP)			
  enter_password.go:84	0x80d4c7a		e83138ffff		CALL fmt.Println(SB)			
  enter_password.go:85	0x80d4c7f		c7042400000000		MOVL $0x0, 0(SP)			
  enter_password.go:85	0x80d4c86		e855f2fdff		CALL os.Exit(SB)			
  enter_password.go:86	0x80d4c8b		83c440			ADDL $0x40, SP				
  enter_password.go:86	0x80d4c8e		c3			RET					
  enter_password.go:81	0x80d4c8f		e85ca4fbff		CALL runtime.morestack_noctxt(SB)	
  enter_password.go:81	0x80d4c94		e9e7feffff		JMP main.get_flag(SB)			

TEXT main.check(SB) /opt/hacksports/shared/staging/gogo_4_5078111871735553/problem_files/enter_password.go
  enter_password.go:88	0x80d4ca0		658b0d00000000		MOVL GS:0, CX				
  enter_password.go:88	0x80d4ca7		8b89fcffffff		MOVL 0xfffffffc(CX), CX			
  enter_password.go:88	0x80d4cad		3b6108			CMPL 0x8(CX), SP			
  enter_password.go:88	0x80d4cb0		7626			JBE 0x80d4cd8				
  enter_password.go:88	0x80d4cb2		83ec08			SUBL $0x8, SP				
  enter_password.go:88	0x80d4cb5		8b44240c		MOVL 0xc(SP), AX			
  enter_password.go:89	0x80d4cb9		85c0			TESTL AX, AX				
  enter_password.go:89	0x80d4cbb		7504			JNE 0x80d4cc1				
  enter_password.go:89	0x80d4cbd		83c408			ADDL $0x8, SP				
  enter_password.go:89	0x80d4cc0		c3			RET					
  enter_password.go:90	0x80d4cc1		7403			JE 0x80d4cc6				
  enter_password.go:90	0x80d4cc3		8b4004			MOVL 0x4(AX), AX			
  enter_password.go:90	0x80d4cc6		890424			MOVL AX, 0(SP)				
  enter_password.go:90	0x80d4cc9		8b442410		MOVL 0x10(SP), AX			
  enter_password.go:90	0x80d4ccd		89442404		MOVL AX, 0x4(SP)			
  enter_password.go:90	0x80d4cd1		e81a6cf9ff		CALL runtime.gopanic(SB)		
  enter_password.go:90	0x80d4cd6		0f0b			UD2					
  enter_password.go:88	0x80d4cd8		e813a4fbff		CALL runtime.morestack_noctxt(SB)	
  enter_password.go:88	0x80d4cdd		ebc1			JMP main.check(SB)			

TEXT main.ambush(SB) /opt/hacksports/shared/staging/gogo_4_5078111871735553/problem_files/enter_password.go
  enter_password.go:94	0x80d4ce0		658b0d00000000		MOVL GS:0, CX				
  enter_password.go:94	0x80d4ce7		8b89fcffffff		MOVL 0xfffffffc(CX), CX			
  enter_password.go:94	0x80d4ced		8d4424ec		LEAL -0x14(SP), AX			
  enter_password.go:94	0x80d4cf1		3b4108			CMPL 0x8(CX), AX			
  enter_password.go:94	0x80d4cf4		0f864c010000		JBE 0x80d4e46				
  enter_password.go:94	0x80d4cfa		81ec94000000		SUBL $0x94, SP				
  enter_password.go:95	0x80d4d00		8d442454		LEAL 0x54(SP), AX			
  enter_password.go:95	0x80d4d04		890424			MOVL AX, 0(SP)				
  enter_password.go:94	0x80d4d07		8b842498000000		MOVL 0x98(SP), AX			
  enter_password.go:95	0x80d4d0e		89442404		MOVL AX, 0x4(SP)			
  enter_password.go:94	0x80d4d12		8b84249c000000		MOVL 0x9c(SP), AX			
  enter_password.go:95	0x80d4d19		89442408		MOVL AX, 0x8(SP)			
  enter_password.go:95	0x80d4d1d		e8eec4faff		CALL runtime.stringtoslicebyte(SB)	
  enter_password.go:95	0x80d4d22		8b44240c		MOVL 0xc(SP), AX			
  enter_password.go:95	0x80d4d26		8b4c2410		MOVL 0x10(SP), CX			
  enter_password.go:95	0x80d4d2a		8b542414		MOVL 0x14(SP), DX			
  enter_password.go:96	0x80d4d2e		890424			MOVL AX, 0(SP)				
  enter_password.go:96	0x80d4d31		894c2404		MOVL CX, 0x4(SP)			
  enter_password.go:96	0x80d4d35		89542408		MOVL DX, 0x8(SP)			
  enter_password.go:96	0x80d4d39		e862e1fcff		CALL crypto/md5.Sum(SB)			
  enter_password.go:96	0x80d4d3e		8d74240c		LEAL 0xc(SP), SI			
  enter_password.go:96	0x80d4d42		8d7c2424		LEAL 0x24(SP), DI			
  enter_password.go:96	0x80d4d46		e8bdc2fbff		CALL 0x8091008				
  enter_password.go:98	0x80d4d4b		8d7c2434		LEAL 0x34(SP), DI			
  enter_password.go:98	0x80d4d4f		31c0			XORL AX, AX				
  enter_password.go:98	0x80d4d51		e8c2bdfbff		CALL 0x8090b18				
  enter_password.go:103	0x80d4d56		c744243438363138	MOVL $0x38313638, 0x34(SP)		
  enter_password.go:107	0x80d4d5e		c744243833366631	MOVL $0x31663633, 0x38(SP)		
  enter_password.go:111	0x80d4d66		c744243c33653364	MOVL $0x64336533, 0x3c(SP)		
  enter_password.go:115	0x80d4d6e		c744244036323764	MOVL $0x64373236, 0x40(SP)		
  enter_password.go:119	0x80d4d76		c744244466613337	MOVL $0x37336166, 0x44(SP)		
  enter_password.go:123	0x80d4d7e		c744244835626462	MOVL $0x62646235, 0x48(SP)		
  enter_password.go:127	0x80d4d86		c744244c38333839	MOVL $0x39383338, 0x4c(SP)		
  enter_password.go:131	0x80d4d8e		c744245032313465	MOVL $0x65343132, 0x50(SP)		
  enter_password.go:131	0x80d4d96		31c0			XORL AX, AX				
  enter_password.go:133	0x80d4d98		eb03			JMP 0x80d4d9d				
  enter_password.go:133	0x80d4d9a		8d4201			LEAL 0x1(DX), AX			
  enter_password.go:133	0x80d4d9d		83f810			CMPL $0x10, AX				
  enter_password.go:133	0x80d4da0		0f8d92000000		JGE 0x80d4e38				
  enter_password.go:133	0x80d4da6		89442420		MOVL AX, 0x20(SP)			
  enter_password.go:134	0x80d4daa		8d442424		LEAL 0x24(SP), AX			
  enter_password.go:134	0x80d4dae		890424			MOVL AX, 0(SP)				
  enter_password.go:134	0x80d4db1		c744240410000000	MOVL $0x10, 0x4(SP)			
  enter_password.go:134	0x80d4db9		c744240810000000	MOVL $0x10, 0x8(SP)			
  enter_password.go:134	0x80d4dc1		e80af3ffff		CALL encoding/hex.EncodeToString(SB)	
  enter_password.go:134	0x80d4dc6		8b442410		MOVL 0x10(SP), AX			
  enter_password.go:134	0x80d4dca		8b4c240c		MOVL 0xc(SP), CX			
  enter_password.go:134	0x80d4dce		8b542420		MOVL 0x20(SP), DX			
  enter_password.go:134	0x80d4dd2		39c2			CMPL AX, DX				
  enter_password.go:134	0x80d4dd4		7369			JAE 0x80d4e3f				
  enter_password.go:134	0x80d4dd6		0fb6040a		MOVZX 0(DX)(CX*1), AX			
  enter_password.go:134	0x80d4dda		8844241f		MOVB AL, 0x1f(SP)			
  enter_password.go:134	0x80d4dde		8d4c2474		LEAL 0x74(SP), CX			
  enter_password.go:134	0x80d4de2		890c24			MOVL CX, 0(SP)				
  enter_password.go:134	0x80d4de5		8d4c2434		LEAL 0x34(SP), CX			
  enter_password.go:134	0x80d4de9		894c2404		MOVL CX, 0x4(SP)			
  enter_password.go:134	0x80d4ded		c744240820000000	MOVL $0x20, 0x8(SP)			
  enter_password.go:134	0x80d4df5		c744240c20000000	MOVL $0x20, 0xc(SP)			
  enter_password.go:134	0x80d4dfd		e8eec2faff		CALL runtime.slicebytetostring(SB)	
  enter_password.go:134	0x80d4e02		8b442414		MOVL 0x14(SP), AX			
  enter_password.go:134	0x80d4e06		8b4c2410		MOVL 0x10(SP), CX			
  enter_password.go:134	0x80d4e0a		8b542420		MOVL 0x20(SP), DX			
  enter_password.go:134	0x80d4e0e		39c2			CMPL AX, DX				
  enter_password.go:134	0x80d4e10		732d			JAE 0x80d4e3f				
  enter_password.go:134	0x80d4e12		0fb60411		MOVZX 0(CX)(DX*1), AX			
  enter_password.go:134	0x80d4e16		0fb64c241f		MOVZX 0x1f(SP), CX			
  enter_password.go:134	0x80d4e1b		38c1			CMPL AL, CL				
  enter_password.go:134	0x80d4e1d		0f8477ffffff		JE 0x80d4d9a				
  enter_password.go:135	0x80d4e23		c7042400000000		MOVL $0x0, 0(SP)			
  enter_password.go:135	0x80d4e2a		e8b1f0fdff		CALL os.Exit(SB)			
  enter_password.go:135	0x80d4e2f		8b542420		MOVL 0x20(SP), DX			
  enter_password.go:135	0x80d4e33		e962ffffff		JMP 0x80d4d9a				
  enter_password.go:135	0x80d4e38		81c494000000		ADDL $0x94, SP				
  enter_password.go:135	0x80d4e3e		c3			RET					
  enter_password.go:134	0x80d4e3f		e85c5cf9ff		CALL runtime.panicindex(SB)		
  enter_password.go:134	0x80d4e44		0f0b			UD2					
  enter_password.go:94	0x80d4e46		e8a5a2fbff		CALL runtime.morestack_noctxt(SB)	
  enter_password.go:94	0x80d4e4b		e990feffff		JMP main.ambush(SB)			

TEXT main.init(SB) <autogenerated>
  <autogenerated>:1	0x80d4e50		658b0d00000000		MOVL GS:0, CX				
  <autogenerated>:1	0x80d4e57		8b89fcffffff		MOVL 0xfffffffc(CX), CX			
  <autogenerated>:1	0x80d4e5d		3b6108			CMPL 0x8(CX), SP			
  <autogenerated>:1	0x80d4e60		763e			JBE 0x80d4ea0				
  <autogenerated>:1	0x80d4e62		0fb6050af71708		MOVZX main.initdone.(SB), AX		
  <autogenerated>:1	0x80d4e69		80f801			CMPL $0x1, AL				
  <autogenerated>:1	0x80d4e6c		7601			JBE 0x80d4e6f				
  <autogenerated>:1	0x80d4e6e		c3			RET					
  <autogenerated>:1	0x80d4e6f		7507			JNE 0x80d4e78				
  <autogenerated>:1	0x80d4e71		e86a5ef9ff		CALL runtime.throwinit(SB)		
  <autogenerated>:1	0x80d4e76		0f0b			UD2					
  <autogenerated>:1	0x80d4e78		c6050af7170801		MOVB $0x1, main.initdone.(SB)		
  <autogenerated>:1	0x80d4e7f		e86ce1fcff		CALL crypto/md5.init(SB)		
  <autogenerated>:1	0x80d4e84		e807f3ffff		CALL encoding/hex.init(SB)		
  <autogenerated>:1	0x80d4e89		e8c2edffff		CALL fmt.init(SB)			
  <autogenerated>:1	0x80d4e8e		e8fdf8ffff		CALL io/ioutil.init(SB)			
  <autogenerated>:1	0x80d4e93		e838f9fdff		CALL os.init(SB)			
  <autogenerated>:1	0x80d4e98		c6050af7170802		MOVB $0x2, main.initdone.(SB)		
  <autogenerated>:1	0x80d4e9f		c3			RET					
  <autogenerated>:1	0x80d4ea0		e84ba2fbff		CALL runtime.morestack_noctxt(SB)	
  <autogenerated>:1	0x80d4ea5		eba9			JMP main.init(SB)			
