CC = iverilog
TARGET1 = phy_tx_est.v
OUTPUT0 = txTest
OUTPUT1 = TxTest.vcd
TESTBENCH0 = BancoPruebaTx.v


all:
	@echo "Sintetizando..."
	yosys -s tx.tcl
	sed -i 's/phy_tx/phy_tx_est/' $(TARGET1)
	sed -i 's/out_tx_serial_0/out_tx_serial_0_est/g' $(TARGET1)
	sed -i 's/out_tx_serial_1/out_tx_serial_1_est/g' $(TARGET1)
	sed -i 's/conv32_8/conv32_8_est/g' $(TARGET1)
	sed -i 's/parallel_serial/parallel_serial_est/g' $(TARGET1)
	sed -i 's/stripe/stripe_est/g' $(TARGET1)
	sed -i 's/conversion0_tx/conversion0_tx_est/g' $(TARGET1)
	sed -i 's/conversion1_tx/conversion1_tx_est/g' $(TARGET1)
	sed -i 's/pToS0_tx/pToS0_tx_est/g' $(TARGET1)
	sed -i 's/pToS1_tx/pToS1_tx_est/g' $(TARGET1)
	sed -i 's/striping_tx/striping_tx_est/g' $(TARGET1)
	$(CC) -o $(OUTPUT0) $(TESTBENCH0) 
	vvp $(OUTPUT0)
	gtkwave $(OUTPUT1)

clean:
	rm -f $(OUTPUT0)
	rm -f $(OUTPUT1)
	rm -f $(TARGET1)
