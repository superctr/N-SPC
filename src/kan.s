; Modified by superctr 2019 to build with ca65.
	.include "spc700.inc"
	.import gate, volt, gft, sod, dir
	.segment "CODE"

;************************************************
;				*music program for Super Famicom
;						Ver.  1.21				by	Y.K.
;	   Copyright 1989 NINTENDO CO., LTD. ALL RIGHT RESERVED
;************************************************
;
;
;************************************************
cont			:=		0f1h			; control res
;
apuadd			:=		0f2h			; APU address
apudt			:=		0f3h			;	  data
;
port0			:=		0f4h			;
port1			:=		0f5h			;
port2			:=		0f6h			;
port3			:=		0f7h			;
;
tmset			:=		0fah			; timer data set
tmset2			:=		0fbh			;			 set
tmset3			:=		0fch			;			 set
;
tmdt			:=		0fdh			; timer data read
tmdt2			:=		0feh			;			 read
tmdt3			:=		0ffh			;			 read
;************************************************
;cont			:=		01d1h			; control res.	  (0f1h)
;;
;apuadd			:=		01d2h			; APU address	  (0f2h)
;apudt			:=		01d3h			;	  data		  (0f3h)
;;
;port0			:=		01d4h			;				  (0f4h)
;port1			:=		01d5h			;				  (0f5h)
;port2			:=		01d6h			;				  (0f6h)
;port3			:=		01d7h			;				  (0f7h)
;;
;tmset			:=		01dah			; timer data set  (0fah)
;tmset2			:=		01dbh			;			 set  (0fbh)
;tmset3			:=		01dch			;			 set  (0fch)
;;
;tmdt			:=		01ddh			; timer read	  (0fdh)
;tmdt2			:=		01deh			;		read	  (0feh)
;tmdt3			:=		01dfh			;		read	  (0ffh)
;************************************************
pl1				:=		0002h			; freq. low
ph1				:=		0003h			;		high
son				:=		0004h			; source no.
;
keyon			:=		004ch			;
keyoff			:=		005ch			;
;************************************************
fl0				:=		0000h			;
fl1				:=		0001h			;
fl2				:=		0002h			;
fl3				:=		0003h			;
;
sf0				:=		0004h			;
sf1				:=		0005h			;
sf2				:=		0006h			;
sf3				:=		0007h			;
;
fl0s			:=		0008h			;
fl1s			:=		0009h			;
fl2s			:=		000ah			;
fl3s			:=		000bh			;
;
sf0c			:=		000ch			;
sf3c			:=		000dh			;
;
t00				:=		000eh			;
;************************************************
sss				:=		0010h			; sss & kkk pair
kkk				:=		0011h
ttt				:=		0012h
uuu				:=		0013h
;
adx				:=		0014h			; keisan (4byte)
;
rdm				:=		0018h			; random (2byte)
fkin			:=		001ah			; kinshi flag
;
ffk				:=		001bh			; F.F. store !! test !!
cutk			:=		0390h			; cut  store !! test !! <- CTR edit:was 0400h
;........................................
skc				:=		0020h			; chs
skdw			:=		0021h			;
skd				:=		0022h			;
skdadw			:=		0023h			;
skdad			:=		0024h			;
skca			:=		0025h			;
skcb			:=		0026h			;
skcs			:=		0027h			;
;........................................
bkc				:=		0028h			; chc
;........................................
adk				:=		002ch			; kokaon add. (2byte)
sac				:=		002eh			; chd
sacs			:=		002fh			;
;........................................
add				:=		0030h			; address store (16byte)
ads				:=		0040h			; block add. store (2byte)
;
blc				:=		0042h			; block count
;........................................
cnt				:=		0043h			; 1/16 counter (for tempo)
;
chn				:=		0044h			; channel No. store
keyons			:=		0045h			; key on set
keyoffs			:=		0046h			; key off set
keyd			:=		0047h			; key data set
;........................................
flgs			:=		0048h			; 06ch
nons			:=		0049h			; 03dh
eons			:=		004ah			; 04dh
mons			:=		004bh			; 02dh
ekin			:=		004ch			;
eclr			:=		004dh			;
efbs			:=		004eh			;
;........................................
ktps			:=		0050h			; key transpose
;
tmpd			:=		0051h			;
;
tmpw			:=		0052h			; tempo data store
tmp				:=		0053h			;
tmpc			:=		0054h			; (@)
tmpm			:=		0055h			; (@)
tmpadw			:=		0056h			; (@)
tmpad			:=		0057h			; (@)
;
mvow			:=		0058h			; main vol.
mvo				:=		0059h			;
mvoc			:=		005ah			; (@)
mvom			:=		005bh			; (@)
mvoadw			:=		005ch			; (@)
mvoad			:=		005dh			; (@)
vols			:=		005eh			; vol set flag
;
wavs			:=		005fh			; source
;........................................
evolw			:=		0060h			;
evol			:=		0061h			;
evorw			:=		0062h			;
evor			:=		0063h			;
;
evoladw			:=		0064h			;
evolad			:=		0065h			;
evoradw			:=		0066h			;
evorad			:=		0067h			;
;
evoc			:=		0068h			;
evolm			:=		0069h			;
evorm			:=		006ah			;
;........................................
ngc				:=		0070h			; count (@)
ngo				:=		0071h			; keyoff count (@)
ngs				:=		0200h			; nagasa store 8 channel
ngg				:=		0201h			; gate off (%)
;
vol				:=		0210h			; vol store
snos			:=		0211h			; sno store
;........................................
bls				:=		0220h			; block su (2byte)
;........................................
adt				:=		0230h			; add taihi (2byte)
adp				:=		0240h			; add store (2byte)
;........................................
ptc				:=		0080h			; pattern count
;........................................
pvoc			:=		0090h			; (@)
pvodw			:=		0300h			; (addw)
pvod			:=		0301h			; (addw)
pvoadw			:=		0310h			; (addw)
pvoad			:=		0311h			; (addw)
pvom			:=		0320h			; (addw)
volx			:=		0321h			; tre x mvo x pvo x vol
;
panc			:=		0091h			; (@)
pandw			:=		0330h			; (addw)
pand			:=		0331h			; (addw)
panadw			:=		0340h			; (addw)
panad			:=		0341h			; (addw)
panm			:=		0350h			; (addw)
panf			:=		0351h			; pan phase
;
swpc			:=		00a0h			; (@)
swphc			:=		00a1h			; (@)
swpdw			:=		0360h			; (addw)
swpd			:=		0361h			; (addw)
swpadw			:=		0370h			; (addw)
swpad			:=		0371h			; (addw)
swpm			:=		0380h			; (addw)
tund			:=		0381h			; part tun
;........................................
swsc			:=		0280h			;
swshc			:=		0281h			;
swsk			:=		0290h			;
swss			:=		0291h			;
;
vibc			:=		02a0h			; count (?)
vibhc			:=		00b0h			; hold count (@)
vibd			:=		00b1h			; depth  (@)
vibcad			:=		02a1h			; + @ (!)
vibhs			:=		02b0h			; hold store (!)
;
vibcc			:=		0100h			; change count (1)
vibcs			:=		02b1h			; change store (!)
vibad			:=		02c0h			; (!)
vibdm			:=		02c1h			; (!)
;
trec			:=		02d0h			; count (?)
trehc			:=		00c0h			; hold count (@)
tred			:=		00c1h			; depth  (@)
trecad			:=		02d1h			; + @ (!)
trehs			:=		02e0h			; hold store (!)
;
ptps			:=		02f0h			; key transpose
;................................................
;
;
;
;************************************************
		.include		"kan.equ"	
;************************************************
;
;
;................................................
;				.org	03900h
;................................................
;		.include		"source.sod"	; ** henko **
;................................................
;				.org	03f00h
;................................................
;		.include		"kan.tan"		; ** henko **
;................................................
;
;
;************************************************
;				.org	00800h
;************************************************
start:
				clrp					; clear direct page flag
;................................................
				mov		x,#0cfh			; stack pointer
				mov		sp,x			;
;
				mov		a,#000			; clear RAM 000h-0dfh
				mov		x,a
;
start10:		mov		(x)+,a
				cmp		x,#0dfh+1
				bne		start10
;........................................
				inc		a
				call	!esaset			; EDL & ESA set
;
				set1	flgs.5			; echo off
;................................................
				mov		a,#060h
				mov		y,#00ch			; MVOL
				call	!apus
;
				mov		y,#01ch			; MVOR
				call	!apus
;
				mov		a,#>dir			;<-ctr edit:source directory here (was: 03ch)
				mov		y,#05dh			; DIR
				call	!apus			; 19 byte
;........................................
				mov		a,#0f0h			; inputport reset
				mov		!cont,a			; timer stop
;
				mov		a,#010h			; 2mS
				mov		!tmset,a		; timer data set
				mov		tmp,a
;
				mov		a,#001h			; timer start
				mov		!cont,a
;++++++++++++++++++++++++++++++++++++++++++++++++
start20:								; 2mS
;........................................
				mov		a,ffk			;		!! test !!
				bne		start55			;		!! test !!
;........................................
				mov		y,#010			; 10 data set
start24:		cmp		y,#005
				beq		start25
				bcs		start26
;
				cmp		ekin,eclr		; echo clear chu ?
				bne		start28			; EON EFB EVOR EVOL
;
start25:		bbs		ekin.7,start28	; echo kinshi chu ? (FLG)
;
start26:		mov		a,!dseta-1+y
				mov		!apuadd,a		; write address
				mov		a,!dsetd-1+y
				mov		x,a
				mov		a,(x)
				mov		!apudt,a		; data write
start28:		dbnz	y,start24		; 18 byte
;
				mov		keyons,y
				mov		keyoffs,y
;...................
				mov		a,rdm			; random keisan
				eor		a,rdm+1
				lsr		a
				lsr		a
				notc					; d1 check
				ror		rdm
				ror		rdm+1
;........................................
start40:		mov		y,!tmdt			; timer read
				beq		start40
;
				push	y				; 2mS goto
;................................................
				mov		a,#020h			; 8 count
				mul		ya
;
				clrc
				adc		a,cnt
				mov		cnt,a
				bcc		start50
;.......................................; 16mS
;				call	!chs			; soko-on
;........................................
;				call	!chc			; bakuhatu-on
;
;				mov		x,#002			; fl2 & port2 check
;				call	!flset			; x = fl?
;........................................
;				call	!chd			; sound effect
;
;				mov		x,#003			; fl3 & port3 check
;				call	!flset			; x = fl?
;........................................
				cmp		ekin,eclr		;
				beq		start50
				inc		ekin
;................................................
start50:		mov		a,tmp			; tmp = 20h (normal)
				pop		y				; timer count
				mul		ya				;
;
				clrc
				adc		a,tmpd
				mov		tmpd,a
				bcc		start60
;...................
start55:		call	!cha			; music
;
				mov		x,#000			; fl0 & port0 check
				call	!flset			; x = fl?
				bra		start20
;................................................
start60:		mov		a,sf0
				beq		start20x
;...
				mov		x,#000			; hokan routin (8 ch.)
				mov		keyd,#001h		; key data set
;
start62:		mov		a,add+1+x
				beq		start64			; kami = 0
;
				call	!trry			; pan move & sweep & vib check
;
start64:		inc		x
				inc		x
				asl		keyd			;
				bne		start62			; channel end ? (8ch)
;
start20x:		jmp		!start20		; channel end
;************************************************
flset:			mov		a,sf0+x			; flag set flx
				mov		!port0+x,a		; flag return
;
flset02:		mov		a,!port0+x		; flag read
				cmp		a,!port0+x		; 2 kai check
				bne		flset02			;
;
				mov		fl0+x,a			; new data
;
dssr:			ret
;************************************************
;
;
;************************************************
;				Freq. data set
;************************************************
dss:			cmp		y,#dd0			; drams check
				bcc		dss0
;************************************************
;				drams set	 ; x=channel  a=sno
;************************************************
dds:			call	!snoset			; sno data set
				mov		y,#c30			; (takasa)
;................................................
dss0:			cmp		y,#xxx			; tai or yyy ?
				bcs		dssr
;................................................
				mov		a,fkin			; kinshi flag check
				and		a,keyd
				bne		dssr
;......
				mov		a,y
				and		a,#07fh			; fre. set & flag set
				clrc					; key trans. add.
				adc		a,ktps
				clrc
				adc		a,!ptps+x
				mov		!swpd+x,a		; ontei store
;
				mov		a,!tund+x
				mov		!swpdw+x,a		; sweep shosuten ika
;................................................
				mov		a,!vibcs+x		;
				lsr		a
				mov		a,#000
				ror		a
				mov		!vibc+x,a		; count data (00h or 80h)
;
				mov		a,#000
				mov		vibhc+x,a		; vib hold
				mov		!vibcc+x,a		; vib change
				mov		!trec+x,a		; tre count = 0
				mov		trehc+x,a		; tre hold
;
				or		vols,keyd		; vol set flag
				or		keyons,keyd		; keyon
;................................................
dss2:			mov		a,!swsc+x		; sweep check
				mov		swpc+x,a		; sweep (counter)
				beq		dss6			; not sweep
;................................................
				mov		a,!swshc+x
				mov		swphc+x,a		; sweep (hold)
;
				mov		a,!swsk+x		; sws or swk ?
				bne		dss3
;......
				mov		a,!swpd+x		; (sws)
				setc					;
				sbc		a,!swss+x		;
				mov		!swpd+x,a		;
;......
dss3:			mov		a,!swss+x		; + ? (swk)
				clrc
				adc		a,!swpd+x		; now + @
;......
				call	!swpadset		; sweep data set
;........................................ from kokaon
dss6:			call	!swpdset		; kkk sss <-- swpd swpdw
;************************************************
;				fre. data set	kkk & sss  x=channel  bls set
;************************************************
dssx:			mov		y,#000			; S curve hosei
				mov		a,kkk
				setc
				sbc		a,#052			; e40 = 52
				bcs		dssx04			; e40 ijo add
;...
dssx02:			mov		a,kkk
				setc
				sbc		a,#019			; g10 = 19
				bcs		dssx10
;
				dec		y				; y = 0ffh
				asl		a
dssx04:			addw	ya,sss
				movw	sss,ya
;................................................
dssx10:			push	x				; ontei store (kkk,sss)
				mov		a,kkk
;
				asl		a
				mov		y,#000
				mov		x,#024
				div		ya,x			; ya/x = a ... y
				mov		x,a				; x = oct.
;...
				mov		a,!gfd+1+y		; high
				mov		adx+1,a
				mov		a,!gfd+y		; low
				mov		adx,a
;
				mov		a,!gfd+3+y		; high
				push	a
				mov		a,!gfd+2+y		; low
				pop		y
				subw	ya,adx			; ya - adx
;...									; ( 0.sss x ya ) + adx	= adx
				mov		y,sss
				mul		ya				; shimo x 0.???
				mov		a,y
				mov		y,#000
				addw	ya,adx
				mov		adx+1,y
;
				asl		a
				rol		adx+1
				mov		adx,a
				bra		dssx14
;...
dssx12:			lsr		adx+1
				ror		a
				inc		x
dssx14:			cmp		x,#006			; x = oct.
				bne		dssx12
				mov		adx,a
;
				pop		x
;........................................
				mov		a,!bls+x		; 0. block su
				mov		y,adx+1			; fre.(high)
				mul		ya				;
				movw	adx+2,ya		;
;
				mov		a,!bls+x		; 0. block su
				mov		y,adx			; fre.(low)
				mul		ya				;
				push	y				; --> low
;
				mov		a,!bls+1+x		; block su
				mov		y,adx			; fre.(low)
				mul		ya				;
				addw	ya,adx+2
				movw	adx+2,ya		;
;
				mov		a,!bls+1+x		; block su
				mov		y,adx+1			; fre.(high)
				mul		ya
				mov		y,a
				pop		a				; <-- low
				addw	ya,adx+2
				movw	adx+2,ya		; freq. set
;................................................
				mov		a,x				; apuch
				xcn		a
				lsr		a
				or		a,#pl1			; pl1 = 2
				mov		y,a				; write address
;
				mov		a,adx+2			; shimo
				call	!apusx			; a=data  y=address
;
				inc		y
				mov		a,adx+3			; kami
;************************************************
;				APU data out   acc = write data   y = write add
;************************************************
apusx:			push	a
				mov		a,keyd
				and		a,fkin			; kinshi flag check
				pop		a
				bne		apusr
;................................................
apus:			mov		!apuadd,y		; write address
				mov		!apudt,a		; data write
;
apusr:			ret
;................................................
;
;
;************************************************
;************************************************
;
;
;................................................
adset:			mov		y,#000			; block address set
				mov		a,[ads]+y
				incw	ads
				push	a				; shimo
				mov		a,[ads]+y
				incw	ads
				mov		y,a				; kami
				pop		a
				ret
;................................................
ten00x:			call	!ten00			; data tensou
				mov		fl0s,a			; a=0
;........................................
ks00:			mov		sf0,a			; fl0 --> sf0
;........................................
				asl		a
;				beq		ks04			; 000h = end
;......
				mov		x,a				; shoki data set
				mov		a,!gft-2+1+x	; block add. shoki set
				mov		y,a
				mov		a,!gft-2+x
				movw	ads,ya
;......
				mov		sf0c,#002		; count
;...................
ks04:			mov		a,fkin			; key off
				eor		a,#0ffh
				tset1	!keyoffs		; keyoff set
				ret
;................................................
ks10:			mov		x,#014			; shoki data set
				mov		keyd,#080h
;
ks12:			mov		a,#0ffh
				mov		!pvod+x,a		; part vol
;
				mov		a,#010			; pan data set
				call	!panx			; pand & panf  set	  (a=0)
;
				mov		!snos+x,a		; sound number
				mov		!tund+x,a		; tun shoki set
				mov		!ptps+x,a		; part tran. set
				mov		!swsc+x,a		; sweep count
				mov		!cutk+x,a		; sound cut		!! test !!
				mov		vibd+x,a		; vib depth
				mov		tred+x,a		; tre depth
;
				dec		x
				dec		x				; - 2
				lsr		keyd
				bne		ks12
;......
				mov		mvoc,a			; mvol count (a=0)
				mov		evoc,a			; evol count
				mov		tmpc,a			; tempo count set
				mov		ktps,a			; key trans. set
				mov		blc,a			; block count
				mov		wavs,a			; source
;
				mov		mvo,#0c0h		; main volume set
				mov		tmp,#020h		; tempo data set
char:			ret
;************************************************
;				music enso routin
;************************************************
cha:			mov		y,fl0s
				mov		a,fl0			;
				mov		fl0s,a
;				beq		cha02			; not stop = 0
;........................................
				cmp		a,#0f0h			; = stop	  !! test !!
				beq		ks04			; key off	  !! test !!
;........................................
				cmp		a,#0f1h			; = continue  !! test !!
				beq		cha02			;			  !! test !!
;........................................
				cmp		a,#0ffh			; = tensou	  !! test !!
				beq		ten00x			;			  !! test !!
;........................................
cha01:			cmp		y,fl0			; y = fl0s
				bne		ks00			;
;
cha02:			mov		a,sf0			; play chu ?
				beq		char			;
;........................................
				mov		a,sf0c			;
				beq		txh
;
				dbnz	sf0c,ks10		; wait count (dec & bne)
;................................................
ks20:			call	!adset			; block address set (Z=kami)
;......
				bne		ks40			; kami	= 0 ?
;......
				mov		y,a				; shimo = 0 ?
				beq		ks00			; music end ?
;........................................
				cmp		a,#fast			; F.F. ?  !! test !!
				beq		ks22			;		  !! test !!
;
				cmp		a,#play			; play ?  !! test !!
				bne		ks24			;		  !! test !!
;........................................
				mov		a,#000			; play	  !! test !!
ks22:			mov		ffk,a			; F.F.set !! test !!
				bra		ks20			;		  !! test !!
;........................................
ks24:			dec		blc
				bpl		ks26
;
				mov		blc,a			; blc=0 or 129 ijo
;
ks26:			call	!adset			; kurikaeshi ?
;
				mov		x,blc			; blc = 0 ?
				beq		ks20			;
;
				movw	ads,ya			; kurikaeshi ads set
				bra		ks20
;........................................
ks40:			movw	adx+2,ya		; adx+2,+3 set
				mov		y,#015			; shoki address set (8ch)
;
ks42:			mov		a,[adx+2]+y		; part sento add. set
				mov		!add+y,a		; add.
				dec		y
				bpl		ks42
;........................................
				mov		x,#000			; shoki data set
				mov		keyd,#001h
;
ks44:			mov		a,add+1+x
				beq		ks46
;
				mov		a,!snos+x
				bne		ks46
;
				mov		a,#000
				call	!snoset			; sno data set
;
ks46:			mov		a,#000
				mov		ptc+x,a			; pt  count = 0
				mov		pvoc+x,a		; vol move count
				mov		panc+x,a		; pan move count
				inc		a
				mov		ngc+x,a			; Nagasa count set (ngo)
;
				inc		x
				inc		x				; + 2
				asl		keyd
				bne		ks44
;************************************************
txh:			mov		x,#000			; channel count
				mov		vols,x			; vols reset
				mov		keyd,#001h		; key data set
;................................................
tx00:			mov		chn,x
				mov		a,add+1+x
				beq		tx60			; kami = 0 (no use channel)
;................................................
				dec		ngc+x
				bne		tx20
;......
tx10:			call	!data_in		; data in & inc add
				bne		tx15			; block end ?
;
				mov		a,ptc+x			; pattern chu ?
				beq		ks20			;
;................................................
				call	!addset			; pattern start add set
;......
				dec		ptc+x			; pattern end ?
				bne		tx10
;......
				mov		a,!adt+x		; add restore (pattern end)
				mov		add+x,a
				mov		a,!adt+1+x
				mov		add+1+x,a
				bra		tx10			;
;................................................
tx15:			bmi		tx16			; d7 = 1 ?
;
				mov		!ngs+x,a		; Nagasa Store
;......
				call	!data_in		; data in & inc add
				bmi		tx16			; d7 = 1 ?
;......
				push	a				; % & vol
				xcn		a				; kami
				and		a,#007h
				mov		y,a
				mov		a,!gate+y		; Gate off (%) set
				mov		!ngg+x,a
;
				pop		a				; shimo
				and		a,#00fh
				mov		y,a
				mov		a,!volt+y
				mov		!vol+x,a		; vol set
;...................
;				mov		kkk,a			; X 2.5
;				lsr		kkk
;				asl		a
;				adc		a,kkk
;				mov		!ngg+x,a		; Gate off (%) set
;...
;				call	!data_in		; data in & inc add
;				bmi		tx16			; $
;...
;				asl		a				; X 2
;				mov		!vol+x,a		; Gain set
;...................
				call	!data_in		; data in & inc add
;
tx16:			cmp		a,#sno			; special flag ?
				bcc		tx17
;
				call	!spfx			; special flag
				bra		tx10
;
tx17:
				mov		a,!cutk+x		;		!! test !!
				or		a,ffk			;		!! test !!
				bne		tx18			;		!! test !!
				mov		a,y				;		!! test !!
;
				call	!dss			; freq. data set
;...................
tx18:			mov		a,!ngs+x
				mov		ngc+x,a
				mov		y,a
;
				mov		a,!ngg+x		; Gate off (step) set
				mul		ya
				mov		a,y
				bne		tx19
				inc		a				; a = 1
tx19:			mov		ngo+x,a
				bra		tx40
;................................................
tx20:
				mov		a,ffk			;		!! test !!
				bne		tx60			;		!! test !!
;
tx22:			call	!keych			; keyoff & sweep & vib check
;................................................
tx40:			call	!swpch			; sweep check (next data)
;................................................
tx60:			inc		x				;
				inc		x				;
				asl		keyd			;
				bne		tx00			; channel end ? (8ch)
;************************************************
;				tempo move	tmp mvol pan move keisan & gain set
;************************************************
tmpy:			mov		a,tmpc			; tmp move chu ?
				beq		evoy
;
				movw	ya,tmpadw		; move keisan
				addw	ya,tmpw
				dbnz	tmpc,tmp20		; dec & bne
;										; tmpc = 0 (move end)
				movw	ya,tmpc			; y <- tmpm , a <- 00
tmp20:			movw	tmpw,ya
;************************************************
;				evol move
;************************************************
evoy:			mov		a,evoc			; evo move chu ?
				beq		mvoy
;
				movw	ya,evoladw		; move keisan
				addw	ya,evolw
				movw	evolw,ya
;
				movw	ya,evoradw		; move keisan
				addw	ya,evorw
				dbnz	evoc,evo12		; dec & bne
;
				movw	ya,evoc			; y <- evolm , a <- 00
				movw	evolw,ya
				mov		y,evorm			;
evo12:			movw	evorw,ya
;************************************************
;				mvol move
;************************************************
mvoy:			mov		a,mvoc			; mvol move chu ?
				beq		mvo40
;
				movw	ya,mvoadw		; move keisan
				addw	ya,mvow
				dbnz	mvoc,mvo10		; dec & bne
;										; mvoc = 0 (move end)
				movw	ya,mvoc			; y <- mvom , a <- 00
mvo10:			movw	mvow,ya
				mov		vols,#0ffh		; mvo set
;................................................
mvo40:			mov		x,#000			; vol set keyon & end
				mov		keyd,#001h		; key data set (8ch)
;
mvo42:			mov		a,add+1+x
				beq		mvo46			; kami = 0
;
				call	!voly			; tre pan move & vol set
;
mvo46:			inc		x
				inc		x
				asl		keyd
				bne		mvo42
;
mvo48:			ret
;................................................
;
;
;************************************************
;				special flag check
;************************************************
spfx:			asl		a
				mov		y,a
_spft = sno*2-256
				mov		a,!spft+1-_spft+y		; high
				push	a
				mov		a,!spft-_spft+y			; low
				push	a
;
				mov		a,y
				lsr		a
				mov		y,a
				mov		a,!spfp-sno+128+y		;
				beq		data_inr
;************************************************
;				data in  &	inc address
;************************************************
data_in:		mov		a,[add+x]		; data in
;
add_inc:		inc		add+x
				bne		data_inr
				inc		add+1+x
data_inr:		mov		y,a				; flag set
				ret
;................................................
;
;
;************************************************
;				sound no.
;************************************************
snox:			;call	!data_in		; data in & inc add
;************************************************
;				Sound No. data set
;************************************************
snoset:			mov		!snos+x,a		; sno store
;
snoset0:		mov		y,a				; d7 check
				bpl		snoset1
;......
				setc
				sbc		a,#dd0
;
				clrc
				adc		a,wavs			; bias add.
;......
snoset1:		mov		y,#006			; x=channel a=sno
				mul		ya
				movw	adx,ya
				clrc
				adc		adx,#<sod
				adc		adx+1,#>sod
;...
				mov		a,fkin			; kinshi flag check
				and		a,keyd
				bne		snosetr
;...
				push	x
				mov		a,x				; apuch
				xcn		a
				lsr		a
				or		a,#004			; write address
				mov		x,a
;
				mov		y,#000			; 1st data in
				mov		a,[adx]+y		; sound data set
				bpl		snoset4			; noise ?
;......
snoset2:		and		a,#01fh			; noise clock store
				and		flgs,#020h
				tset1	!flgs			; noise clock store
;
				or		nons,keyd		; noise channel store
;
				mov		a,y				; y = 0 (=dd0)
				bra		snoset8
;......
snoset4:		mov		a,keyd			; normal sno
				tclr1	!nons			; noise channel clear
;...................
snoset6:		mov		a,[adx]+y		; sound data set
snoset8:		mov		!apuadd,x		; write address
				mov		!apudt,a		; data write
;
				inc		x
				inc		y
				cmp		y,#004
				bne		snoset6			; tensou data 4
;
				pop		x
				mov		a,[adx]+y		; 5 ban me (block su)
				mov		!bls+1+x,a		; block su store
				inc		y
				mov		a,[adx]+y		; 6 ban me (block su)
				mov		!bls+x,a		; block su store
;
snosetr:		ret
;************************************************
;				pan data set
;************************************************
panx:			;call	!data_in		; data in & inc add
				mov		!panf+x,a		; pan flag store
;
				and		a,#01fh
				mov		!pand+x,a		; pan data
				mov		a,#000
				mov		!pandw+x,a
;
				ret
;************************************************
;				pan move
;************************************************
pamx:			;call	!data_in		; data in & inc add
				mov		panc+x,a		; pan (count)
				push	a				; count --> x
;
				call	!data_in		; data in & inc add
				mov		!panm+x,a		; pan (mokuteki)
;......
				setc
				sbc		a,!pand+x		; pan (now data)
				pop		x				; count --> x
;
				call	!divx			; x=count a=sa c=+,-
;......
				mov		!panadw+x,a		; + shimo
				mov		a,y				; kami
				mov		!panad+x,a		; + kami
				ret
;************************************************
;				vibrate
;************************************************
vibx:			;call	!data_in		; data in & inc add
				mov		!vibhs+x,a		; vib hold
;
				call	!data_in		; data in & inc add
				mov		!vibcad+x,a		; vib speed (+@)
;
				call	!data_in		; data in & inc add
;************************************************
;				vibrate off
;************************************************
vofx:			mov		vibd+x,a		; vib depth
				mov		!vibdm+x,a		; vib depth mokuteki
;
				mov		a,#000
				mov		!vibcs+x,a		; vib change count
				ret
;************************************************
;				vibrate change
;************************************************
vchx:			;call	!data_in		; data in & inc add
				mov		!vibcs+x,a		; vib change count
				push	a
;
				mov		y,#000
				mov		a,vibd+x		;
				pop		x
				div		ya,x			; ya/x = a ... y
;
				mov		x,chn
				mov		!vibad+x,a
;
				ret
;************************************************
;				main volume change
;************************************************
mv1x:			;call	!data_in		;;00
				mov		a,#000
				movw	mvow,ya			; main vol
				ret
;************************************************
;				main volume move
;************************************************
mv2x:			;call	!data_in		; data in & inc add
				mov		mvoc,a			; mvol (count)
;
				call	!data_in		; data in & inc add
				mov		mvom,a			; mvol (mokuteki)
;......
				setc
				sbc		a,mvo			; mvol (now data)
				mov		x,mvoc			; count --> x
;
				call	!divx			; x=count a=sa c=+,-
;
				movw	mvoadw,ya		; + @
				ret
;************************************************
;				tempo change
;************************************************
tp1x:			;call	!data_in		;;00
				mov		a,#000
				movw	tmpw,ya			; tempo
				ret
;************************************************
;				tempo move
;************************************************
tp2x:			;call	!data_in		; data in & inc add
				mov		tmpc,a			; tmp (count)
;
				call	!data_in		; data in & inc add
				mov		tmpm,a			; tmp (mokuteki)
;......
				setc
				sbc		a,tmp			; tmp (now data)
				mov		x,tmpc			; count --> x
;
				call	!divx			; x=count a=sa c=+,-
;......
				movw	tmpadw,ya		; + @
				ret
;************************************************
;				key tras.
;************************************************
ktpx:			;call	!data_in		;; 0
				mov		ktps,a			; key trans. store
				ret
;************************************************
;				part key tras.
;************************************************
ptpx:			;call	!data_in		;; x
				mov		!ptps+x,a		; key trans. store
				ret
;************************************************
;				tremolo
;************************************************
trex:			;call	!data_in		; data in & inc add
				mov		!trehs+x,a		; tre hold
;
				call	!data_in		; data in & inc add
				mov		!trecad+x,a		; tre speed (+@)
;
				call	!data_in		; data in & inc add
;************************************************
;				tremolo off				; a = 0
;************************************************
tofx:			mov		tred+x,a		; tre depth
				ret
;************************************************
;				sweep kurikaeshi
;************************************************
swkx:			mov		a,#001			;
				bra		swsx0
;................................................
swsx:			mov		a,#000
swsx0:			mov		!swsk+x,a		; a = 0
;
				;call	!data_in		; data in & inc add
				mov		a,y
				mov		!swshc+x,a		; hold
;
				call	!data_in		; data in & inc add
				mov		!swsc+x,a		; count
;
				call	!data_in		; data in & inc add
				mov		!swss+x,a		; + @
				ret
;................................................
;				sweep off				; a = 0
;................................................
sofx:			mov		!swsc+x,a		;
				ret
;************************************************
;				part vol set
;************************************************
pv1x:			;call	!data_in		;;0x
				mov		!pvod+x,a		; vol set
				mov		a,#000
				mov		!pvodw+x,a
				ret
;************************************************
;				part vol move
;************************************************
pv2x:			;call	!data_in		; data in & inc add
				mov		pvoc+x,a		; vol (count)
				push	a				; count --> x
;
				call	!data_in		; data in & inc add
				mov		!pvom+x,a		; vol (mokuteki)
;......
				setc
				sbc		a,!pvod+x		; vol (now data)
				pop		x				; count --> x
;
				call	!divx			; x=count a=sa c=+,-
;......
				mov		!pvoadw+x,a		; + shimo
				mov		a,y				; kami
				mov		!pvoad+x,a		; + kami
				ret
;************************************************
;				part tune
;************************************************
tunx:			;call	!data_in		;; x
				mov		!tund+x,a		; tune set
				ret
;************************************************
;				rythm pattern
;************************************************
patx:			;call	!data_in		; data in & inc add
				mov		!adp+x,a		; pattern add. (low)
				call	!data_in		; data in & inc add
				mov		!adp+1+x,a		; pattern add. (high)
;
				call	!data_in		; data in & inc add
				mov		ptc+x,a			; rythm pattern count
;
				mov		a,add+x			; add taihi
				mov		!adt+x,a
				mov		a,add+1+x
				mov		!adt+1+x,a
;
addset:			mov		a,!adp+x		; pattern add. (low)
				mov		add+x,a
				mov		a,!adp+1+x		; pattern add. (high)
				mov		add+1+x,a
				ret
;************************************************
;				echo on channel & volume
;************************************************
ecvx:			;call	!data_in		; data in & inc add
				mov		eons,a			; echo channel set
;
				call	!data_in		; data in & inc add
				mov		a,#000
				movw	evolw,ya
;
				call	!data_in		; data in & inc add
				mov		a,#000
				movw	evorw,ya
;
				clr1	flgs.5			; write enable
;
				ret
;************************************************
;				echo volume move
;************************************************
ev2x:			;call	!data_in		; data in & inc add
				mov		evoc,a			; evol (count)
;......
				call	!data_in		; data in & inc add
				mov		evolm,a			; evol (mokuteki)
;...
				setc
				sbc		a,evol			; evol (now data)
				mov		x,evoc			; count --> x
;
				call	!divx			; x=count a=sa c=+,-
				movw	evoladw,ya		; + @
;...................
				call	!data_in		; data in & inc add
				mov		evorm,a			; evor (mokuteki)
;...
				setc
				sbc		a,evor			; evor (now data)
				mov		x,evoc			; count --> x
;
				call	!divx			; x=count a=sa c=+,-
				movw	evoradw,ya		; + @
				ret
;************************************************
;				echo off
;************************************************
eofx:			movw	evolw,ya		; ya = 00
				movw	evorw,ya		; EVOL "00" set
;
				set1	flgs.5			; write disable
				ret
;************************************************
;				echo delay time & feed back
;************************************************
edlx:			;call	!data_in		; data in & inc add
				call	!esaset			; EDL & ESA set
;
				call	!data_in		; data in & inc add
				mov		efbs,a			; EFB = feed back
;
				call	!data_in		; data in & inc add
;
filset:			mov		y,#008			; a = fil no.
				mul		ya
				mov		x,a				; table add.
				mov		y,#00fh			; tenso address set
;
filset2:		mov		a,!fild+x
				call	!apus			; a=data  y= address
;
				inc		x
				mov		a,y
				clrc
				adc		a,#010h
				mov		y,a
				bpl		filset2			; until 07fh
;
				mov		x,chn
				ret
;........................................
esaset:			mov		eclr,a			; echo delay time
;
				mov		y,#07dh			; EDL = delay time
				mov		!apuadd,y
				mov		a,!apudt
				cmp		a,eclr
				beq		esaset4
;......
				and		a,#00fh
				eor		a,#0ffh
				bbc		ekin.7,esaset1	; kinshi chu ?
				clrc
				adc		a,ekin
esaset1:		mov		ekin,a			; echo kinshi time
;
				mov		y,#004
esaset2:		mov		a,!dseta-1+y	; EON EFB EVOL EVOR
				mov		!apuadd,a		; write address
				mov		a,#000h
				mov		!apudt,a		; data write
				dbnz	y,esaset2		;
;
				mov		a,flgs
				or		a,#020h
				mov		y,#06ch			; FLG echo off
				call	!apus			; a=data  y=address
;
				mov		a,eclr
				mov		y,#07dh			; EDL = delay time
				call	!apus			; a=data  y=address
;......
esaset4:		asl		a				; ESA set
				asl		a
				asl		a
				eor		a,#0ffh
				setc
				adc		a,#0ffh			; 0ffh = echo end add.	** henko **
				mov		y,#06dh			; ESA = echo start add.
				jmp		!apus			; a=data  y=address
;************************************************
;				source count
;************************************************
wavx:
				mov		wavs,a			;
				ret						;
;************************************************
;				sel dammy
;************************************************
selx:			call	!add_inc		;		 !! test !!
				ret						;		 !! test !!
;************************************************
;				sound cut
;************************************************
cutx:			inc		a				;		 !! test !!
				mov		!cutk+x,a		;		 !! test !!
				ret						;		 !! test !!
;************************************************
;				F.F. set
;************************************************
fftx:			inc		a				;		 !! test !!
;************************************************
;				F.F. clear
;************************************************
plyx:			mov		ffk,a			;		 !! test !!
				jmp		!ks04			; keyoff !! test !!
;................................................
;************** sweep check (next data) *********
;................................................
swpch:			mov		a,swpc+x		;
				bne		swpadsetr
;
				mov		a,[add+x]		; next data check
				cmp		a,#swp
				bne		swpadsetr		; not [swp] ?
;......
				call	!add_inc		; inc add
				call	!data_in		; data in & inc add
swpx:			mov		swphc+x,a		; sweep (hold)
;
				call	!data_in		; data in & inc add
				mov		swpc+x,a		; sweep (counter)
;
				call	!data_in		; data in & inc add
				clrc					; key trans. add.
				adc		a,ktps
				adc		a,!ptps+x
;................................................
swpadset:		and		a,#07fh			; $
				mov		!swpm+x,a		; sweep (mokuteki)
;......
				setc					;
				sbc		a,!swpd+x		; moku - now
;
				mov		y,swpc+x		; sweep count
				push	y
				pop		x				; count --> x
;
				call	!divx			; x=count a=sa c=+,-
				mov		!swpadw+x,a		; + shimo
				mov		a,y
				mov		!swpad+x,a		; + kami
swpadsetr:		ret
;........................................
swpdset:		mov		a,!swpd+x		; kkk sss <-- swpd swpdw
				mov		kkk,a
				mov		a,!swpdw+x		;
				mov		sss,a
				ret
;................................................
;************** div keisan	from tp2 & mv2 & pam & swp (x=count a=sa)
;................................................
divx:			notc					; c=1 plus
				ror		ttt				; data store
				bpl		div10			; plus ?
;......
				eor		a,#0ffh			; minus
				inc		a
;......
div10:			mov		y,#000			; sa --> 00 sa ( y a )
				div		ya,x			; 00 sa / count --> a ... y
				push	a				; kami
;
				mov		a,#000
				div		ya,x			; sa 00  / count --> a
				pop		y				; ya data set
				mov		x,chn			;
;...................
minusc:			bbc		ttt.7,divr		; ttt d7=1 ?
;
				movw	adx,ya			; minus
				movw	ya,t00
				subw	ya,adx
divr:			ret
;................................................
spft: .word snox,panx,pamx,vibx,vofx,mv1x,mv2x,tp1x,tp2x
	  .word ktpx,ptpx,trex,tofx,pv1x,pv2x,patx,vchx,swkx,swsx,sofx
	  .word tunx,ecvx,eofx,edlx,ev2x,swpx,wavx
	  .word									selx,cutx,fftx,plyx			; !! test !!
spfp: .byte 0001,0001,0002,0003,0000,0001,0002,0001,0002
	  .byte 0001,0001,0003,0000,0001,0002,0003,0001,0003,0003,0000
	  .byte 0001,0003,0000,0003,0003,0003,0001
	  .byte									0002,0000,0000,0000			; !! test !!
;................................................
;
;
;
;************************************************
;				part vol move
;************************************************
voly:			mov		a,pvoc+x		; vol move chu ?
				beq		trey
;................................................
				or		vols,keyd		; vol set flag
				dec		pvoc+x
				bne		vol24			;
;...
				mov		a,#000
				mov		!pvodw+x,a		; vol shosuten ika
;
				mov		a,!pvom+x		; vol (mokuteki)
				bra		vol26
;...
vol24:			clrc
				mov		a,!pvodw+x		; vol keisan
				adc		a,!pvoadw+x
				mov		!pvodw+x,a
;
				mov		a,!pvod+x
				adc		a,!pvoad+x
vol26:			mov		!pvod+x,a
;************************************************
;				tremolo check
;************************************************
trey:			mov		y,tred+x		; tre chu ?
				beq		tre22
;
				mov		a,!trehs+x		; hold chu ?
				cbne	trehc+x,tre20
;................................................
				or		vols,keyd		; vol set flag
;......
				mov		a,!trec+x		; trec = a
				bpl		tre02			; trec = 080h ijo ?
;
				inc		y				; tred = 0ffh ?
				bne		tre02
;
				mov		a,#080h
				bra		tre04
;......
tre02:			clrc					; speed keisan
				adc		a,!trecad+x
tre04:			mov		!trec+x,a		; count data
;
				call	!treset			; volx set
				bra		pany
;................................................
tre20:			inc		trehc+x			; hold chu
;
tre22:			mov		a,#0ffh			; y = depth (tre)
				call	!volxset		; volx set
;************************************************
;				pan move & gain set
;************************************************
pany:			mov		a,panc+x		; pan move chu ?
				beq		pan10
;..............................................
				or		vols,keyd		; vol set flag
				dec		panc+x
				bne		pan04			;
;...
				mov		a,#000
				mov		!pandw+x,a		; pan shosuten ika
;
				mov		a,!panm+x		; pan (mokuteki)
				bra		pan06
;...
pan04:			clrc
				mov		a,!pandw+x		; pan keisan
				adc		a,!panadw+x
				mov		!pandw+x,a
;
				mov		a,!pand+x
				adc		a,!panad+x
pan06:			mov		!pand+x,a
;..............................................
pan10:			mov		a,keyd
				and		a,vols			; vol set ?
				beq		panr
;...
				mov		a,!pand+x		; kami
				mov		y,a
				mov		a,!pandw+x		; shimo
				movw	sss,ya
;................................................
pan20:			mov		a,x				; kkk sss --> pand set
				xcn		a
				lsr		a				; apuch
				mov		ttt,a			; r.gain = 0
;................................................
pan30:			mov		y,kkk			; right gain keisan
				mov		a,!pant+1+y
				setc
				sbc		a,!pant+y		; sa --> a
				mov		y,sss			; shimo
				mul		ya				; sa x 0.???
				mov		a,y				;		   --> a
;
				mov		y,kkk			; kami
				clrc
				adc		a,!pant+y		; pan data --> a
				mov		y,a
;
				mov		a,!volx+x		; gain data set
				mul		ya				;
;
				mov		a,!panf+x
				asl		a
				bbc		ttt.0,pan32
				asl		a
pan32:			mov		a,y
				bcc		pan34
;
				eor		a,#0ffh
				inc		a
;
pan34:			mov		y,ttt			; write address
				call	!apusx			; a=data  y=address
;................................................
				mov		y,#020			; left gain keisan
				mov		a,#000
				subw	ya,sss			; 20.00 - kkk sss
				movw	sss,ya
				inc		ttt				; l.gain = 1
				bbc		ttt.1,pan30
;
panr:			ret
;................................................
;
;
;************************************************
;				keyoff check
;************************************************
keych:			mov		a,ngo+x			; key off ?
				beq		swpy
;
				dec		ngo+x			; key off ?
				beq		key02
;
				mov		a,#002
				cbne	ngc+x,swpy
;...................
key02:			mov		a,ptc+x			; pattern count
				mov		adx+3,a
;
				mov		a,add+x			; address set
				mov		y,add+1+x
key04:			movw	adx,ya
;
				mov		y,#000h
;......
key10:			mov		a,[adx]+y		; data in
				beq		key16			; block end ?
				bmi		key14
;
key12:			inc		y
				bmi		key20			; ** check **
				mov		a,[adx]+y		; data in
				bpl		key12			; nagasa ?
;
key14:			cmp		a,#xxx			; xxx ?
				beq		swpy			; = tai
;
				cmp		a,#pat
				beq		key18			; pat ?
;
				cmp		a,#sno
				bcc		key20			; special flag ?
;...
				push	y				; special flag
				mov		y,a
				pop		a
				adc		a,!spfp-sno+y	; c=1
				mov		y,a
				bra		key10
;...................
key16:			mov		a,adx+3			; pattern chu ?
				beq		key20
;......
				dec		adx+3			; pattern end ?
				bne		key17
;
				mov		a,!adt+1+x		; add restore (pattern end)
				push	a
				mov		a,!adt+x
				pop		y
				bra		key04			;
;
key17:			mov		a,!adp+1+x		; pattern add. (high)
				push	a
				mov		a,!adp+x		; pattern add. (low)
				pop		y
				bra		key04			;
;......
key18:			inc		y				; pat
				mov		a,[adx]+y		; data in
				push	a				; add. low
				inc		y				;
				mov		a,[adx]+y		; data in
				mov		y,a				; add. high
				pop		a
				bra		key04			;
;...................
key20:			mov		a,keyd			; key off set
				mov		y,#keyoff		;
				call	!apusx			; keyoff set (a=keyd)
;************************************************
;				sweep check
;************************************************
swpy:			clr1	uuu.7			; sweep chu flag
;
				mov		a,swpc+x		; sweep chu ?
				beq		viby
;................................................
swp10:			mov		a,swphc+x		; hold chu ?
				beq		swp20
;
				dec		swphc+x			; hold chu
				bra		viby
;................................................
swp20:			set1	uuu.7			; sweep chu flag
;........................................
				dec		swpc+x			; sweep keisan
				bne		swp24			;
;...
				mov		a,!tund+x
				mov		!swpdw+x,a		; sweep shosuten ika
;
				mov		a,!swpm+x		; sweep (mokuteki)
				bra		swp26
;...
swp24:			clrc
				mov		a,!swpdw+x		; sweep keisan
				adc		a,!swpadw+x
				mov		!swpdw+x,a
;
				mov		a,!swpd+x
				adc		a,!swpad+x
swp26:			mov		!swpd+x,a
;************************************************
;				vib check
;************************************************
viby:			call	!swpdset		; kkk sss <-- swpd swpdw
;................................................
vib10:			mov		a,vibd+x		; vib chu ?
				beq		vib12
;
				mov		a,!vibhs+x
				cbne	vibhc+x,vib11	; hold chu ?
;................................................
				mov		a,!vibcc+x		;
				cmp		a,!vibcs+x
				bne		vib15			; change chu ?
;...
				mov		a,!vibdm+x		; vib change end !
				bra		vib17
;......
vib15:			setp					; change chu
				inc		<vibcc+x
				clrp
;
				mov		y,a				; !vibcc+x = 0 ?
				beq		vib16			; change begin (a=0)
;
				mov		a,vibd+x		; change chu
vib16:			clrc
				adc		a,!vibad+x
vib17:			mov		vibd+x,a		;
;................................................
vib18:			mov		a,!vibc+x		; vib keisan
				clrc
				adc		a,!vibcad+x
				mov		!vibc+x,a		; count data
;................................................
vib20:			mov		ttt,a			; depth keisan
;
				asl		a
				asl		a
				bcc		vib21			; count data d6=0 ?
;
				eor		a,#0ffh
;......
vib21:			mov		y,a
				mov		a,vibd+x		; vib depth (%)
				cmp		a,#0f1h
				bcc		vib24
;
vib22:			and		a,#00fh			;
				mul		ya
				bra		vib25
;
vib24:			mul		ya
				mov		a,y				; shosuten ika
				mov		y,#000			; kami
;
vib25:			call	!minusad		; if ttt(d7)=1 then minus + sss
;......
;				addw	ya,sss			; vib keisan
;				movw	sss,ya			; data set
;................................................
vib40:			jmp		!dssx			; fre. set (call)
;................................................
vib11:			inc		vibhc+x			; hold chu
vib12:			bbs		uuu.7,vib40		; sweep chu ?
				ret
;................................................
;
;
;................................................
;************** tremolo check *******************
;................................................
trry:			clr1	uuu.7			; tre chu flag
;
				mov		a,tred+x		; tre chu ?
				beq		pnny
;
				mov		a,!trehs+x		; hold chu ?
				cbne	trehc+x,pnny
;................................................
				call	!tresetx		; volx set
;................................................
;************** pan move check ******************
;................................................
pnny:			mov		a,!pand+x		; kami
				mov		y,a
				mov		a,!pandw+x		; shimo
				movw	sss,ya
;...
				mov		a,panc+x		; pan move chu ?
				beq		pnn04
;...
				mov		a,!panad+x
				mov		y,a
				mov		a,!panadw+x		; + @ keisan
;
				call	!hokan			; kkk sss <-- data set
;...
pnn04:			bbc		uuu.7,sppy
;......
				call	!pan20			; vol data set
;................................................
;************** sweep check *********************
;................................................
sppy:			clr1	uuu.7			; sweep chu flag
;
				call	!swpdset		; kkk sss <-- swpd swpdw
;...
				mov		a,swpc+x		; sweep chu ?
				beq		vbby
;
				mov		a,swphc+x		; hold chu ?
				bne		vbby
;...................
				mov		a,!swpad+x
				mov		y,a
				mov		a,!swpadw+x
;
				call	!hokan			; kkk sss <-- data set
;................................................
;************** vib check ***********************
;................................................
vbby:			mov		a,vibd+x		; vib chu ?
				beq		vib12			; uuu d7 check & ret
;
				mov		a,!vibhs+x
				cbne	vibhc+x,vib12	; hold chu ?
;................................................
vbb10:			mov		y,tmpd
				mov		a,!vibcad+x		; vib keisan
				mul		ya
				mov		a,y
				clrc
				adc		a,!vibc+x		; vib count
				jmp		!vib20			; depth keisan & data set
;................................................
;************** hokan keisan ********************
;................................................
hokan:			set1	uuu.7			; from sppy
				mov		ttt,y			; data store
;...
				call	!minusc			; if ttt(d7)=1 then minus
;
				push	y
				mov		y,tmpd			; X 0.???
				mul		ya				; a = shimo
				mov		adx,y
				mov		adx+1,#000
;
				mov		y,tmpd
				pop		a				; a = kami
				mul		ya
				addw	ya,adx
;
minusad:		call	!minusc			; if ttt(d7)=1 then minus
;...
				addw	ya,sss			; sweep keisan
				movw	sss,ya			; data set
				ret
;................................................
;************** tremolo data set ****************
;................................................
tresetx:		set1	uuu.7			; call from trr
;
				mov		y,tmpd
				mov		a,!trecad+x		; tre keisan
;
				mul		ya
				mov		a,y
				clrc
				adc		a,!trec+x
;................................................
treset:			asl		a				; volx set
				bcc		treset2
;
				eor		a,#0ffh
;
treset2:		mov		y,tred+x
				mul		ya				; tre depth x wave
;
				mov		a,y
				eor		a,#0ffh			; = 1 - depth
;...................
volxset:		mov		y,mvo			; main vol x ( 1 - depth )
				mul		ya				;
;
				mov		a,!vol+x		; vol x
				mul		ya
;
				mov		a,!pvod+x		; part vol x
				mul		ya
;
				mov		a,y				; dB
				mul		ya				; dB
;
				mov		a,y
				mov		!volx+x,a
;
				ret
;................................................
;
;
;..............................................
pant:	; 0 - 20
  .byte	000,001,003,007,013,021,030,041,052,066
  .byte	081,094,103,110,115,119,122,124,125,126,127
;
;* .byte	127,126,126,125,123,120,116,111,105,098
;* .byte	089,080,070,060,050,040,030,022,014,006,000
;..............................................
;
;
;................................................
fild:  ;											; Filter	(0xfh)
   .byte	07fh,000h,000h,000h,000h,000h,000h,000h ; no filter (x1.0)
   .byte	058h,0bfh,0dbh,0f0h,0feh,007h,00ch,00ch ; high pass
   .byte	00ch,021h,02bh,02bh,013h,0feh,0f3h,0f9h ; low  pass
   .byte	034h,033h,000h,0d9h,0e5h,001h,0fch,0ebh ; band pass
;................................................
dseta: ; 	 EVOL EVOR EFB  EON  FLG				NOOF PMON
   .byte	  02ch,03ch,00dh,04dh,06ch,keyon,keyoff,03dh,02dh,keyoff
dsetd: ;		 1	  2    3	4	 5	  6    7	8	 9	  10
   .byte	  evol,evor,efbs,eons,flgs,keyons,t00,nons,mons,keyoffs
;................................................
;
;
;
;
;************************************************
gfd:	;c00  c01  d00	d01  e00  f00  f01	g00  g01  a00  a01	b00  1.0594631
; .word	0066,0070,0075,0079,0084,0089,0094,0100,0106,0112,0119,0126  ; c00
; .word	0133,0141,0150,0159,0168,0178,0189,0200,0212,0225,0238,0252  ; c10
; .word	0267,0283,0300,0318,0337,0357,0378,0401,0425,0450,0477,0505  ; c20
; .word	0535,0567,0601,0637,0675,0715,0757,0802,0850,0901,0954,1011  ; c30
; .word	1071,1135,1202,1274,1350,1430,1515,1605,1701,1802,1909,2022  ; c40
  .word	2143,2270,2405,2548,2700,2860,3030,3211,3402,3604,3818,4045  ; c50
  .word	4286;4541,4811,5097,5400,5721,6061,6422,6804,7208,7637,8091  ; c60
;
; 3=e60 , 4=b50 , 5=g50 , 6=e50 , 7=c51 , 8=b40 , 9=a40 , 10=g40
;************************************************		; 7.6560747 = 07.a8h
;
;************************************************
   .byte	"*Ver S1.20*"						; ** version check **

;************************************************
;
;
;***************************************
;				tensou program
;***************************************
ten00:			mov		a,#0aah			;
				mov		!port0,a		;
				mov		a,#0bbh			;
				mov		!port1,a		;
;........................................
ten02:			mov		a,!port0		; flag O.K. ?
				cmp		a,#0cch			;
				bne		ten02			;
				bra		ten40			;
;........................................
ten16:			mov		y,!port0		;
				bne		ten16			;
;........................................
ten20:			cmp		y,!port0		;
				bne		ten26
;......
				mov		a,!port1
				mov		!port0,y
				mov		[adx]+y,a		;
;
				inc		y
				bne		ten20			;
;......
				inc		adx+1			;
				bra		ten20			;
;........................................
ten26:			bpl		ten20			;
;
				cmp		y,!port0		;
				bpl		ten20			;
;........................................
ten40:			mov		a,!port2		;
				mov		y,!port3		;
				movw	adx,ya			;
;
				mov		y,!port0		;
				mov		a,!port1		;
				mov		!port0,y		; flag return
				bne		ten16			; port1 = 0 ?
;........................................
				mov		x,#031h			; in port clear
				mov		!cont,x
;
				ret
;........................................
;
;
;
;
;
;gft:	.dw	 0d000h,0d000h,0d000h,0d000h
;
;		.include		"xxxxx.src"
;
;
;
;
;						end
