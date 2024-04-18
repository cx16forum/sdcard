        pha
        phx
        ldx #0
loop:
        lda $9F2D,x
        pha
        lda $9F2D+7,x
        sta $9F2D,x
        pla
        sta $9F2D+7,x
        inx
        cpx #7  ;7 registers in a row
        bne loop
        plx
        pla
        rts
