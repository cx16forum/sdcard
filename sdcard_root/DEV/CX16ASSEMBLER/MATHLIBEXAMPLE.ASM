; sourced from X16 Community Technical Reference (Math Library Usage)
; calculate how far an object has fallen:  d = 1/2 * g * t^2.
; we set g = 9.81 m/sec^2, time = 5 sec -> d = 122.625 m.
; use with CX16ASSEMBLER.PRG

CHROUT = $FFD2
FOUT   = $FE06
FMULTT = $FE21
FDIV   = $FE24
CONUPK = $FE5A
MOVFM  = $FE63

    .ORG $A000
    LDA  #4
    STA  $01         ; rom bank 4 (BASIC) contains the fp routines.
    LDA  #<FLT-TWO
    LDY  #>FLT-TWO
    JSR  MOVFM
    LDA  #<FLT-G
    LDY  #>FLT-G
    JSR  FDIV        ; FACC= g/2
    LDA  #<FLT-TIME
    LDY  #>FLT-TIME
    JSR  CONUPK      ; ARG = time
    JSR  FMULTT      ; FACC = g/2 * time
    LDA  #<FLT-TIME
    LDY  #>FLT-TIME
    JSR  CONUPK      ; again ARG = time
    JSR  FMULTT      ; FACC = g/2 * time * time
    JSR  FOUT        ; to string
    ; print string in AY
    STA  $02
    STY  $03
    LDY  #0
LOOP:
    LDA  ($02),Y
    BEQ  DONE
    JSR  CHROUT
    INY
    BNE  LOOP
DONE:
    RTS

FLT-G:
  .BYTE  $84, $1C, $F5, $C2, $8F  ; float 9.81
FLT-TIME:
  .BYTE  $83, $20, $00, $00, $00  ; float 5.0
FLT-TWO:
  .BYTE  $82, $00, $00, $00, $00  ; float 2.0
