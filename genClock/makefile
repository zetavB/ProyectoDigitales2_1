CC = iverilog
TARGET6 = genClock.v
TARGET7 = genClock_est.v
OUTPUT0 = genClock
OUTPUT1 = genClock.vcd
TESTBENCH0 = testbench.v


all:
	yosys -s ../Sintesis/genClock.tcl
	sed -i 's/genClock/genClock_est/' $(TARGET7)
	sed -i 's/clk_f/clk_f_est/g' $(TARGET7)
	sed -i 's/clk_2f/clk_2f_est/g' $(TARGET7)
	sed -i 's/clk_4f/clk_4f_est/g' $(TARGET7)
	emacs --batch $(TESTBENCH0) -f verilog-batch-auto
	@echo "Compilando Verilog"
	$(CC) -o $(OUTPUT0) $(TESTBENCH0) 
	vvp $(OUTPUT0)
	@echo "Fin. Utilice <make wave> para generar onda del archivo."

wave:
	gtkwave $(OUTPUT1)

clean:
	rm -f $(TARGET7)
	rm -f $(OUTPUT0)
	rm -f $(OUTPUT1)
