.export save
VERA_LADDR := $9F20
VERA_MADDR := $9F21
VERA_HADDR := $9F22
VERA_DATA0 := $9F23
VERA_DATA1 := $9F24
VERA_CTRL  := $9F25
SETLFS := $FFBA
CHKOUT := $FFC9
CLRCHN := $FFCC
MCIOUT := $FEB1
BITMAP_END := $012C
.org $0700
save:
	tax
	jsr CHKOUT
	stz tosend
	lda #<BITMAP_END
	sta tosend+1
	lda #>BITMAP_END
	sta tosend+2
@loop:
	ldx #$23
	ldy #$9f
	lda tosend
	sec
	jsr MCIOUT
	bcs @error
	stx tmp1
	lda tosend
	sec
	sbc tmp1
	sta tosend
	lda tosend+1
	sty tmp1
	sbc tmp1
	sta tosend+1
	lda tosend+2
	sbc #0
	sta tosend+2
	ora tosend
	ora tosend+1
	bne @loop
@done:
@error:
	jsr CLRCHN
	rts
.segment "BSS"
tosend:
	.res 3
tmp1:
	.res 1