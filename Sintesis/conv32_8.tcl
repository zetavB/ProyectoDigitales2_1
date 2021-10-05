read_verilog conv32_8.v 
hierarchy -check -top conv32_8
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty cmos_cells.lib
abc -liberty cmos_cells.lib
clean
show  -lib cmos_cells.v conv32_8
write_verilog conv32_8_est.v
