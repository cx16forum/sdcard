; Build with: cl65 -o CLOCKSPEED.PRG -u __EXEHDR__ -t cx16 -C cx16-asm.cfg clockspeed.asm

setup:
    stz $01

    stz state
    stz counter
    stz counter+1
    
    sei
    
    lda $0314
    sta def_irq
    lda $0315
    sta def_irq+1

    lda #<cust_irq
    sta $0314
    lda #>cust_irq
    sta $0315

    cli

main:
    lda state               ;4
    beq main                ;2
    cmp #2                  ;2
    bcs exit                ;2

    clc                     ;2
    lda counter             ;4
    adc #1                  ;2
    sta counter             ;4
    lda counter+1           ;4
    adc #0                  ;2
    sta counter+1           ;4
    bra main                ;3  => 35 clock cycles
                            ;Expected result at 8 MHz: 8,000,000 / 60 / 35 = 3,809
                            ;Actual result: hardware 3,710, emulator 3,713 
                            ;Difference: 96 (2.52%), time spent in the the default IRQ handler?

exit:
    sei

    lda def_irq
    sta $0314
    lda def_irq+1
    sta $0315

    lda #$04
    sta $01

    cli

    rts

cust_irq:
    lda state
    cmp #2
    bcs :+
    inc state

:   ;VERA_ACK
    lda #1
	sta $9f27    ;ACK VERA VBLANK
    
    ;Return from IRQ
    ply
	plx
	pla
	rti  

def_irq:    .res 2
state:      .res 1
counter     = $2000