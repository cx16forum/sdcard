.include "cbm_kernal.inc"
.include "cx16.inc"
MACPTR = $ff44

jmp main

lfn = 1         ; logical file number
dev = 8         ; device number (8=disk/SD card)
sa  = 2         ; channel number (0-1 are reserved)

.zeropage
ptr:            .res 2

.data
prompt:         .asciiz "enter filename:"

.bss
namebuf:        .res 81
dosmsg:         .res 80
filebuf:        .res 256

.code
main:           lda #<prompt
                ldx #>prompt
                jsr puts
                ; read filename; leaves things set up for SETNAM
                ; (length in A, pointer in XY)
                jsr getline

                ; set filename for OPEN
                jsr SETNAM

                ; set logical file number, device number, and secondary address
                ; for OPEN
                lda #lfn
                ldx #dev
                ldy #sa
                jsr SETLFS

                ; open the file
                jsr OPEN

                ; make sure open succeeded
                jsr check_dos_error
                beq read_file
                lda #<dosmsg
                ldx #>dosmsg
                jsr puts
                lda #$0d
                jsr CHROUT
                bra main

read_file:      ; select file for reading
                ldx #lfn
                jsr CHKIN

                ; read the file 255 bytes at a time using MACPTR
readloop:       lda #$ff
                ldx #<filebuf
                ldy #>filebuf
                clc
                jsr MACPTR
                phx                    ; chars read
                jsr READST             ; check for EOF
                pha
                lda #00
                sta filebuf,x          ; print it
                lda #<filebuf
                ldx #>filebuf
                jsr puts
                pla
                plx
                and #$40               ; done if we hit EOF
                bne done
                cpx #$ff               ; if we read all 255 chars
                bcs readloop           ; go back for more
done:           ldx #lfn               ; close the file
                jsr CLOSE
                jmp CLALL              ; reset input back to console


; print a zero-terminated string passed in A(lo) and X(hi)
puts:           sta ptr
                stx ptr+1
                ldy #$00
puts_loop:      lda (ptr),y
                beq @done
                jsr CHROUT
                iny
                bne puts_loop
@done:          rts

; read a line of input from the user; return pointer in XY and
; length in A
getline:        ldy #00
keyloop:        jsr CHRIN
                cmp #$0d
                beq @done
                sta namebuf,y
                iny
                bne keyloop
@done:          jsr CHROUT
                lda #$00
                sta namebuf,y
                tya
                ldx #<namebuf
                ldy #>namebuf
                rts

; check disk command channel (15) for error; Z=no error.
check_dos_error:
                lda #$0f
                ldx #$08
                ldy #$0f
                jsr SETLFS
                lda #$00
                jsr SETNAM
                jsr OPEN
                ldx #$0f
                jsr CHKIN
                jsr GETIN
                cmp #'0'
                bne error
                ldx #$0f
                jsr CLOSE
                lda #$00
                jmp ret
error:          sta dosmsg
                ldy #$01
errloop:        jsr GETIN
                beq @done
                cmp #$0d
                beq @done

                sta dosmsg,y
                iny
                bne errloop
@done:          lda #$00
                sta dosmsg,y
                ldx #$0f
                jsr CLOSE
                jsr CLALL
                lda #$01
ret:            rts
