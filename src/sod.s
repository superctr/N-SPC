	.segment "WAVE_SOD"
	.export sod

sod:
	;		son,adsr,adsr,gain, blk No 
	;---------------------------------------
	.byt	$00, $ff, $e0, $b8, $03, $00	; [00] B:\SMD\SOL\KABEEP01.SOL
	.byt	$01, $ff, $e0, $b8, $03, $00	; [01] B:\SMD\SOL\KABEEP02.SOL
	.byt	$02, $ff, $e0, $b8, $01, $00	; [02] B:\SMD\SOL\KABEEP03.SOL
	.byt	$03, $ff, $e0, $b8, $01, $70	; [03] B:\SMD\SOL\NOISE01L.SOL
	.byt	$04, $ff, $e0, $b8, $03, $60	; [04] B:\SMD\SOL\NOIZ02.SOL
	.byt	$05, $ff, $e0, $b8, $05, $50	; [05] B:\SMD\SOL\KAPIPI.SOL
	.byt	$06, $ff, $e0, $b8, $03, $10	; [06] B:\SMD\SOL\SE_85.SOL
	.byt	$07, $af, $1f, $b8, $01, $20	; [07] B:\SMD\SOL\SE_8F.SOL
	.byt	$08, $ff, $e0, $b8, $03, $10	; [08] B:\SMD\SOL\SE_90.SOL
	.byt	$09, $ff, $e0, $b8, $03, $10	; [09] B:\SMD\SOL\SE_93.SOL
	.byt	$0a, $8f, $e0, $b8, $01, $60	; [0a] B:\SMD\SOL\SE_9C.SOL
	.byt	$0b, $ff, $e0, $b8, $01, $10	; [0b] B:\SMD\SOL\DOOR01.SOL
	.byt	$0c, $8f, $e0, $b8, $01, $10	; [0c] B:\SMD\SOL\SE_BOMB1.SOL
	.byt	$0d, $8f, $e0, $b8, $01, $40	; [0d] B:\SMD\SOL\SE_B9.SOL
	.byt	$0e, $ff, $e0, $b8, $01, $e0	; [0e] B:\SMD\SOL\SE_AC.SOL
	.byt	$0f, $ff, $e0, $b8, $02, $50	; [0f] B:\SMD\SOL\SE_BC.SOL
	.byt	$10, $ff, $e0, $b8, $03, $40	; [10] B:\SMD\SOL\SE_B4.SOL
	.byt	$11, $fd, $e0, $b8, $03, $00	; [11] B:\SMD\SOL\JST012L.SOL
	.byt	$12, $fe, $e0, $b8, $06, $20	; [12] B:\SMD\SOL\KKBAST01.SOL
	.byt	$13, $ff, $e0, $b8, $03, $00	; [13] B:\SMD\SOL\PIZ_GB2.SOL
	.byt	$14, $af, $6e, $b8, $03, $70	; [14] B:\SMD\SOL\JMBOX001.SOL
	.byt	$15, $ff, $ee, $b8, $03, $00	; [15] B:\SMD\SOL\JHRP001L.SOL
	.byt	$16, $ff, $e0, $b8, $02, $b0	; [16] B:\SMD\SOL\BD909GB1.SOL
	.byt	$17, $ff, $e0, $b8, $05, $00	; [17] B:\SMD\SOL\SD909GB1.SOL

