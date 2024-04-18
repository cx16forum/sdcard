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
        LDA VERA_data0   ; READ GB
        LDX VERA_data0   ; READ R
        PHA              ; PUSH A 
        AND #$0F         ; A is now BLUE
        TAY              ; Y IS NOW BLUE
        BEQ skipbluedec
        PLA              ; POP A  (ORIGINAL GB)
        LSR
        LSR
        LSR
        LSR              ; A is now Green
        RTS

