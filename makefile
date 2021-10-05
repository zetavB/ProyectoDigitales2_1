CC = iverilog
TARGET0 = stripe.v
TARGET1 = stripe_est.v

all:
	@echo "Sintetizando stripe..."
	yosys -s stripe.tcl
	sed -i 's/stripe/stripe_est/' $(TARGET1)
	sed -i 's/lane0/lane0_est/g' $(TARGET1)
	sed -i 's/lane1/lane1_est/g' $(TARGET1)
	sed -i 's/valid0/valid0_est/g' $(TARGET1)
	sed -i 's/valid1/valid1_est/g' $(TARGET1)
clean:
	rm -f $(TARGET1)
