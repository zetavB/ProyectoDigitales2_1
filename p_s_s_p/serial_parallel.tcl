read_verilog serial_parallel.v 
hierarchy -check -top serial_parallel
proc; opt; fsm; opt; memory; opt
techmap -map map.v; opt
dfflibmap -liberty cmos_cells.lib
abc -liberty cmos_cells.lib
clean
show  -lib cmos_cells.v serial_parallel
write_verilog serial_parallel_est.v
