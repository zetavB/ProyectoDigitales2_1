all: 
	yosys -s script
	sed -i 's/module phy_rx/module sintesis/' sintesis.v
	sed -i 's/module genClock/module genClock/' sintesis.v
	sed -i 's/module serial_parallel/module serial_parallel/' sintesis.v
	sed -i 's/module unstripe/module unstripe/' sintesis.v
	sed -i 's/module conv8_32/module conv8_32/' sintesis.v
	iverilog -o a.out testbench.v
	emacs -batch testbench.v -f verilog-auto -f save-buffer
	iverilog -o a.out testbench.v
	vvp a.out
	gtkwave phy_rx.vcd
