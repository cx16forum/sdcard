.segment "STARTUP"
.segment "INIT"
.segment "ONCE"
.segment "CODE"

IRQVECTOR = $0314
VERA_IEN  = $9F26
VERA_ISR  = $9F27

count		= $30		; $30-$31 used for counter
irq_trigged	= $32		; Var to indicate when irq has happened
oldhandler	= $33		; Holding address of original irq handler

setup:
	stz	count		; Ensure our count variable is zero
	stz	count+1
	stz	irq_trigged	; Ensure trigger variable is zero

	; Save original interrupt vector address
	lda	IRQVECTOR
	sta	oldhandler
	lda	IRQVECTOR+1
	sta	oldhandler+1

	; Install new interrupt handler
	sei
	lda	#<vera_tick
	sta	IRQVECTOR
	lda	#>vera_tick
	sta	IRQVECTOR+1
	cli

	; Wait for an interrupt to ensure that we start the timing at
	; the beginning of an interrupt
firstwait:
	wai
	lda	irq_trigged
	beq	firstwait
	stz	irq_trigged

	; Now we do as many counts as we can until next interrupt
timing:
	inc	count+1
	bne	:+
	inc	count
:	lda	irq_trigged
	beq	timing

	; Uninstall interrupt handler
	sei			; Disable interrupts
	lda	oldhandler
	sta	IRQVECTOR
	lda	oldhandler+1
	sta	IRQVECTOR+1
	cli			; Enable interrupts

	lda	count
	jsr	printhex
	lda	count+1
	jmp	printhex

	; Ensure irq_trigged is non-zero when irq happens
vera_tick:
	lda	VERA_ISR
	and	#1		; Is this VSYNC?
	beq	:+		; if not, end
	sta	irq_trigged
:	jmp	(oldhandler)

	; Print the content of .A as hexnumber
printhex:
	pha
	lsr
	lsr
	lsr
	lsr
	jsr	prhex
	pla
prhex:
	and	#$0F
	ora	#$30
	cmp	#$3A
	bcc	doprint
	adc	#6
doprint:
	jmp	$FFD2
  