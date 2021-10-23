CC = iverilog
TARGET0 = parallel_serial_est.v
TARGET1 = serial_parallel_est.v
OUTPUT0 = s_p_p_s
OUTPUT1 = p_s_s_p.vcd
TESTBENCH0 = result_testbench.v

all:
	$(CC) -o $(OUTPUT0) $(TESTBENCH0)
	vvp $(OUTPUT0)
	gtkwave $(OUTPUT1)
synth:
	yosys -s serial_parallel.tcl
	sed -i 's/serial_parallel/serial_parallel_est/' $(TARGET1)
	sed -i 's/parallel_data/parallel_data_est/g' $(TARGET1)
	sed -i 's/valid_out/valid_outSP_est/g' $(TARGET1)
	yosys -s parallel_serial.tcl
	sed -i 's/parallel_serial/parallel_serial_est/' $(TARGET0)
	sed -i 's/parallel_data/parallel_data_est/g' $(TARGET0)
	sed -i 's/valid_out/valid_outPS_est/g' $(TARGET0)
	emacs --batch $(TESTBENCH0) -f verilog-batch-auto
clean:
	rm -f $(OUTPUT0)
	rm -f $(OUTPUT1)
	rm -f serial_parallel_est.v
	rm -f parallel_serial_est.v