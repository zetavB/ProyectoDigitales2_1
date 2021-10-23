all: 
	yosys -s script
	sed -i 's/module phy_rx/module sintesis/' sintesis.v
	sed -i 's/module genClock/module genClock_est/' sintesis.v
	sed -i 's/module serial_parallel/module serial_parallel_est/' sintesis.v
	sed -i 's/module unstripe/module unstripe_est/' sintesis.v
	sed -i 's/module conv8_32/module conv8_32_est/' sintesis.v
	iverilog -o RxTest testbench_rx.v
	vvp RxTest
	gtkwave phy_rx.vcd
clean:
	rm RxTest
	rm phy_rx.vcd
	rm sintesis.v