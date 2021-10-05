CC = iverilog
TARGET0 = stripe.v
TARGET1 = stripe_est.v
TARGET2 = unstripe.v
TARGET3 = unstripe_est.v
OUTPUT0 = stripingTest
OUTPUT1 = stripingTest.vcd
TESTBENCH0 = BancoPruebaStriping.v

all:
	@echo "Sintetizando stripe..."
	yosys -s ../Sintesis/stripe.tcl
	sed -i 's/stripe/stripe_est/' $(TARGET1)
	sed -i 's/lane0/lane0_est/g' $(TARGET1)
	sed -i 's/lane1/lane1_est/g' $(TARGET1)
	sed -i 's/valid0/valid0_est/g' $(TARGET1)
	sed -i 's/valid1/valid1_est/g' $(TARGET1)
	@echo "Sintetizando unstripe..."
	yosys -s ../Sintesis/unstripe.tcl
	sed -i 's/unstripe/unstripe_est/' $(TARGET3)
	sed -i 's/dataOut/dataOut_est/g' $(TARGET3)
	sed -i 's/validOut/validOut_est/g' $(TARGET3)
	@echo "Realizando auto-instanciación..."
	emacs --batch $(TESTBENCH0) -f verilog-batch-auto
	@echo "Compilando Verilog"
	$(CC) -o $(OUTPUT0) $(TESTBENCH0)
	vvp $(OUTPUT0)
	@echo "Fin. Utilice <make wave> para generar onda del archivo."

wave:
	gtkwave $(OUTPUT1)

clean:
	rm -f $(TARGET1)
	rm -f $(TARGET3)
	rm -f $(OUTPUT0)
	rm -f $(OUTPUT1)
