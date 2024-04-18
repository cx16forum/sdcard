RDTIM = $FFDE
SCREEN_MODE = $FF5F
VERA_addr_lo  = $9F20
VERA_addr_med = $9F21
VERA_addr_hi = $9F22
VERA_data0 = $9F23

           PHY
           PHX
           PHA
           LDA #$FA
           STA VERA_addr_med
           LDA #%00010001
           STA VERA_addr_hi
           LDA #$00
           STA VERA_addr_lo
           LDX #4
loop1:     
           LDY #128
loop2:     
           STA VERA_data0
           DEY
           BNE loop2
           DEX
           BNE loop1
           JSR RDTIM
           STA FRC
vloop:     
           WAI
           JSR RDTIM
           CMP #$FF
 FRC = * -1
           BEQ vloop 


           PLA
           CLC
           JSR SCREEN_MODE
           PLX
           PLY
           RTS

