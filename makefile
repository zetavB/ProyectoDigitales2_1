CC = iverilog
TARGET0 = stripe.v
TARGET1 = stripe_est.v
TARGET2 = unstripe.v
TARGET3 = unstripe_est.v
TARGET4 = genClock.v
TARGET5 = genClock_est.v
TARGET6 = conv8_32.v
TARGET7 = conv8_32_est.v
TARGET8 = conv32_8.v
TARGET9 = conv32_8_est.v
OUTPUT0 = stripingTest
OUTPUT1 = stripingTest.vcd
TESTBENCH0 = BancoPruebaStriping.v


all:
	@echo "Sintetizando stripe..."
	yosys -s ./Sintesis/stripe.tcl
	sed -i 's/stripe/stripe_est/' $(TARGET1)
	sed -i 's/lane0/lane0_est/g' $(TARGET1)
	sed -i 's/lane1/lane1_est/g' $(TARGET1)
	sed -i 's/valid0/valid0_est/g' $(TARGET1)
	sed -i 's/valid1/valid1_est/g' $(TARGET1)
	@echo "Sintetizando unstripe..."
	yosys -s ./Sintesis/unstripe.tcl
	sed -i 's/unstripe/unstripe_est/' $(TARGET3)
	sed -i 's/dataOut/dataOut_est/g' $(TARGET3)
	sed -i 's/validOut/validOut_est/g' $(TARGET3)
	sed -i 's/uvalid0/uvalid0_est/g' $(TARGET3)
	sed -i 's/uvalid1/uvalid1_est/g' $(TARGET3)
	sed -i 's/ulane0/ulane0_est/g' $(TARGET3)
	sed -i 's/ulane1/ulane1_est/g' $(TARGET3)
	@echo "Sintetizando genClock..."
	yosys -s ./Sintesis/genClock.tcl
	sed -i 's/genClock/genClock_est/' $(TARGET5)
	sed -i 's/clk_f/clk_f_est/g' $(TARGET5)
	sed -i 's/clk_2f/clk_2f_est/g' $(TARGET5)
	sed -i 's/clk_4f/clk_4f_est/g' $(TARGET5)
	@echo "Sintetizando conv8_32..."
	yosys -s ./Sintesis/conv8_32.tcl
	sed -i 's/conv8_32/conv8_32_est/' $(TARGET7)
	sed -i 's/out32/out32_est/g' $(TARGET7)
	sed -i 's/out_data32/out_data32_est/g' $(TARGET7)
	@echo "Sintetizando conv32_8..."
	yosys -s ./Sintesis/conv32_8.tcl
	sed -i 's/conv32_8/conv32_8_est/' $(TARGET9)
	sed -i 's/out8/out8_est/g' $(TARGET9)
	sed -i 's/out_data8/out_data8_est/g' $(TARGET9)
stripe:
	@echo "Sintetizando stripe..."
	yosys -s ./Sintesis/stripe.tcl
	sed -i 's/stripe/stripe_est/' $(TARGET1)
	sed -i 's/lane0/lane0_est/g' $(TARGET1)
	sed -i 's/lane1/lane1_est/g' $(TARGET1)
	sed -i 's/valid0/valid0_est/g' $(TARGET1)
	sed -i 's/valid1/valid1_est/g' $(TARGET1)
	@echo "Sintetizando unstripe..."
	yosys -s ./Sintesis/unstripe.tcl
	sed -i 's/unstripe/unstripe_est/' $(TARGET3)
	sed -i 's/dataOut/dataOut_est/g' $(TARGET3)
	sed -i 's/validOut/validOut_est/g' $(TARGET3)
	sed -i 's/valid0/valid0_est/g' $(TARGET3)
	sed -i 's/valid1/valid1_est/g' $(TARGET3)
	sed -i 's/lane0/lane0_est/g' $(TARGET3)
	sed -i 's/lane1/lane1_est/g' $(TARGET3)
	$(CC) -I StripingTests/ -o $(OUTPUT0) $(TESTBENCH0) 
	vvp $(OUTPUT0)
	gtkwave $(OUTPUT1)

clean:
	rm -f $(TARGET1)
	rm -f $(TARGET3)
	rm -f $(TARGET5)
	rm -f $(TARGET7)
	rm -f $(TARGET9)
	rm -f $(OUTPUT0)
	rm -f $(OUTPUT1)
