 *=$600
        ; GREEN-BLUE in A
        ; RED IN X 
        ;
        R0L=$02
        R15H = $21
        R15L = $20
        VERA_addr_low     = $9F20
        VERA_addr_high    = $9F21
        VERA_addr_bank    = $9F22
        VERA_data0        = $9F23

mainstart:
        LDA VERA_addr_high
        PHA
        LDA VERA_addr_low
        PHA
        LDA VERA_data0   ; READ GB
        LDX VERA_data0   ; READ R
        PHA              ; PUSH A 
        AND #$0F         ; A is now BLUE
        TAY              ; Y IS NOW BLUE
        BEQ skipbluedec
        DEY              ; DEC BLUE
skipbluedec:
        PLA              ; POP A  (ORIGINAL GB)
        LSR
        LSR
        LSR
        LSR              ; A is now Green
        BEQ skipgreendec
        DEA              ; DECREMENT GREEN
skipgreendec:
        ASL
        ASL
        ASL
        ASL               ; A IS NO G0
        STY R15L          ; 
        ORA R15L          ; A IS NOW GB DECREMENTED. 
        CPX #0
        BEQ skipreddec
        DEX               ; DEC RED 
skipreddec:
        TAY
        PLA
        STA VERA_addr_low
        PLA
        STA VERA_addr_high
stowit:
        STY VERA_data0
        STX VERA_data0
        DEC R0L
        LDX R0L
        CPX #$FF
        BNE mainstart
        RTS

