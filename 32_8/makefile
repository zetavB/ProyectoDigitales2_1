CC = iverilog
TARGET6 = conv32_8.v
TARGET7 = conv32_8_est.v
OUTPUT0 = 32_8
OUTPUT1 = 32_8.vcd
TESTBENCH0 = testbench.v


all:
	yosys -s ../Sintesis/conv32_8.tcl
	sed -i 's/conv32_8/conv32_8_est/' $(TARGET7)
	sed -i 's/out8/out8_est/g' $(TARGET7)
	sed -i 's/out_data8/out_data8_est/g' $(TARGET7)
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
