CC = iverilog
TARGET0 = stripe.v
OUTPUT0 = phyTest
OUTPUT1 = phyTest.vcd
TESTBENCH0 = BancoPruebaPhy.v

all:
	$(CC) -o $(OUTPUT0) $(TESTBENCH0) 
	vvp $(OUTPUT0)
	gtkwave $(OUTPUT1)
clean:
	rm -f $(OUTPUT0)
	rm -f $(OUTPUT1)
