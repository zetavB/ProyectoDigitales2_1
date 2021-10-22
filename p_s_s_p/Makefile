all:
	iverilog -o s_p_p_s.out result_testbench.v
	vvp s_p_p_s.out
	gtkwave p_s_s_p.vcd
clean:
	rm s_p_p_s.out
	rm p_s_s_p.vcd