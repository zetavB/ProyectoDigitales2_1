CC = iverilog
OUTPUT0 = txTest
OUTPUT1 = TxTest.vcd
TESTBENCH0 = BancoPruebaTx.v


all:
	@echo "Sintetizando conv32_8..."

tx:
	$(CC) -o $(OUTPUT0) $(TESTBENCH0) 
	vvp $(OUTPUT0)
	gtkwave $(OUTPUT1)

clean:
	rm -f $(OUTPUT0)
	rm -f $(OUTPUT1)
