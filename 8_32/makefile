CC = iverilog
TARGET6 = conv8_32.v
TARGET7 = conv8_32_est.v
OUTPUT0 = 8_32
OUTPUT1 = 8_32.vcd
TESTBENCH0 = testbench.v


all:
	@echo "Sintetizando conv8_32..."
	yosys -s ../Sintesis/conv8_32.tcl
	sed -i 's/conv8_32/conv8_32_est/' $(TARGET7)
	sed -i 's/out32/out32_est/g' $(TARGET7)
	sed -i 's/out_data32/out_data32_est/g' $(TARGET7)
	@echo "Realizando auto-instanciación..."
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
