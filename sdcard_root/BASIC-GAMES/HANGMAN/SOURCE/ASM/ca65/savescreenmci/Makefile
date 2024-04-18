PROGRAM := BVSAVEMCI.BIN
%.o: %.s
	cl65 -t cx16 -c -o $@ $<
$(PROGRAM): src/main.o
	cl65 -o $@ $^ -C src/cx16-asm.cfg
clean:
	$(RM) -f src/main.o $(PROGRAM) TEST.DAT
test: $(PROGRAM)
	x16emu -fsroot . -prg TEST.PRG -run