read_verilog conv8_32.v 
hierarchy -check -top conv8_32
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty cmos_cells.lib
abc -liberty cmos_cells.lib
clean
show  -lib cmos_cells.v conv8_32
write_verilog conv8_32_est.v
