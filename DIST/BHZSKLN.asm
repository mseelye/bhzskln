;-------------------------------------------
; Segment Information
; Number of Code/Data Segments = 4
;-------------------------------------------
; Segment #0001	Offset: 00000200	Size: 0772	 Flags: 0x0D00 -> CODE, FIXED
; Segment #0002	Offset: 00000E00	Size: 00DD	 Flags: 0x0D21 -> DATA, FIXED
; Segment #0003	Offset: 00001000	Size: 0095	 Flags: 0x0C21 -> DATA, FIXED
; Segment #0004	Offset: 00000000	Size: 0000	 Flags: 0x0C21 -> DATA, FIXED
;-------------------------------------------
; Entry Table Information
; Number of Entry Table Functions = 1
;-------------------------------------------
; Addr:0001.01A8	Ord:0001d	Name: _INIT__BHZSKLN
;-------------------------------------------
; Start of Code for Segment 1
; FILE_OFFSET:SEG_NUM.SEG_OFFSET BYTES DISASSEMBLY
;-------------------------------------------
00000200h:0001.0000h 1E              push ds
00000201h:0001.0001h 55              push bp
00000202h:0001.0002h 56              push si
00000203h:0001.0003h 57              push di
00000204h:0001.0004h BA0000          mov dx, 0x0              ; SEG ADDR of Segment 3
00000207h:0001.0007h B462            mov ah, 0x62
00000209h:0001.0009h CD21            int 0x21
0000020Bh:0001.000Bh 8EC3            mov es, bx
0000020Dh:0001.000Dh 8EDB            mov ds, bx
0000020Fh:0001.000Fh 0E              push cs
00000210h:0001.0010h 68FFFF          push 0xffff              ; SEG ADDR of Segment 3
00000213h:0001.0013h 687700          push 0x77
00000216h:0001.0016h 9AFFFF0000      call word 0x0:0xffff
0000021Bh:0001.001Bh 0BC0            or ax, ax
0000021Dh:0001.001Dh 7402            jz 0x21
0000021Fh:0001.001Fh EB58            jmp 0x79
00000221h:0001.0021h 06              push es                  ; Conditional jump from 0001:001Dh
00000222h:0001.0022h B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 3
00000225h:0001.0025h 8EC0            mov es, ax
00000227h:0001.0027h 268E067700      mov es, [es:0x77]
0000022Ch:0001.002Ch 26C706A4010000  mov word [es:0x1a4], 0x0
00000233h:0001.0033h 07              pop es
00000234h:0001.0034h B430            mov ah, 0x30
00000236h:0001.0036h CD21            int 0x21
00000238h:0001.0038h 8B1E2C00        mov bx, [0x2c]
0000023Ch:0001.003Ch 8EDA            mov ds, dx
0000023Eh:0001.003Eh A38100          mov [0x81], ax
00000241h:0001.0041h 8C067F00        mov [0x7f], es
00000245h:0001.0045h 891E7B00        mov [0x7b], bx
00000249h:0001.0049h C43E7900        les di, [0x79]
0000024Dh:0001.004Dh 8BC7            mov ax, di
0000024Fh:0001.004Fh 8BD8            mov bx, ax
00000251h:0001.0051h B9FF7F          mov cx, 0x7fff
00000254h:0001.0054h FC              cld
00000255h:0001.0055h F2AE            repne scasb              ; Conditional jump from 0001:005Dh
00000257h:0001.0057h E320            jcxz 0x79
00000259h:0001.0059h 43              inc bx
0000025Ah:0001.005Ah 263805          cmp [es:di], al
0000025Dh:0001.005Dh 75F6            jnz 0x55
0000025Fh:0001.005Fh 80CD80          or ch, 0x80
00000262h:0001.0062h F7D9            neg cx
00000264h:0001.0064h 890E7900        mov [0x79], cx
00000268h:0001.0068h B90200          mov cx, 0x2
0000026Bh:0001.006Bh D3E3            shl bx, cl
0000026Dh:0001.006Dh 83C310          add bx, 0x10
00000270h:0001.0070h 83E3F0          and bx, 0xfff0
00000273h:0001.0073h 891E7D00        mov [0x7d], bx
00000277h:0001.0077h EB05            jmp 0x7e
00000279h:0001.0079h B80000          mov ax, 0x0              ; Conditional jump from 0001:0057h
                                                              ; Unconditional jump from 0001:001Fh
0000027Ch:0001.007Ch EB38            jmp 0xb6
0000027Eh:0001.007Eh 8CDA            mov dx, ds               ; Unconditional jump from 0001:0077h
00000280h:0001.0080h B400            mov ah, 0x0
00000282h:0001.0082h CD1A            int 0x1a
00000284h:0001.0084h 89168500        mov [0x85], dx
00000288h:0001.0088h 890E8700        mov [0x87], cx
0000028Ch:0001.008Ch 33ED            xor bp, bp
0000028Eh:0001.008Eh B80000          mov ax, 0x0              ; SEG ADDR of Segment 3
00000291h:0001.0091h 8ED8            mov ds, ax
00000293h:0001.0093h BE9600          mov si, 0x96
00000296h:0001.0096h BF9600          mov di, 0x96
00000299h:0001.0099h E8A700          call 0x143
0000029Ch:0001.009Ch 2E8E1EA401      mov ds, [cs:0x1a4]
000002A1h:0001.00A1h 06              push es
000002A2h:0001.00A2h 8E067700        mov es, [0x77]
000002A6h:0001.00A6h 26C606550172    mov byte [es:0x155], 0x72
000002ACh:0001.00ACh 26C606440100    mov byte [es:0x144], 0x0
000002B2h:0001.00B2h 07              pop es
000002B3h:0001.00B3h B80100          mov ax, 0x1
000002B6h:0001.00B6h 5F              pop di                   ; Unconditional jump from 0001:007Ch
000002B7h:0001.00B7h 5E              pop si
000002B8h:0001.00B8h 5D              pop bp
000002B9h:0001.00B9h 1F              pop ds
000002BAh:0001.00BAh CB              retf
000002BBh:0001.00BBh 2E8E06A401      mov es, [cs:0x1a4]       ; /---- BEGIN SUBROUTINE 1
000002C0h:0001.00C0h 56              push si
000002C1h:0001.00C1h 57              push di
000002C2h:0001.00C2h BE9600          mov si, 0x96
000002C5h:0001.00C5h BF9600          mov di, 0x96
000002C8h:0001.00C8h E87800          call 0x143
000002CBh:0001.00CBh 5F              pop di
000002CCh:0001.00CCh 5E              pop si
000002CDh:0001.00CDh CB              retf                     ; \---- END SUBROUTINE 1
000002CEh:0001.00CEh CB              retf                     ; /---- BEGIN SUBROUTINE 2
000002CFh:0001.00CFh 8BEC            mov bp, sp               ; /---- BEGIN SUBROUTINE 3
000002D1h:0001.00D1h B44C            mov ah, 0x4c
000002D3h:0001.00D3h 8A4604          mov al, [bp+0x4]
000002D6h:0001.00D6h CD21            int 0x21
000002D8h:0001.00D8h B80000          mov ax, 0x0              ; SEG ADDR of Segment 3
000002DBh:0001.00DBh 8ED8            mov ds, ax
000002DDh:0001.00DDh BE9600          mov si, 0x96
000002E0h:0001.00E0h BF9600          mov di, 0x96
000002E3h:0001.00E3h E85D00          call 0x143
000002E6h:0001.00E6h 2E8E1EA401      mov ds, [cs:0x1a4]
000002EBh:0001.00EBh FF1E0000        call far word [0x0]
000002EFh:0001.00EFh FF1E0000        call far word [0x0]
000002F3h:0001.00F3h FF1E0000        call far word [0x0]
000002F7h:0001.00F7h 50              push ax
000002F8h:0001.00F8h 2E8E1EA401      mov ds, [cs:0x1a4]       ; /---- BEGIN SUBROUTINE 4
                                                              ; Referenced by CALL at address: 0001.01A1h 
000002FDh:0001.00FDh 0E              push cs
000002FEh:0001.00FEh E82200          call 0x123
00000301h:0001.0101h 8BEC            mov bp, sp
00000303h:0001.0103h B44C            mov ah, 0x4c
00000305h:0001.0105h 8A4604          mov al, [bp+0x4]
00000308h:0001.0108h CD21            int 0x21
0000030Ah:0001.010Ah B90E00          mov cx, 0xe
0000030Dh:0001.010Dh BA2F00          mov dx, 0x2f             ; Possible String reference from SEG 3 -> "Divide error
Abnormal program termination
"
00000310h:0001.0110h E98100          jmp 0x194
00000313h:0001.0113h 6A00            push 0x0
00000315h:0001.0115h 0E              push cs
00000316h:0001.0116h 680A01          push 0x10a
00000319h:0001.0119h 1E              push ds
0000031Ah:0001.011Ah 685D00          push 0x5d
0000031Dh:0001.011Dh 9AFFFF0000      call word 0x0:0xffff     ; USHORT rc = DosSetVec(USHORT VecNum, PFN Routine, PFN PrevAddress);
                                                              ; Registers handler for hardware exception
                                                              ; The DosSetVec process is analogous to setting an address in the interrupt vector table when running in 8086 mode.
00000322h:0001.0122h C3              ret                      ; \---- END SUBROUTINE 4
00000323h:0001.0123h 1E              push ds                  ; /---- BEGIN SUBROUTINE 5
                                                              ; Referenced by CALL at address: 0001.00FEh 
00000324h:0001.0124h 2E8E1EA401      mov ds, [cs:0x1a4]
00000329h:0001.0129h 50              push ax
0000032Ah:0001.012Ah 50              push ax
0000032Bh:0001.012Bh 8BC4            mov ax, sp
0000032Dh:0001.012Dh 6A00            push 0x0
0000032Fh:0001.012Fh FF365F00        push word [0x5f]
00000333h:0001.0133h FF365D00        push word [0x5d]
00000337h:0001.0137h 16              push ss
00000338h:0001.0138h 50              push ax
00000339h:0001.0139h 9AFFFF0000      call word 0x0:0xffff     ; USHORT rc = DosSetVec(USHORT VecNum, PFN Routine, PFN PrevAddress);
                                                              ; Registers handler for hardware exception
                                                              ; The DosSetVec process is analogous to setting an address in the interrupt vector table when running in 8086 mode.
0000033Eh:0001.013Eh 83C404          add sp, 0x4
00000341h:0001.0141h 1F              pop ds
00000342h:0001.0142h CB              retf                     ; \---- END SUBROUTINE 5
00000343h:0001.0143h B4FF            mov ah, 0xff             ; /---- BEGIN SUBROUTINE 6
                                                              ; Referenced by CALL at address: 0001.00E3h 
                                                              ; Referenced by CALL at address: 0001.00C8h 
                                                              ; Referenced by CALL at address: 0001.0099h 
                                                              ; Unconditional jump from 0001:0183h
                                                              ; Unconditional jump from 0001:017Ch
00000345h:0001.0145h 8BD7            mov dx, di
00000347h:0001.0147h 8BDE            mov bx, si
00000349h:0001.0149h 3BDF            cmp bx, di               ; Unconditional jump from 0001:015Fh
0000034Bh:0001.014Bh 7414            jz 0x161
0000034Dh:0001.014Dh 803FFF          cmp byte [bx], 0xff
00000350h:0001.0150h 740A            jz 0x15c
00000352h:0001.0152h 386701          cmp [bx+0x1], ah
00000355h:0001.0155h 7705            ja 0x15c
00000357h:0001.0157h 8A6701          mov ah, [bx+0x1]
0000035Ah:0001.015Ah 8BD3            mov dx, bx
0000035Ch:0001.015Ch 83C306          add bx, 0x6              ; Conditional jump from 0001:0155h
                                                              ; Conditional jump from 0001:0150h
0000035Fh:0001.015Fh EBE8            jmp 0x149
00000361h:0001.0161h 3BD7            cmp dx, di               ; Conditional jump from 0001:014Bh
00000363h:0001.0163h 7420            jz 0x185
00000365h:0001.0165h 8BDA            mov bx, dx
00000367h:0001.0167h 1E              push ds
00000368h:0001.0168h 07              pop es
00000369h:0001.0169h 06              push es
0000036Ah:0001.016Ah 803F00          cmp byte [bx], 0x0
0000036Dh:0001.016Dh C607FF          mov byte [bx], 0xff
00000370h:0001.0170h 2E8E1EA401      mov ds, [cs:0x1a4]
00000375h:0001.0175h 7407            jz 0x17e
00000377h:0001.0177h 26FF5F02        call far word [es:bx+0x2]
0000037Bh:0001.017Bh 1F              pop ds
0000037Ch:0001.017Ch EBC5            jmp 0x143
0000037Eh:0001.017Eh 26FF5702        call word [es:bx+0x2]    ; Conditional jump from 0001:0175h
00000382h:0001.0182h 1F              pop ds
00000383h:0001.0183h EBBE            jmp 0x143
00000385h:0001.0185h C3              ret                      ; \---- END SUBROUTINE 6
                                                              ; Conditional jump from 0001:0163h
00000386h:0001.0186h B440            mov ah, 0x40             ; /---- BEGIN SUBROUTINE 7
                                                              ; Referenced by CALL at address: 0001.0199h 
00000388h:0001.0188h BB0200          mov bx, 0x2
0000038Bh:0001.018Bh CD21            int 0x21
0000038Dh:0001.018Dh C3              ret                      ; \---- END SUBROUTINE 7
0000038Eh:0001.018Eh B91E00          mov cx, 0x1e             ; /---- BEGIN SUBROUTINE 8
00000391h:0001.0191h BA3D00          mov dx, 0x3d
00000394h:0001.0194h 2E8E1EA401      mov ds, [cs:0x1a4]       ; Unconditional jump from 0001:0110h
00000399h:0001.0199h E8EAFF          call 0x186
0000039Ch:0001.019Ch B80300          mov ax, 0x3
0000039Fh:0001.019Fh 50              push ax
000003A0h:0001.01A0h 0E              push cs
000003A1h:0001.01A1h E854FF          call 0xf8
000003A4h:0001.01A4h 0000            add [bx+si], al
000003A6h:0001.01A6h 05C01E          add ax, 0x1ec0
000003A9h:0001.01A9h B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
000003ACh:0001.01ACh 8ED8            mov ds, ax
000003AEh:0001.01AEh 9AFFFF0000      call word 0x0:0xffff     ; CALL 0001.01B5h (Relocation)
000003B3h:0001.01B3h 1F              pop ds
000003B4h:0001.01B4h CB              retf                     ; \---- END SUBROUTINE 8
000003B5h:0001.01B5h 1E              push ds                  ; /---- BEGIN SUBROUTINE 9
                                                              ; Referenced by CALL at address: 0001.01AEh (Relocation)
000003B6h:0001.01B6h B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
000003B9h:0001.01B9h 8ED8            mov ds, ax
000003BBh:0001.01BBh 6A19            push 0x19
000003BDh:0001.01BDh 1E              push ds
000003BEh:0001.01BEh 685400          push 0x54                ; Possible String reference from SEG 2 -> "BHZSKLN.MDF"
000003C1h:0001.01C1h 9AFFFF0000      call word 0x0:0xffff     ; char *gmdnam(char *mdfnam);
                                                              ; Get's a module's name from the specified .MDF file
000003C6h:0001.01C6h 83C404          add sp, 0x4
000003C9h:0001.01C9h 52              push dx
000003CAh:0001.01CAh 50              push ax
000003CBh:0001.01CBh 1E              push ds
000003CCh:0001.01CCh 680000          push 0x0
000003CFh:0001.01CFh 9AFFFF0000      call word 0x0:0xffff     ; stzcpy(char *dest, char *source, int nbytes);
                                                              ; Copies a string with a limit
000003D4h:0001.01D4h 83C40A          add sp, 0xa
000003D7h:0001.01D7h 1E              push ds
000003D8h:0001.01D8h 680000          push 0x0
000003DBh:0001.01DBh 9AFFFF0000      call word 0x0:0xffff     ; int register_module(struct module *mod);
                                                              ; Registers the Module with the MajorBBS system
000003E0h:0001.01E0h 83C404          add sp, 0x4
000003E3h:0001.01E3h A35200          mov [0x52], ax           ; Return value saved to 0x52h
                                                              ; Value of usrptr->state whenever user will in 'in' this module
000003E6h:0001.01E6h 1E              push ds
000003E7h:0001.01E7h 686000          push 0x60                ; Possible String reference from SEG 2 -> "BHZSKLN.MCV"
000003EAh:0001.01EAh 9AFFFF0000      call word 0x0:0xffff     ; FILE *mbkprt=opnmsg(char *fileName)
                                                              ; Opens the specified CNF file (.MCV in runtime form)
                                                              ; Prior PUSH contains file name reference
000003EFh:0001.01EFh 83C404          add sp, 0x4
000003F2h:0001.01F2h 89163F00        mov [0x3f], dx
000003F6h:0001.01F6h A33D00          mov [0x3d], ax
000003F9h:0001.01F9h 6A78            push 0x78
000003FBh:0001.01FBh 1E              push ds
000003FCh:0001.01FCh 686C00          push 0x6c                ; Possible String reference from SEG 2 -> "BHZSKLN.DAT"
000003FFh:0001.01FFh 9AFFFF0000      call word 0x0:0xffff     ; BTVFILE *bbptr=opnbtv(char *filnae, int reclen);
                                                              ; Opens a Btrieve file for I/O
00000404h:0001.0204h 83C406          add sp, 0x6
00000407h:0001.0207h 89164300        mov [0x43], dx
0000040Bh:0001.020Bh A34100          mov [0x41], ax
0000040Eh:0001.020Eh FF363F00        push word [0x3f]
00000412h:0001.0212h FF363D00        push word [0x3d]
00000416h:0001.0216h 9AFFFF0000      call word 0x0:0xffff     ; FILE *setmbk(mbkptr);
                                                              ; Sets the 'current' MCV file block pointer
0000041Bh:0001.021Bh 83C404          add sp, 0x4
0000041Eh:0001.021Eh 6A03            push 0x3
00000420h:0001.0220h 9AFFFF0000      call word 0x0:0xffff     ; char *bufard=getmsg(msgnum);
                                                              ; Read value of CNF option
00000425h:0001.0225h 59              pop cx
00000426h:0001.0226h 52              push dx
00000427h:0001.0227h 50              push ax
00000428h:0001.0228h 1E              push ds
00000429h:0001.0229h 688900          push 0x89                ; Possible String reference from SEG 2 -> "v1.1.0"
0000042Ch:0001.022Ch 1E              push ds
0000042Dh:0001.022Dh 680000          push 0x0
00000430h:0001.0230h 1E              push ds
00000431h:0001.0231h 687800          push 0x78                ; Possible String reference from SEG 2 -> "%s %s %s"
00000434h:0001.0234h 9AFFFF0000      call word 0x0:0xffff     ; char *sprstg=spr(char *ctlstg, TYPE p1, TYPE p2,...,pn);
                                                              ; sprintf-like string formatter utility
                                                              ; Main differentiation is that spr() supports long integer and floating point conversions
00000439h:0001.0239h 83C410          add sp, 0x10
0000043Ch:0001.023Ch 52              push dx
0000043Dh:0001.023Dh 50              push ax
0000043Eh:0001.023Eh 6A03            push 0x3
00000440h:0001.0240h 9AFFFF0000      call word 0x0:0xffff     ; char *bufard=getmsg(msgnum);
                                                              ; Read value of CNF option
00000445h:0001.0245h 59              pop cx
00000446h:0001.0246h 52              push dx
00000447h:0001.0247h 50              push ax
00000448h:0001.0248h 1E              push ds
00000449h:0001.0249h 688900          push 0x89                ; Possible String reference from SEG 2 -> "v1.1.0"
0000044Ch:0001.024Ch 1E              push ds
0000044Dh:0001.024Dh 688100          push 0x81                ; Possible String reference from SEG 2 -> "BHZSKLN"
00000450h:0001.0250h 1E              push ds
00000451h:0001.0251h 687800          push 0x78                ; Possible String reference from SEG 2 -> "%s %s %s"
00000454h:0001.0254h 9AFFFF0000      call word 0x0:0xffff     ; char *sprstg=spr(char *ctlstg, TYPE p1, TYPE p2,...,pn);
                                                              ; sprintf-like string formatter utility
                                                              ; Main differentiation is that spr() supports long integer and floating point conversions
00000459h:0001.0259h 83C410          add sp, 0x10
0000045Ch:0001.025Ch 52              push dx
0000045Dh:0001.025Dh 50              push ax
0000045Eh:0001.025Eh 9AFFFF0000      call word 0x0:0xffff     ; void shocst(char *summary, char *detail, p1, p1,...,pn);
                                                              ; Displays a message in the Audit Trail
                                                              ; (summary max length = 32, detail max length = 64)
00000463h:0001.0263h 83C408          add sp, 0x8
00000466h:0001.0266h 9AFFFF0000      call word 0x0:0xffff     ; rstmbk();
                                                              ; Restore previous MCV file block ptr from before last setmbk() call
0000046Bh:0001.026Bh 1F              pop ds
0000046Ch:0001.026Ch CB              retf                     ; \---- END SUBROUTINE 9
0000046Dh:0001.026Dh 55              push bp                  ; /---- BEGIN SUBROUTINE 10
                                                              ; Referenced by CALL at address: 0001.03B0h 
0000046Eh:0001.026Eh 8BEC            mov bp, sp
00000470h:0001.0270h 1E              push ds
00000471h:0001.0271h B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
00000474h:0001.0274h 8ED8            mov ds, ax
00000476h:0001.0276h 6A1E            push 0x1e
00000478h:0001.0278h B8FFFF          mov ax, 0xffff           ; struct usracc *usaptr;
                                                              ; Points to that channel's 'usracc' struct
0000047Bh:0001.027Bh 8EC0            mov es, ax
0000047Dh:0001.027Dh 26FF360200      push word [es:0x2]
00000482h:0001.0282h 26FF360000      push word [es:0x0]
00000487h:0001.0287h 8B4606          mov ax, [bp+0x6]
0000048Ah:0001.028Ah 050400          add ax, 0x4
0000048Dh:0001.028Dh FF7608          push word [bp+0x8]
00000490h:0001.0290h 50              push ax
00000491h:0001.0291h 9AFFFF0000      call word 0x0:0xffff     ; stzcpy(char *dest, char *source, int nbytes);
                                                              ; Copies a string with a limit
00000496h:0001.0296h 83C40A          add sp, 0xa
00000499h:0001.0299h 8B4606          mov ax, [bp+0x6]
0000049Ch:0001.029Ch 052A00          add ax, 0x2a
0000049Fh:0001.029Fh FF7608          push word [bp+0x8]
000004A2h:0001.02A2h 50              push ax
000004A3h:0001.02A3h 8B4606          mov ax, [bp+0x6]
000004A6h:0001.02A6h 052200          add ax, 0x22
000004A9h:0001.02A9h FF7608          push word [bp+0x8]
000004ACh:0001.02ACh 50              push ax
000004ADh:0001.02ADh 8B4606          mov ax, [bp+0x6]
000004B0h:0001.02B0h 050400          add ax, 0x4
000004B3h:0001.02B3h FF7608          push word [bp+0x8]
000004B6h:0001.02B6h 50              push ax
000004B7h:0001.02B7h C45E06          les bx, [bp+0x6]
000004BAh:0001.02BAh 26FF7702        push word [es:bx+0x2]
000004BEh:0001.02BEh C45E06          les bx, [bp+0x6]
000004C1h:0001.02C1h 26FF7702        push word [es:bx+0x2]
000004C5h:0001.02C5h 9AFFFF0000      call word 0x0:0xffff     ; char *asctim=nctime(int time);
                                                              ; Encode the time into 'HH:MM:SS'
                                                              ; Input is int returned from time()
000004CAh:0001.02CAh 59              pop cx
000004CBh:0001.02CBh 52              push dx
000004CCh:0001.02CCh 50              push ax
000004CDh:0001.02CDh C45E06          les bx, [bp+0x6]
000004D0h:0001.02D0h 26FF37          push word [es:bx]
000004D3h:0001.02D3h C45E06          les bx, [bp+0x6]
000004D6h:0001.02D6h 26FF37          push word [es:bx]
000004D9h:0001.02D9h 9AFFFF0000      call word 0x0:0xffff     ; char *ascdat=ncdate(int date);
                                                              ; Encode date into 'MM/DD/YY' format
000004DEh:0001.02DEh 59              pop cx
000004DFh:0001.02DFh 52              push dx
000004E0h:0001.02E0h 50              push ax
000004E1h:0001.02E1h 6A0D            push 0xd
000004E3h:0001.02E3h 9AFFFF0000      call word 0x0:0xffff     ; prfmsg(msgnum,p1,p2, ..• ,pn);
                                                              ; Like prf(), but the control string comes from an .MCV file
                                                              ; Preceding PUSH holds the Message # from the .MCV file
000004E8h:0001.02E8h 83C41A          add sp, 0x1a
000004EBh:0001.02EBh FF7608          push word [bp+0x8]
000004EEh:0001.02EEh FF7606          push word [bp+0x6]
000004F1h:0001.02F1h 9AFFFF0000      call word 0x0:0xffff     ; int dinsbtv (void *recptr);
                                                              ; (more tolerant) Insert a new Btrieve record
000004F6h:0001.02F6h 83C404          add sp, 0x4
000004F9h:0001.02F9h 0BC0            or ax, ax
000004FBh:0001.02FBh 7508            jnz 0x305
000004FDh:0001.02FDh 6A0F            push 0xf
000004FFh:0001.02FFh 9AFFFF0000      call word 0x0:0xffff     ; prfmsg(msgnum,p1,p2, ..• ,pn);
                                                              ; Like prf(), but the control string comes from an .MCV file
                                                              ; Preceding PUSH holds the Message # from the .MCV file
00000504h:0001.0304h 59              pop cx
00000505h:0001.0305h 1F              pop ds                   ; Conditional jump from 0001:02FBh
00000506h:0001.0306h 5D              pop bp
00000507h:0001.0307h CB              retf                     ; \---- END SUBROUTINE 10
00000508h:0001.0308h C8780000        enter 0x78, 0x0          ; /---- BEGIN SUBROUTINE 11
                                                              ; Referenced by CALL at address: 0001.0535h 
0000050Ch:0001.030Ch 1E              push ds
0000050Dh:0001.030Dh B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
00000510h:0001.0310h 8ED8            mov ds, ax
00000512h:0001.0312h 6A78            push 0x78
00000514h:0001.0314h 6A00            push 0x0
00000516h:0001.0316h 16              push ss
00000517h:0001.0317h 8D4688          lea ax, [bp-0x78]
0000051Ah:0001.031Ah 50              push ax
0000051Bh:0001.031Bh 9AFFFF0000      call word 0x0:0xffff     ; void memset(void *ptr, int value, size_t num);
                                                              ; Sets the first num bytes of the block of memory with the specified value
00000520h:0001.0320h 83C408          add sp, 0x8
00000523h:0001.0323h 9AFFFF0000      call word 0x0:0xffff     ; int date=today();
                                                              ; Find out today's date coded as YYYYYYYMMMMDDDDD
                                                              ; (YYYYYYY-1980) * 512 representing 1980 through 2170
                                                              ; (MMMM*32) representing 1 through 12
                                                              ; DDDDD representing 1 through 31
00000528h:0001.0328h 894688          mov [bp-0x78], ax
0000052Bh:0001.032Bh 9AFFFF0000      call word 0x0:0xffff     ; int time=now()
                                                              ; Returns the time of day it is bitwise HHHHHMMMMMMSSSSS coding
                                                              ; HHHHH * 2048 representing 0 through 23
                                                              ; MMMMMM * 32 representing 0 through 59
                                                              ; SSSSS representing the even numbers 0 though 58
                                                              ; Use nctime() to parse
00000530h:0001.0330h 89468A          mov [bp-0x76], ax
00000533h:0001.0333h B8FFFF          mov ax, 0xffff           ; int margc;
                                                              ; Number of words in the user input line
                                                              ; Value initialized by parsin()
00000536h:0001.0336h 8EC0            mov es, ax
00000538h:0001.0338h 26833E000001    cmp word [es:0x0], 0x1
0000053Eh:0001.033Eh 7E13            jle 0x353
00000540h:0001.0340h 6A08            push 0x8
00000542h:0001.0342h B8FFFF          mov ax, 0xffff           ; char *margv[];
                                                              ; An array of pointers to the words in user's input line
                                                              ; Value initialized by parsin()
00000545h:0001.0345h 8EC0            mov es, ax
00000547h:0001.0347h 26FF360600      push word [es:0x6]
0000054Ch:0001.034Ch 26FF360400      push word [es:0x4]
00000551h:0001.0351h EB0C            jmp 0x35f
00000553h:0001.0353h 6A08            push 0x8                 ; Conditional jump from 0001:033Eh
00000555h:0001.0355h 6A0B            push 0xb
00000557h:0001.0357h 9AFFFF0000      call word 0x0:0xffff     ; char *bufard=getmsg(msgnum);
                                                              ; Read value of CNF option
0000055Ch:0001.035Ch 59              pop cx
0000055Dh:0001.035Dh 52              push dx
0000055Eh:0001.035Eh 50              push ax
0000055Fh:0001.035Fh 16              push ss                  ; Unconditional jump from 0001:0351h
00000560h:0001.0360h 8D46AA          lea ax, [bp-0x56]
00000563h:0001.0363h 50              push ax
00000564h:0001.0364h 9AFFFF0000      call word 0x0:0xffff     ; stzcpy(char *dest, char *source, int nbytes);
                                                              ; Copies a string with a limit
00000569h:0001.0369h 83C40A          add sp, 0xa
0000056Ch:0001.036Ch B8FFFF          mov ax, 0xffff           ; int margc;
                                                              ; Number of words in the user input line
                                                              ; Value initialized by parsin()
0000056Fh:0001.036Fh 8EC0            mov es, ax
00000571h:0001.0371h 26833E000002    cmp word [es:0x0], 0x2
00000577h:0001.0377h 7E18            jle 0x391
00000579h:0001.0379h 9AFFFF0000      call word 0x0:0xffff     ; void rstrin();
                                                              ; Restore parsed input line (under effects of parsin()
0000057Eh:0001.037Eh 6A1A            push 0x1a
00000580h:0001.0380h B8FFFF          mov ax, 0xffff           ; char *margv[];
                                                              ; An array of pointers to the words in user's input line
                                                              ; Value initialized by parsin()
00000583h:0001.0383h 8EC0            mov es, ax
00000585h:0001.0385h 26FF360A00      push word [es:0xa]
0000058Ah:0001.038Ah 26FF360800      push word [es:0x8]
0000058Fh:0001.038Fh EB0C            jmp 0x39d
00000591h:0001.0391h 6A1A            push 0x1a                ; Conditional jump from 0001:0377h
00000593h:0001.0393h 6A0C            push 0xc
00000595h:0001.0395h 9AFFFF0000      call word 0x0:0xffff     ; char *bufard=getmsg(msgnum);
                                                              ; Read value of CNF option
0000059Ah:0001.039Ah 59              pop cx
0000059Bh:0001.039Bh 52              push dx
0000059Ch:0001.039Ch 50              push ax
0000059Dh:0001.039Dh 16              push ss                  ; Unconditional jump from 0001:038Fh
0000059Eh:0001.039Eh 8D46B2          lea ax, [bp-0x4e]
000005A1h:0001.03A1h 50              push ax
000005A2h:0001.03A2h 9AFFFF0000      call word 0x0:0xffff     ; stzcpy(char *dest, char *source, int nbytes);
                                                              ; Copies a string with a limit
000005A7h:0001.03A7h 83C40A          add sp, 0xa
000005AAh:0001.03AAh 16              push ss
000005ABh:0001.03ABh 8D4688          lea ax, [bp-0x78]
000005AEh:0001.03AEh 50              push ax
000005AFh:0001.03AFh 0E              push cs
000005B0h:0001.03B0h E8BAFE          call 0x26d
000005B3h:0001.03B3h 83C404          add sp, 0x4
000005B6h:0001.03B6h 1F              pop ds
000005B7h:0001.03B7h C9              leave
000005B8h:0001.03B8h CB              retf                     ; \---- END SUBROUTINE 11
000005B9h:0001.03B9h 55              push bp                  ; /---- BEGIN SUBROUTINE 12
                                                              ; Referenced by CALL at address: 0001.0445h 
000005BAh:0001.03BAh 8BEC            mov bp, sp
000005BCh:0001.03BCh 1E              push ds
000005BDh:0001.03BDh B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
000005C0h:0001.03C0h 8ED8            mov ds, ax
000005C2h:0001.03C2h 8B4608          mov ax, [bp+0x8]
000005C5h:0001.03C5h 052A00          add ax, 0x2a
000005C8h:0001.03C8h FF760A          push word [bp+0xa]
000005CBh:0001.03CBh 50              push ax
000005CCh:0001.03CCh 8B4608          mov ax, [bp+0x8]
000005CFh:0001.03CFh 052200          add ax, 0x22
000005D2h:0001.03D2h FF760A          push word [bp+0xa]
000005D5h:0001.03D5h 50              push ax
000005D6h:0001.03D6h 8B4608          mov ax, [bp+0x8]
000005D9h:0001.03D9h 050400          add ax, 0x4
000005DCh:0001.03DCh FF760A          push word [bp+0xa]
000005DFh:0001.03DFh 50              push ax
000005E0h:0001.03E0h C45E08          les bx, [bp+0x8]
000005E3h:0001.03E3h 26FF7702        push word [es:bx+0x2]
000005E7h:0001.03E7h 9AFFFF0000      call word 0x0:0xffff     ; char *asctim=nctime(int time);
                                                              ; Encode the time into 'HH:MM:SS'
                                                              ; Input is int returned from time()
000005ECh:0001.03ECh 59              pop cx
000005EDh:0001.03EDh 52              push dx
000005EEh:0001.03EEh 50              push ax
000005EFh:0001.03EFh C45E08          les bx, [bp+0x8]
000005F2h:0001.03F2h 26FF7702        push word [es:bx+0x2]
000005F6h:0001.03F6h C45E08          les bx, [bp+0x8]
000005F9h:0001.03F9h 26FF37          push word [es:bx]
000005FCh:0001.03FCh 9AFFFF0000      call word 0x0:0xffff     ; char *ascdat=ncdate(int date);
                                                              ; Encode date into 'MM/DD/YY' format
00000601h:0001.0401h 59              pop cx
00000602h:0001.0402h 52              push dx
00000603h:0001.0403h 50              push ax
00000604h:0001.0404h C45E08          les bx, [bp+0x8]
00000607h:0001.0407h 26FF37          push word [es:bx]
0000060Ah:0001.040Ah FF7606          push word [bp+0x6]
0000060Dh:0001.040Dh 6A0E            push 0xe
0000060Fh:0001.040Fh 9AFFFF0000      call word 0x0:0xffff     ; prfmsg(msgnum,p1,p2, ..• ,pn);
                                                              ; Like prf(), but the control string comes from an .MCV file
                                                              ; Preceding PUSH holds the Message # from the .MCV file
00000614h:0001.0414h 83C41C          add sp, 0x1c
00000617h:0001.0417h 1F              pop ds
00000618h:0001.0418h 5D              pop bp
00000619h:0001.0419h CB              retf                     ; \---- END SUBROUTINE 12
0000061Ah:0001.041Ah C8780000        enter 0x78, 0x0          ; /---- BEGIN SUBROUTINE 13
                                                              ; Referenced by CALL at address: 0001.0563h 
0000061Eh:0001.041Eh 56              push si
0000061Fh:0001.041Fh 1E              push ds
00000620h:0001.0420h B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
00000623h:0001.0423h 8ED8            mov ds, ax
00000625h:0001.0425h BE0100          mov si, 0x1
00000628h:0001.0428h 6A21            push 0x21
0000062Ah:0001.042Ah 16              push ss
0000062Bh:0001.042Bh 8D4688          lea ax, [bp-0x78]
0000062Eh:0001.042Eh 50              push ax
0000062Fh:0001.042Fh 9AFFFF0000      call word 0x0:0xffff     ; int stpbtv (void *recptr, int stpopt);
                                                              ; 'Step' based Btrieve operation
00000634h:0001.0434h 83C406          add sp, 0x6
00000637h:0001.0437h 0BC0            or ax, ax
00000639h:0001.0439h 7425            jz 0x460
0000063Bh:0001.043Bh 16              push ss                  ; Conditional jump from 0001:045Ch
0000063Ch:0001.043Ch 8D4688          lea ax, [bp-0x78]
0000063Fh:0001.043Fh 50              push ax
00000640h:0001.0440h 8BC6            mov ax, si
00000642h:0001.0442h 46              inc si
00000643h:0001.0443h 50              push ax
00000644h:0001.0444h 0E              push cs
00000645h:0001.0445h E871FF          call 0x3b9
00000648h:0001.0448h 83C406          add sp, 0x6
0000064Bh:0001.044Bh 6A18            push 0x18
0000064Dh:0001.044Dh 16              push ss
0000064Eh:0001.044Eh 8D4688          lea ax, [bp-0x78]
00000651h:0001.0451h 50              push ax
00000652h:0001.0452h 9AFFFF0000      call word 0x0:0xffff     ; int stpbtv (void *recptr, int stpopt);
                                                              ; 'Step' based Btrieve operation
00000657h:0001.0457h 83C406          add sp, 0x6
0000065Ah:0001.045Ah 0BC0            or ax, ax
0000065Ch:0001.045Ch 75DD            jnz 0x43b
0000065Eh:0001.045Eh EB08            jmp 0x468
00000660h:0001.0460h 6A0A            push 0xa                 ; Conditional jump from 0001:0439h
00000662h:0001.0462h 9AFFFF0000      call word 0x0:0xffff     ; prfmsg(msgnum,p1,p2, ..• ,pn);
                                                              ; Like prf(), but the control string comes from an .MCV file
                                                              ; Preceding PUSH holds the Message # from the .MCV file
00000667h:0001.0467h 59              pop cx
00000668h:0001.0468h 1F              pop ds                   ; Unconditional jump from 0001:045Eh
00000669h:0001.0469h 5E              pop si
0000066Ah:0001.046Ah C9              leave
0000066Bh:0001.046Bh CB              retf                     ; \---- END SUBROUTINE 13
0000066Ch:0001.046Ch 56              push si                  ; /---- BEGIN SUBROUTINE 14
0000066Dh:0001.046Dh 1E              push ds
0000066Eh:0001.046Eh B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
00000671h:0001.0471h 8ED8            mov ds, ax
00000673h:0001.0473h BE0100          mov si, 0x1
00000676h:0001.0476h FF363F00        push word [0x3f]
0000067Ah:0001.047Ah FF363D00        push word [0x3d]
0000067Eh:0001.047Eh 9AFFFF0000      call word 0x0:0xffff     ; FILE *setmbk(mbkptr);
                                                              ; Sets the 'current' MCV file block pointer
00000683h:0001.0483h 83C404          add sp, 0x4
00000686h:0001.0486h FF364300        push word [0x43]
0000068Ah:0001.048Ah FF364100        push word [0x41]
0000068Eh:0001.048Eh 9AFFFF0000      call word 0x0:0xffff     ; void setbtv(BTVFILE *bbprt);
                                                              ; Used to set the Btrieve file for all subsequent database functions
00000693h:0001.0493h 83C404          add sp, 0x4
00000696h:0001.0496h B8FFFF          mov ax, 0xffff           ; struct user *usrptr;
                                                              ; Points to that channels 'user' struct
00000699h:0001.0499h 8EC0            mov es, ax
0000069Bh:0001.049Bh 26C41E0000      les bx, [es:0x0]
000006A0h:0001.04A0h 26837F0800      cmp word [es:bx+0x8], 0x0
000006A5h:0001.04A5h 751E            jnz 0x4c5
000006A7h:0001.04A7h 6A04            push 0x4
000006A9h:0001.04A9h 9AFFFF0000      call word 0x0:0xffff     ; prfmsg(msgnum,p1,p2, ..• ,pn);
                                                              ; Like prf(), but the control string comes from an .MCV file
                                                              ; Preceding PUSH holds the Message # from the .MCV file
000006AEh:0001.04AEh 59              pop cx
000006AFh:0001.04AFh B8FFFF          mov ax, 0xffff           ; struct user *usrptr;
                                                              ; Points to that channels 'user' struct
000006B2h:0001.04B2h 8EC0            mov es, ax
000006B4h:0001.04B4h 26C41E0000      les bx, [es:0x0]
000006B9h:0001.04B9h 26C747080100    mov word [es:bx+0x8], 0x1
000006BFh:0001.04BFh BE0100          mov si, 0x1
000006C2h:0001.04C2h E91801          jmp 0x5dd
000006C5h:0001.04C5h B8FFFF          mov ax, 0xffff           ; int margc;
                                                              ; Number of words in the user input line
                                                              ; Value initialized by parsin()
                                                              ; Conditional jump from 0001:04A5h
000006C8h:0001.04C8h 8EC0            mov es, ax
000006CAh:0001.04CAh 26833E000000    cmp word [es:0x0], 0x0
000006D0h:0001.04D0h 7F03            jg 0x4d5
000006D2h:0001.04D2h E90001          jmp 0x5d5
000006D5h:0001.04D5h 1E              push ds                  ; Conditional jump from 0001:04D0h
000006D6h:0001.04D6h 689000          push 0x90                ; Possible String reference from SEG 2 -> "1"
000006D9h:0001.04D9h B8FFFF          mov ax, 0xffff           ; char *margv[];
                                                              ; An array of pointers to the words in user's input line
                                                              ; Value initialized by parsin()
000006DCh:0001.04DCh 8EC0            mov es, ax
000006DEh:0001.04DEh 26FF360200      push word [es:0x2]
000006E3h:0001.04E3h 26FF360000      push word [es:0x0]
000006E8h:0001.04E8h 9AFFFF0000      call word 0x0:0xffff     ; int match=sameas(char *stgl, char* stg2);
                                                              ; Case-ignoring string match
                                                              ; Returns 1 if match, 0 otherwise
000006EDh:0001.04EDh 83C408          add sp, 0x8
000006F0h:0001.04F0h 0BC0            or ax, ax
000006F2h:0001.04F2h 7419            jz 0x50d
000006F4h:0001.04F4h 1E              push ds
000006F5h:0001.04F5h 688900          push 0x89                ; Possible String reference from SEG 2 -> "v1.1.0"
000006F8h:0001.04F8h 1E              push ds
000006F9h:0001.04F9h 688100          push 0x81                ; Possible String reference from SEG 2 -> "BHZSKLN"
000006FCh:0001.04FCh 1E              push ds
000006FDh:0001.04FDh 689200          push 0x92                ; Possible String reference from SEG 2 -> "%s %s
"
00000700h:0001.0500h 9AFFFF0000      call word 0x0:0xffff     ; prf(string); 
                                                              ; Like printf(), except the converted text goes into a buffer
00000705h:0001.0505h 83C40C          add sp, 0xc
00000708h:0001.0508h 6A06            push 0x6
0000070Ah:0001.050Ah E9CA00          jmp 0x5d7
0000070Dh:0001.050Dh 1E              push ds                  ; Conditional jump from 0001:04F2h
0000070Eh:0001.050Eh 689900          push 0x99                ; Possible String reference from SEG 2 -> "2"
00000711h:0001.0511h B8FFFF          mov ax, 0xffff           ; char *margv[];
                                                              ; An array of pointers to the words in user's input line
                                                              ; Value initialized by parsin()
00000714h:0001.0514h 8EC0            mov es, ax
00000716h:0001.0516h 26FF360200      push word [es:0x2]
0000071Bh:0001.051Bh 26FF360000      push word [es:0x0]
00000720h:0001.0520h 9AFFFF0000      call word 0x0:0xffff     ; int match=sameas(char *stgl, char* stg2);
                                                              ; Case-ignoring string match
                                                              ; Returns 1 if match, 0 otherwise
00000725h:0001.0525h 83C408          add sp, 0x8
00000728h:0001.0528h 0BC0            or ax, ax
0000072Ah:0001.052Ah 740F            jz 0x53b
0000072Ch:0001.052Ch 6A07            push 0x7
0000072Eh:0001.052Eh 9AFFFF0000      call word 0x0:0xffff     ; prfmsg(msgnum,p1,p2, ..• ,pn);
                                                              ; Like prf(), but the control string comes from an .MCV file
                                                              ; Preceding PUSH holds the Message # from the .MCV file
00000733h:0001.0533h 59              pop cx
00000734h:0001.0534h 0E              push cs
00000735h:0001.0535h E8D0FD          call 0x308
00000738h:0001.0538h E9A200          jmp 0x5dd
0000073Bh:0001.053Bh 1E              push ds                  ; Conditional jump from 0001:052Ah
0000073Ch:0001.053Ch 689B00          push 0x9b                ; Possible String reference from SEG 2 -> "3"
0000073Fh:0001.053Fh B8FFFF          mov ax, 0xffff           ; char *margv[];
                                                              ; An array of pointers to the words in user's input line
                                                              ; Value initialized by parsin()
00000742h:0001.0542h 8EC0            mov es, ax
00000744h:0001.0544h 26FF360200      push word [es:0x2]
00000749h:0001.0549h 26FF360000      push word [es:0x0]
0000074Eh:0001.054Eh 9AFFFF0000      call word 0x0:0xffff     ; int match=sameas(char *stgl, char* stg2);
                                                              ; Case-ignoring string match
                                                              ; Returns 1 if match, 0 otherwise
00000753h:0001.0553h 83C408          add sp, 0x8
00000756h:0001.0556h 0BC0            or ax, ax
00000758h:0001.0558h 740E            jz 0x568
0000075Ah:0001.055Ah 6A08            push 0x8
0000075Ch:0001.055Ch 9AFFFF0000      call word 0x0:0xffff     ; prfmsg(msgnum,p1,p2, ..• ,pn);
                                                              ; Like prf(), but the control string comes from an .MCV file
                                                              ; Preceding PUSH holds the Message # from the .MCV file
00000761h:0001.0561h 59              pop cx
00000762h:0001.0562h 0E              push cs
00000763h:0001.0563h E8B4FE          call 0x41a
00000766h:0001.0566h EB75            jmp 0x5dd
00000768h:0001.0568h 1E              push ds                  ; Conditional jump from 0001:0558h
00000769h:0001.0569h 689D00          push 0x9d                ; Possible String reference from SEG 2 -> "x"
0000076Ch:0001.056Ch B8FFFF          mov ax, 0xffff           ; char *margv[];
                                                              ; An array of pointers to the words in user's input line
                                                              ; Value initialized by parsin()
0000076Fh:0001.056Fh 8EC0            mov es, ax
00000771h:0001.0571h 26FF360200      push word [es:0x2]
00000776h:0001.0576h 26FF360000      push word [es:0x0]
0000077Bh:0001.057Bh 9AFFFF0000      call word 0x0:0xffff     ; int match=sameas(char *stgl, char* stg2);
                                                              ; Case-ignoring string match
                                                              ; Returns 1 if match, 0 otherwise
00000780h:0001.0580h 83C408          add sp, 0x8
00000783h:0001.0583h 0BC0            or ax, ax
00000785h:0001.0585h 7404            jz 0x58b
00000787h:0001.0587h 33F6            xor si, si
00000789h:0001.0589h EB52            jmp 0x5dd
0000078Bh:0001.058Bh 6A09            push 0x9                 ; Conditional jump from 0001:0585h
0000078Dh:0001.058Dh 9AFFFF0000      call word 0x0:0xffff     ; prfmsg(msgnum,p1,p2, ..• ,pn);
                                                              ; Like prf(), but the control string comes from an .MCV file
                                                              ; Preceding PUSH holds the Message # from the .MCV file
00000792h:0001.0592h 59              pop cx
00000793h:0001.0593h 9AFFFF0000      call word 0x0:0xffff     ; void rstrin();
                                                              ; Restore parsed input line (under effects of parsin()
00000798h:0001.0598h B8FFFF          mov ax, 0xffff           ; int inplen;
                                                              ; Total length us the user input in bytes
0000079Bh:0001.059Bh 8EC0            mov es, ax
0000079Dh:0001.059Dh 26A10000        mov ax, [es:0x0]
000007A1h:0001.05A1h 40              inc ax
000007A2h:0001.05A2h 50              push ax
000007A3h:0001.05A3h 68FFFF          push 0xffff              ; char input[];
                                                              ; User Input lines
000007A6h:0001.05A6h 680000          push 0x0                 ; char input[];
                                                              ; User Input lines
000007A9h:0001.05A9h B8FFFF          mov ax, 0xffff           ; char *prfptr;
                                                              ; Pointer to the current position in prfbuf
000007ACh:0001.05ACh 8EC0            mov es, ax
000007AEh:0001.05AEh 26FF360200      push word [es:0x2]
000007B3h:0001.05B3h 26FF360000      push word [es:0x0]
000007B8h:0001.05B8h 9AFFFF0000      call word 0x0:0xffff     ; stzcpy(char *dest, char *source, int nbytes);
                                                              ; Copies a string with a limit
000007BDh:0001.05BDh 83C40A          add sp, 0xa
000007C0h:0001.05C0h B8FFFF          mov ax, 0xffff           ; int inplen;
                                                              ; Total length us the user input in bytes
000007C3h:0001.05C3h 8EC0            mov es, ax
000007C5h:0001.05C5h 26A10000        mov ax, [es:0x0]
000007C9h:0001.05C9h BAFFFF          mov dx, 0xffff           ; char *prfptr;
                                                              ; Pointer to the current position in prfbuf
000007CCh:0001.05CCh 8EC2            mov es, dx
000007CEh:0001.05CEh 2601060000      add [es:0x0], ax
000007D3h:0001.05D3h EB08            jmp 0x5dd
000007D5h:0001.05D5h 6A04            push 0x4                 ; Unconditional jump from 0001:04D2h
000007D7h:0001.05D7h 9AFFFF0000      call word 0x0:0xffff     ; prfmsg(msgnum,p1,p2, ..• ,pn);
                                                              ; Like prf(), but the control string comes from an .MCV file
                                                              ; Preceding PUSH holds the Message # from the .MCV file
                                                              ; Unconditional jump from 0001:050Ah
000007DCh:0001.05DCh 59              pop cx
000007DDh:0001.05DDh 6A05            push 0x5                 ; Unconditional jump from 0001:05D3h
                                                              ; Unconditional jump from 0001:0589h
                                                              ; Unconditional jump from 0001:0566h
                                                              ; Unconditional jump from 0001:0538h
                                                              ; Unconditional jump from 0001:04C2h
000007DFh:0001.05DFh 9AFFFF0000      call word 0x0:0xffff     ; prfmsg(msgnum,p1,p2, ..• ,pn);
                                                              ; Like prf(), but the control string comes from an .MCV file
                                                              ; Preceding PUSH holds the Message # from the .MCV file
000007E4h:0001.05E4h 59              pop cx
000007E5h:0001.05E5h 9AFFFF0000      call word 0x0:0xffff     ; rstmbk();
                                                              ; Restore previous MCV file block ptr from before last setmbk() call
000007EAh:0001.05EAh 9AFFFF0000      call word 0x0:0xffff     ; void rstbtv (void);
                                                              ; Restores the last Btrieve data block for use
000007EFh:0001.05EFh B8FFFF          mov ax, 0xffff           ; int usrnum;
                                                              ; Property with the User Number (Channel) of the user currently being serviced
000007F2h:0001.05F2h 8EC0            mov es, ax
000007F4h:0001.05F4h 26FF360000      push word [es:0x0]
000007F9h:0001.05F9h 9AFFFF0000      call word 0x0:0xffff     ; outprf (unum);
                                                              ; Send prfbuf to a channel & clear
000007FEh:0001.05FEh 59              pop cx
000007FFh:0001.05FFh 8BC6            mov ax, si
00000801h:0001.0601h 1F              pop ds
00000802h:0001.0602h 5E              pop si
00000803h:0001.0603h CB              retf                     ; \---- END SUBROUTINE 14
00000804h:0001.0604h 1E              push ds                  ; /---- BEGIN SUBROUTINE 15
00000805h:0001.0605h B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
00000808h:0001.0608h 8ED8            mov ds, ax
0000080Ah:0001.060Ah 1E              push ds
0000080Bh:0001.060Bh 688900          push 0x89                ; Possible String reference from SEG 2 -> "v1.1.0"
0000080Eh:0001.060Eh 1E              push ds
0000080Fh:0001.060Fh 680000          push 0x0
00000812h:0001.0612h 1E              push ds
00000813h:0001.0613h 689F00          push 0x9f                ; Possible String reference from SEG 2 -> "%s %s session ending."
00000816h:0001.0616h 9AFFFF0000      call word 0x0:0xffff     ; char *sprstg=spr(char *ctlstg, TYPE p1, TYPE p2,...,pn);
                                                              ; sprintf-like string formatter utility
                                                              ; Main differentiation is that spr() supports long integer and floating point conversions
0000081Bh:0001.061Bh 83C40C          add sp, 0xc
0000081Eh:0001.061Eh 52              push dx
0000081Fh:0001.061Fh 50              push ax
00000820h:0001.0620h 1E              push ds
00000821h:0001.0621h 688100          push 0x81                ; Possible String reference from SEG 2 -> "BHZSKLN"
00000824h:0001.0624h 9AFFFF0000      call word 0x0:0xffff     ; void shocst(char *summary, char *detail, p1, p1,...,pn);
                                                              ; Displays a message in the Audit Trail
                                                              ; (summary max length = 32, detail max length = 64)
00000829h:0001.0629h 83C408          add sp, 0x8
0000082Ch:0001.062Ch A13D00          mov ax, [0x3d]
0000082Fh:0001.062Fh 0B063F00        or ax, [0x3f]
00000833h:0001.0633h 741C            jz 0x651
00000835h:0001.0635h FF363F00        push word [0x3f]
00000839h:0001.0639h FF363D00        push word [0x3d]
0000083Dh:0001.063Dh 9AFFFF0000      call word 0x0:0xffff     ; void clsmsg(FILE *mbkprt);
                                                              ; Closes an MCV file
00000842h:0001.0642h 83C404          add sp, 0x4
00000845h:0001.0645h C7063F000000    mov word [0x3f], 0x0
0000084Bh:0001.064Bh C7063D000000    mov word [0x3d], 0x0
00000851h:0001.0651h A14100          mov ax, [0x41]           ; Conditional jump from 0001:0633h
00000854h:0001.0654h 0B064300        or ax, [0x43]
00000858h:0001.0658h 741C            jz 0x676
0000085Ah:0001.065Ah FF364300        push word [0x43]
0000085Eh:0001.065Eh FF364100        push word [0x41]
00000862h:0001.0662h 9AFFFF0000      call word 0x0:0xffff     ; void clsbtv (struct btvblk *bbp);
                                                              ; Closes a Btrieve file when finished
00000867h:0001.0667h 83C404          add sp, 0x4
0000086Ah:0001.066Ah C70643000000    mov word [0x43], 0x0
00000870h:0001.0670h C70641000000    mov word [0x41], 0x0
00000876h:0001.0676h 1F              pop ds                   ; Conditional jump from 0001:0658h
00000877h:0001.0677h CB              retf                     ; \---- END SUBROUTINE 15
00000878h:0001.0678h 55              push bp                  ; /---- BEGIN SUBROUTINE 16
                                                              ; Referenced by CALL at address: 0001.0765h 
                                                              ; Referenced by CALL at address: 0001.074Dh 
                                                              ; Referenced by CALL at address: 0001.0735h 
                                                              ; Referenced by CALL at address: 0001.071Bh 
                                                              ; Referenced by CALL at address: 0001.0701h 
                                                              ; Referenced by CALL at address: 0001.06E9h 
                                                              ; Referenced by CALL at address: 0001.06CFh 
00000879h:0001.0679h 8BEC            mov bp, sp
0000087Bh:0001.067Bh 1E              push ds
0000087Ch:0001.067Ch B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
0000087Fh:0001.067Fh 8ED8            mov ds, ax
00000881h:0001.0681h 1E              push ds
00000882h:0001.0682h 684500          push 0x45                ; Possible String reference from SEG 2 -> "stub called."
00000885h:0001.0685h FF7608          push word [bp+0x8]
00000888h:0001.0688h FF7606          push word [bp+0x6]
0000088Bh:0001.068Bh 1E              push ds
0000088Ch:0001.068Ch 680000          push 0x0
0000088Fh:0001.068Fh 1E              push ds
00000890h:0001.0690h 68B500          push 0xb5                ; Possible String reference from SEG 2 -> "%s %srou %s"
00000893h:0001.0693h 9AFFFF0000      call word 0x0:0xffff     ; char *sprstg=spr(char *ctlstg, TYPE p1, TYPE p2,...,pn);
                                                              ; sprintf-like string formatter utility
                                                              ; Main differentiation is that spr() supports long integer and floating point conversions
00000898h:0001.0698h 83C410          add sp, 0x10
0000089Bh:0001.069Bh 52              push dx
0000089Ch:0001.069Ch 50              push ax
0000089Dh:0001.069Dh 1E              push ds
0000089Eh:0001.069Eh 684500          push 0x45                ; Possible String reference from SEG 2 -> "stub called."
000008A1h:0001.06A1h FF7608          push word [bp+0x8]
000008A4h:0001.06A4h FF7606          push word [bp+0x6]
000008A7h:0001.06A7h 1E              push ds
000008A8h:0001.06A8h 688100          push 0x81                ; Possible String reference from SEG 2 -> "BHZSKLN"
000008ABh:0001.06ABh 1E              push ds
000008ACh:0001.06ACh 68B500          push 0xb5                ; Possible String reference from SEG 2 -> "%s %srou %s"
000008AFh:0001.06AFh 9AFFFF0000      call word 0x0:0xffff     ; char *sprstg=spr(char *ctlstg, TYPE p1, TYPE p2,...,pn);
                                                              ; sprintf-like string formatter utility
                                                              ; Main differentiation is that spr() supports long integer and floating point conversions
000008B4h:0001.06B4h 83C410          add sp, 0x10
000008B7h:0001.06B7h 52              push dx
000008B8h:0001.06B8h 50              push ax
000008B9h:0001.06B9h 9AFFFF0000      call word 0x0:0xffff     ; void shocst(char *summary, char *detail, p1, p1,...,pn);
                                                              ; Displays a message in the Audit Trail
                                                              ; (summary max length = 32, detail max length = 64)
000008BEh:0001.06BEh 83C408          add sp, 0x8
000008C1h:0001.06C1h 1F              pop ds
000008C2h:0001.06C2h 5D              pop bp
000008C3h:0001.06C3h CB              retf                     ; \---- END SUBROUTINE 16
000008C4h:0001.06C4h 1E              push ds                  ; /---- BEGIN SUBROUTINE 17
000008C5h:0001.06C5h B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
000008C8h:0001.06C8h 8ED8            mov ds, ax
000008CAh:0001.06CAh 1E              push ds
000008CBh:0001.06CBh 68C100          push 0xc1                ; Possible String reference from SEG 2 -> "lon"
000008CEh:0001.06CEh 0E              push cs
000008CFh:0001.06CFh E8A6FF          call 0x678
000008D2h:0001.06D2h 83C404          add sp, 0x4
000008D5h:0001.06D5h 9AFFFF0000      call word 0x0:0xffff     ; char *cncall(void);
                                                              ; Expect a variable-length word sequance (consume all remaining input)
000008DAh:0001.06DAh 33C0            xor ax, ax
000008DCh:0001.06DCh 1F              pop ds
000008DDh:0001.06DDh CB              retf                     ; \---- END SUBROUTINE 17
000008DEh:0001.06DEh 1E              push ds                  ; /---- BEGIN SUBROUTINE 18
000008DFh:0001.06DFh B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
000008E2h:0001.06E2h 8ED8            mov ds, ax
000008E4h:0001.06E4h 1E              push ds
000008E5h:0001.06E5h 68C500          push 0xc5                ; Possible String reference from SEG 2 -> "sts"
000008E8h:0001.06E8h 0E              push cs
000008E9h:0001.06E9h E88CFF          call 0x678
000008ECh:0001.06ECh 83C404          add sp, 0x4
000008EFh:0001.06EFh 9AFFFF0000      call word 0x0:0xffff     ; void dfsthn();
                                                              ; Default Status Handler for status conditions this module is not specifically expecting
000008F4h:0001.06F4h 1F              pop ds
000008F5h:0001.06F5h CB              retf                     ; \---- END SUBROUTINE 18
000008F6h:0001.06F6h 1E              push ds                  ; /---- BEGIN SUBROUTINE 19
000008F7h:0001.06F7h B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
000008FAh:0001.06FAh 8ED8            mov ds, ax
000008FCh:0001.06FCh 1E              push ds
000008FDh:0001.06FDh 68C900          push 0xc9                ; Possible String reference from SEG 2 -> "inj"
00000900h:0001.0700h 0E              push cs
00000901h:0001.0701h E874FF          call 0x678
00000904h:0001.0704h 83C404          add sp, 0x4
00000907h:0001.0707h 9AFFFF0000      call word 0x0:0xffff     ; char *cncall(void);
                                                              ; Expect a variable-length word sequance (consume all remaining input)
0000090Ch:0001.070Ch 33C0            xor ax, ax
0000090Eh:0001.070Eh 1F              pop ds
0000090Fh:0001.070Fh CB              retf                     ; \---- END SUBROUTINE 19
00000910h:0001.0710h 1E              push ds                  ; /---- BEGIN SUBROUTINE 20
00000911h:0001.0711h B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
00000914h:0001.0714h 8ED8            mov ds, ax
00000916h:0001.0716h 1E              push ds
00000917h:0001.0717h 68CD00          push 0xcd                ; Possible String reference from SEG 2 -> "lof"
0000091Ah:0001.071Ah 0E              push cs
0000091Bh:0001.071Bh E85AFF          call 0x678
0000091Eh:0001.071Eh 83C404          add sp, 0x4
00000921h:0001.0721h 9AFFFF0000      call word 0x0:0xffff     ; char *cncall(void);
                                                              ; Expect a variable-length word sequance (consume all remaining input)
00000926h:0001.0726h 33C0            xor ax, ax
00000928h:0001.0728h 1F              pop ds
00000929h:0001.0729h CB              retf                     ; \---- END SUBROUTINE 20
0000092Ah:0001.072Ah 1E              push ds                  ; /---- BEGIN SUBROUTINE 21
0000092Bh:0001.072Bh B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
0000092Eh:0001.072Eh 8ED8            mov ds, ax
00000930h:0001.0730h 1E              push ds
00000931h:0001.0731h 68D100          push 0xd1                ; Possible String reference from SEG 2 -> "hup"
00000934h:0001.0734h 0E              push cs
00000935h:0001.0735h E840FF          call 0x678
00000938h:0001.0738h 83C404          add sp, 0x4
0000093Bh:0001.073Bh 9AFFFF0000      call word 0x0:0xffff     ; char *cncall(void);
                                                              ; Expect a variable-length word sequance (consume all remaining input)
00000940h:0001.0740h 1F              pop ds
00000941h:0001.0741h CB              retf                     ; \---- END SUBROUTINE 21
00000942h:0001.0742h 1E              push ds                  ; /---- BEGIN SUBROUTINE 22
00000943h:0001.0743h B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
00000946h:0001.0746h 8ED8            mov ds, ax
00000948h:0001.0748h 1E              push ds
00000949h:0001.0749h 68D500          push 0xd5                ; Possible String reference from SEG 2 -> "mcu"
0000094Ch:0001.074Ch 0E              push cs
0000094Dh:0001.074Dh E828FF          call 0x678
00000950h:0001.0750h 83C404          add sp, 0x4
00000953h:0001.0753h 9AFFFF0000      call word 0x0:0xffff     ; char *cncall(void);
                                                              ; Expect a variable-length word sequance (consume all remaining input)
00000958h:0001.0758h 1F              pop ds
00000959h:0001.0759h CB              retf                     ; \---- END SUBROUTINE 22
0000095Ah:0001.075Ah 1E              push ds                  ; /---- BEGIN SUBROUTINE 23
0000095Bh:0001.075Bh B8FFFF          mov ax, 0xffff           ; SEG ADDR of Segment 2
0000095Eh:0001.075Eh 8ED8            mov ds, ax
00000960h:0001.0760h 1E              push ds
00000961h:0001.0761h 68D900          push 0xd9                ; Possible String reference from SEG 2 -> "dla"
00000964h:0001.0764h 0E              push cs
00000965h:0001.0765h E810FF          call 0x678
00000968h:0001.0768h 83C404          add sp, 0x4
0000096Bh:0001.076Bh 9AFFFF0000      call word 0x0:0xffff     ; char *cncall(void);
                                                              ; Expect a variable-length word sequance (consume all remaining input)
00000970h:0001.0770h 1F              pop ds
00000971h:0001.0771h CB              retf                     ; \---- END SUBROUTINE 23

;-------------------------------------------
; Start of Data for Segment 2
; FILE_OFFSET:SEG_NUM.SEG_OFFSET
;-------------------------------------------
00000032h:0002.0019h 'ÿÿ'
0000003Ah:0002.001Dh 'ÿÿ'
00000042h:0002.0021h 'ÿÿ'
0000004Ah:0002.0025h 'ÿÿ'
00000052h:0002.0029h 'ÿÿ'
0000005Ah:0002.002Dh 'ÿÿ'
00000062h:0002.0031h 'ÿÿ'
0000006Ah:0002.0035h 'ÿÿ'
00000072h:0002.0039h 'ÿÿ'
0000008Ah:0002.0045h 'stub called.'
000000A8h:0002.0054h 'BHZSKLN.MDF'
000000C0h:0002.0060h 'BHZSKLN.MCV'
000000D8h:0002.006Ch 'BHZSKLN.DAT'
000000F0h:0002.0078h '%s %s %s'
00000102h:0002.0081h 'BHZSKLN'
00000112h:0002.0089h 'v1.1.0'
00000120h:0002.0090h '1'
00000124h:0002.0092h '%s %s
'
00000132h:0002.0099h '2'
00000136h:0002.009Bh '3'
0000013Ah:0002.009Dh 'x'
0000013Eh:0002.009Fh '%s %s session ending.'
0000016Ah:0002.00B5h '%s %srou %s'
00000182h:0002.00C1h 'lon'
0000018Ah:0002.00C5h 'sts'
00000192h:0002.00C9h 'inj'
0000019Ah:0002.00CDh 'lof'
000001A2h:0002.00D1h 'hup'
000001AAh:0002.00D5h 'mcu'
000001B2h:0002.00D9h 'dla'
;-------------------------------------------
; Start of Data for Segment 3
; FILE_OFFSET:SEG_NUM.SEG_OFFSET
;-------------------------------------------
00000008h:0003.0004h 'Borland C++ - Copyright 1991 Borland Intl.'
0000005Eh:0003.002Fh 'Divide error
Abnormal program termination
'
