CC = iverilog
TARGET0 = stripe.v
TARGET1 = stripe_est.v
TARGET2 = unstripe.v
TARGET3 = unstripe_est.v

all:
	@echo "Sintetizando stripe..."
	yosys -s stripe.tcl
	sed -i 's/stripe/stripe_est/' $(TARGET1)
	sed -i 's/lane0/lane0_est/g' $(TARGET1)
	sed -i 's/lane1/lane1_est/g' $(TARGET1)
	sed -i 's/valid0/valid0_est/g' $(TARGET1)
	sed -i 's/valid1/valid1_est/g' $(TARGET1)
	@echo "Sintetizando unstripe..."
	yosys -s unstripe.tcl
	sed -i 's/unstripe/unstripe_est/' $(TARGET3)
	sed -i 's/dataOut/dataOut_est/g' $(TARGET3)
	sed -i 's/validOut/validOut_est/g' $(TARGET3)
clean:
	rm -f $(TARGET1)
	rm -f $(TARGET3)
