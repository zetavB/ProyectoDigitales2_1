read_verilog parallel_serial.v 
hierarchy -check -top parallel_serial
proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty cmos_cells.lib
abc -liberty cmos_cells.lib
clean
show  -lib cmos_cells.v parallel_serial
write_verilog parallel_serial_est.v
